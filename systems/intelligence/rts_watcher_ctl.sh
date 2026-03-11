#!/bin/bash
#
# rts_watcher_ctl.sh - Control script for the RTS Watcher Agent
#
# Usage:
#   ./rts_watcher_ctl.sh start     - Start the daemon
#   ./rts_watcher_ctl.sh stop      - Stop the daemon
#   ./rts_watcher_ctl.sh status    - Check daemon status
#   ./rts_watcher_ctl.sh tail      - Follow daemon logs
#   ./rts_watcher_ctl.sh scan      - Process one scan cycle and exit
#   ./rts_watcher_ctl.sh restart   - Restart the daemon
#

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
export PYTHONPATH="${PROJECT_ROOT}:${PYTHONPATH}"
DAEMON_SCRIPT="${SCRIPT_DIR}/rts_watcher_agent.py"
PID_FILE="${SCRIPT_DIR}/rts_watcher_agent.pid"
HEARTBEAT_FILE="${PROJECT_ROOT}/.geometry/rts_watcher_heartbeat.json"
LOG_DIR="${SCRIPT_DIR}/logs/rts_watcher"
LOG_FILE="${LOG_DIR}/rts_watcher_agent.log"

# Default options
INTERVAL=${RTS_WATCHER_POLL_INTERVAL:-30}
WP_URL=${WP_URL:-"http://localhost:8080/index.php?rest_route=/geometry-os/v1"}
WATCH_DIR=${RTS_WATCH_DIR:-"${PROJECT_ROOT}/rts_files"}

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

log_info_blue() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

check_daemon_running() {
    if [ -f "$PID_FILE" ]; then
        local pid=$(cat "$PID_FILE")
        if ps -p "$pid" > /dev/null 2>&1; then
            return 0
        else
            # Stale PID file
            rm -f "$PID_FILE"
            return 1
        fi
    fi
    return 1
}

get_pid() {
    if [ -f "$PID_FILE" ]; then
        cat "$PID_FILE"
    else
        echo ""
    fi
}

wait_for_daemon() {
    local max_wait=${1:-30}
    local waited=0
    while [ $waited -lt $max_wait ]; do
        if check_daemon_running; then
            return 0
        fi
        sleep 1
        waited=$((waited + 1))
    done
    return 1
}

wait_for_shutdown() {
    local max_wait=${1:-30}
    local waited=0
    while [ $waited -lt $max_wait ]; do
        if ! check_daemon_running; then
            return 0
        fi
        sleep 1
        waited=$((waited + 1))
    done
    return 1
}

# Commands
cmd_start() {
    log_info "Starting RTS Watcher Agent..."

    if check_daemon_running; then
        log_warn "Daemon is already running (PID: $(get_pid))"
        return 0
    fi

    # Ensure log directory exists
    mkdir -p "$LOG_DIR"

    # Ensure heartbeat directory exists
    mkdir -p "$(dirname "$HEARTBEAT_FILE")"

    # Ensure watch directory exists
    mkdir -p "$WATCH_DIR"

    # Start daemon in background
    nohup python3 "$DAEMON_SCRIPT" \
        --wp-url "$WP_URL" \
        --watch-dir "$WATCH_DIR" \
        --poll-interval "$INTERVAL" \
        --heartbeat "$HEARTBEAT_FILE" \
        > "$LOG_FILE" 2>&1 &

    local pid=$!
    echo $pid > "$PID_FILE"

    # Wait for daemon to start
    sleep 2

    if check_daemon_running; then
        log_info "RTS Watcher Agent started (PID: $pid)"
        log_info "Watch Dir: $WATCH_DIR"
        log_info "Heartbeat: $HEARTBEAT_FILE"
        log_info "Logs: $LOG_FILE"
    else
        log_error "Failed to start RTS Watcher Agent"
        rm -f "$PID_FILE"
        exit 1
    fi
}

