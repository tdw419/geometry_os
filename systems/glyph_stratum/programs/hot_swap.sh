#!/bin/bash
# Hot-swap helper for Ouroboros Daemon
# Usage: ./hot_swap.sh <command> [args]
#
# Commands:
#   glyph <path>              Load a .rts.png glyph image
#   binary <path> [offset]    Load raw binary at offset (default: 0x8000)
#   status                    Check daemon status

DAEMON_URL="http://127.0.0.1:8769"

case "$1" in
    glyph)
        if [ -z "$2" ]; then
            echo "Usage: $0 glyph <path.rts.png>"
            exit 1
        fi
        echo "Loading glyph: $2"
        curl -s -X POST "$DAEMON_URL/load" -d "$2"
        ;;

    binary)
        if [ -z "$2" ]; then
            echo "Usage: $0 binary <path> [offset]"
            exit 1
        fi
        OFFSET="${3:-0x8000}"
        echo "Loading binary: $2 at offset $OFFSET"
        curl -s -X POST "$DAEMON_URL/load?binary=$OFFSET" -d "$2"
        ;;

    status)
        echo "Checking daemon status..."
        if curl -s --connect-timeout 2 "$DAEMON_URL/" > /dev/null 2>&1; then
            echo "✓ Daemon is running"
        else
            echo "✗ Daemon not responding"
            echo "Start with: cargo run --release --bin gpu_dev_daemon"
        fi
        ;;

    *)
        echo "Ouroboros Hot-Swap Helper"
        echo ""
        echo "Usage: $0 <command> [args]"
        echo ""
        echo "Commands:"
        echo "  glyph <path>              Load a .rts.png glyph image"
        echo "  binary <path> [offset]    Load raw binary at offset (default: 0x8000)"
        echo "  status                    Check daemon status"
        echo ""
        echo "Examples:"
        echo "  $0 glyph qemu_riscv.rts.png"
        echo "  $0 binary /tmp/hello_geos.riscv.bin"
        echo "  $0 binary /tmp/kernel.bin 0x8000"
        ;;
esac
