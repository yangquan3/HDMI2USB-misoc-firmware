#!/bin/bash

set -x
set -e

echo ""
echo ""
echo ""
echo "- Fetching non shallow to get git version"
echo "---------------------------------------------"
git fetch --unshallow && git fetch --tags
GIT_REVISION=`git describe`
echo "============================================="

# Run the script once to check it works
time scripts/get-env.sh
# Run the script again to check it doesn't break things
time scripts/get-env.sh

set +x
set +e
. scripts/setup-env.sh