cmd_stop() {
    log_info "Stopping RTS Watcher Agent..."

    if ! check_daemon_running; then
        log_warn "Daemon is not running"
        rm -f "$PID_FILE"
        return 0
    fi

    local pid=$(get_pid)

    # Send SIGTERM for graceful shutdown
    kill -TERM "$pid" 2>/dev/null

    # Wait for graceful shutdown
    if wait_for_shutdown 30; then
        log_info "RTS Watcher Agent stopped gracefully"
        rm -f "$PID_FILE"
    else
        log_warn "Daemon did not stop gracefully, sending SIGKILL..."
        kill -KILL "$pid" 2>/dev/null
        sleep 1
        rm -f "$PID_FILE"
        log_info "RTS Watcher Agent stopped (forced)"
    fi
}

cmd_status() {
    log_info_blue "RTS Watcher Agent Status"
    echo ""

    if check_daemon_running; then
        local pid=$(get_pid)
        echo -e "Status:    ${GREEN}RUNNING${NC}"
        echo "PID:       $pid"
    else
        echo -e "Status:    ${RED}STOPPED${NC}"
    fi

    echo ""

    # Show heartbeat info if available
    if [ -f "$HEARTBEAT_FILE" ]; then
        echo "Heartbeat:"
        python3 -c "
import json
import sys
from datetime import datetime

try:
    with open('$HEARTBEAT_FILE', 'r') as f:
        data = json.load(f)

    print(f\"  Timestamp: {data.get('timestamp', 'N/A')}\")
    print(f\"  Running: {data.get('running', False)}\")
    print(f\"  PID: {data.get('pid', 'N/A')}\")
    uptime = data.get('uptime_seconds', 0)
    print(f\"  Uptime: {uptime:.0f}s ({uptime/60:.1f}m)\")
    print(f\"  Files Ingested: {data.get('files_ingested', 0)}\")

except Exception as e:
    print(f'  Error reading heartbeat: {e}')
" 2>/dev/null || echo "  (Could not parse heartbeat file)"
    else
        echo "Heartbeat: (not available)"
    fi
}

cmd_tail() {
    if [ ! -f "$LOG_FILE" ]; then
        log_warn "Log file not found: $LOG_FILE"
        log_info "Daemon may not have started yet, or logs are in a different location"
        exit 1
    fi

    log_info "Following logs (Ctrl+C to exit)..."
    echo ""
    tail -f "$LOG_FILE"
}

cmd_restart() {
    log_info "Restarting RTS Watcher Agent..."
    cmd_stop
    sleep 2
    cmd_start
}

cmd_scan() {
    log_info "Processing one scan cycle..."
    python3 "$DAEMON_SCRIPT" \
        --wp-url "$WP_URL" \
        --watch-dir "$WATCH_DIR" \
        --once
}

cmd_help() {
    echo "RTS Watcher Agent Control Script"
    echo ""
    echo "Usage: $0 <command> [options]"
    echo ""
    echo "Commands:"
    echo "  start       Start the daemon in background"
    echo "  stop        Stop the daemon gracefully"
    echo "  status      Check daemon status"
    echo "  tail        Follow daemon logs"
    echo "  scan        Process one scan cycle and exit"
    echo "  restart     Restart the daemon"
    echo "  help        Show this help message"
    echo ""
    echo "Environment Variables:"
    echo "  RTS_WATCHER_POLL_INTERVAL  Seconds between polls (default: 30)"
    echo "  RTS_WATCH_DIR              Directory to watch for .rts.png files (default: ${PROJECT_ROOT}/rts_files)"
    echo "  WP_URL                     WordPress API URL (default: http://localhost:8080/index.php?rest_route=/geometry-os/v1)"
    echo ""
    echo "Files:"
    echo "  PID File:    $PID_FILE"
    echo "  Heartbeat:   $HEARTBEAT_FILE"
    echo "  Log File:    $LOG_FILE"
}

# Main
case "${1:-help}" in
    start)
        cmd_start
        ;;
    stop)
        cmd_stop
        ;;
    status)
        cmd_status
        ;;
    tail)
        cmd_tail
        ;;
    scan)
        cmd_scan
        ;;
    restart)
        cmd_restart
        ;;
    help|--help|-h)
        cmd_help
        ;;
    *)
        log_error "Unknown command: $1"
        cmd_help
        exit 1
        ;;
esac
