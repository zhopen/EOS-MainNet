#!/bin/bash
################################################################################
#
# Scrip Created by http://CryptoLions.io
# For EOS mainnet
#
# https://github.com/CryptoLions/EOS-MainNet
#
###############################################################################

DATADIR="/opt/EOS-MainNet/data"
CONFIGDIR="/opt/EOS-MainNet"
#NODEOSBINDIR="/home/eos-sources/eos/build/programs"
NODEOSBINDIR=/usr/bin

mkdir -p $DATADIR
`dirname $0`/stop.sh
echo -e "Starting Nodeos \n";

ulimit -c unlimited
ulimit -n 65535
ulimit -s 64000

$NODEOSBINDIR/nodeos --data-dir $DATADIR --config-dir $CONFIGDIR "$@" > $DATADIR/stdout.txt 2> $DATADIR/stderr.txt &  echo $! > $DATADIR/nodeos.pid
