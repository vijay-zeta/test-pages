#!/bin/bash
# Usage: ./push-publish.sh <filename>
# Example: ./push-publish.sh global-tag-prod-publish.html

set -e

FILE="${1}"
TOKEN="${GITHUB_TOKEN:-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}"
REPO="vijay-zeta/test-pages"
BRANCH="main"

if [ -z "$FILE" ]; then
  echo "Usage: ./push-publish.sh <filename>"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  echo "Error: File '$FILE' not found."
  exit 1
fi

cd "$(dirname "$0")"

git remote set-url origin "https://vijay-zeta:${TOKEN}@github.com/${REPO}.git"
git add "$FILE"
git commit -m "Publish $FILE" || echo "Nothing new to commit."
git push origin "$BRANCH"

echo ""
echo "Published! Page will be live at:"
echo "https://vijay-zeta.github.io/test-pages/$FILE"
