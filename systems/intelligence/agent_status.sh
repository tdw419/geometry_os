#!/bin/bash
#
# agent_status.sh - Unified status dashboard for all GeometryOS agents
#
# Usage:
#   ./agent_status.sh          - Show status of all agents
#   ./agent_status.sh watch    - Continuously refresh status (Ctrl+C to exit)
#   ./agent_status.sh json     - Output status as JSON
#

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"

# Agent configurations (name, pid_file, heartbeat_file)
declare -A AGENT_PIDS
declare -A AGENT_HEARTBEATS

# DirectiveAgent
AGENT_PIDS["DirectiveAgent"]="${SCRIPT_DIR}/directive_agent.pid"
AGENT_HEARTBEATS["DirectiveAgent"]="${SCRIPT_DIR}/directive_heartbeat.json"

# RtsWatcherAgent
AGENT_PIDS["RtsWatcherAgent"]="${SCRIPT_DIR}/rts_watcher_agent.pid"
AGENT_HEARTBEATS["RtsWatcherAgent"]="${PROJECT_ROOT}/.geometry/rts_watcher_heartbeat.json"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Check if agent is running (returns 0 if running, 1 if not)
check_agent_running() {
    local pid_file="$1"
    if [ -f "$pid_file" ]; then
        local pid=$(cat "$pid_file")
        if ps -p "$pid" > /dev/null 2>&1; then
            return 0
        fi
    fi
    return 1
}

# Get PID of agent (returns empty string if not running)
get_agent_pid() {
    local pid_file="$1"
    if [ -f "$pid_file" ]; then
        local pid=$(cat "$pid_file")
        if ps -p "$pid" > /dev/null 2>&1; then
            echo "$pid"
            return
        fi
    fi
    echo ""
}

# Parse heartbeat JSON and output formatted status
parse_heartbeat() {
    local agent_name="$1"
    local heartbeat_file="$2"
    local is_running="$3"

    if [ ! -f "$heartbeat_file" ]; then
        echo "  Heartbeat: ${YELLOW}(no heartbeat file)${NC}"
        return
    fi

    python3 -c "
import json
import sys
from datetime import datetime

try:
    with open('$heartbeat_file', 'r') as f:
        data = json.load(f)

    running = data.get('running', False)
    pid = data.get('pid', 'N/A')
    uptime = data.get('uptime_seconds', 0)
    timestamp = data.get('timestamp', 'N/A')

    # Agent-specific metrics
    if '$agent_name' == 'DirectiveAgent':
        processed = data.get('directives_processed', 0)
        metric_label = 'Directives Processed'
        metric_value = processed
    else:
        files_ingested = data.get('files_ingested', 0)
        files_skipped = data.get('files_skipped', 0)
        errors = data.get('errors', 0)
        metric_label = 'Files Ingested'
        metric_value = files_ingested

    # Format uptime
    if uptime >= 3600:
        uptime_str = f'{uptime/3600:.1f}h'
    elif uptime >= 60:
        uptime_str = f'{uptime/60:.1f}m'
    else:
        uptime_str = f'{uptime:.0f}s'

    # Output
    print(f'  Heartbeat: {timestamp}')
    print(f'  PID: {pid} | Uptime: {uptime_str}')
    print(f'  {metric_label}: {metric_value}', end='')

    if '$agent_name' == 'RtsWatcherAgent' and (files_skipped > 0 or errors > 0):
        print(f' | Skipped: {files_skipped} | Errors: {errors}', end='')

    print()

except Exception as e:
    print(f'  Heartbeat: {sys.stderr}')
" 2>/dev/null || echo "  Heartbeat: ${YELLOW}(parse error)${NC}"
}

# Generate JSON output
generate_json() {
    python3 -c "
import json
import os
from datetime import datetime

agents_config = {
    'DirectiveAgent': {
        'pid_file': '${SCRIPT_DIR}/directive_agent.pid',
        'heartbeat_file': '${SCRIPT_DIR}/directive_heartbeat.json'
    },
    'RtsWatcherAgent': {
        'pid_file': '${SCRIPT_DIR}/rts_watcher_agent.pid',
        'heartbeat_file': '${PROJECT_ROOT}/.geometry/rts_watcher_heartbeat.json'
    }
}

status = {'agents': [], 'summary': {'running': 0, 'stopped': 0, 'total': 0}}

for name, config in agents_config.items():
    agent_status = {'name': name, 'running': False, 'pid': None, 'heartbeat': None}

    # Check if running
    pid_file = config['pid_file']
    if os.path.exists(pid_file):
        try:
            with open(pid_file) as f:
                pid = int(f.read().strip())
            # Check if process exists
            os.kill(pid, 0)
            agent_status['running'] = True
            agent_status['pid'] = pid
        except (ValueError, ProcessLookupError, PermissionError):
            pass

    # Read heartbeat
    heartbeat_file = config['heartbeat_file']
    if os.path.exists(heartbeat_file):
        try:
            with open(heartbeat_file) as f:
                agent_status['heartbeat'] = json.load(f)
        except:
            pass

    status['agents'].append(agent_status)
    status['summary']['total'] += 1
    if agent_status['running']:
        status['summary']['running'] += 1
    else:
        status['summary']['stopped'] += 1

print(json.dumps(status, indent=2))
"
}

# Display status dashboard
show_status() {
    local now=$(date '+%Y-%m-%d %H:%M:%S')

    # Header
    echo ""
    echo -e "${BOLD}${CYAN}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${CYAN}║          GEOMETRY OS - Agent Status Dashboard                 ║${NC}"
    echo -e "${BOLD}${CYAN}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "  ${BLUE}Timestamp:${NC} $now"
    echo ""

    local running_count=0
    local stopped_count=0

    # Process each agent
    for agent_name in "DirectiveAgent" "RtsWatcherAgent"; do
        local pid_file="${AGENT_PIDS[$agent_name]}"
        local heartbeat_file="${AGENT_HEARTBEATS[$agent_name]}"

        # Agent header
        echo -e "${BOLD}┌─ ${agent_name} ${NC}"

        if check_agent_running "$pid_file"; then
            local pid=$(get_agent_pid "$pid_file")
            echo -e "│ Status:   ${GREEN}RUNNING${NC} (PID: $pid)"
            running_count=$((running_count + 1))
        else
            echo -e "│ Status:   ${RED}STOPPED${NC}"
            stopped_count=$((stopped_count + 1))
        fi

        # Heartbeat info
        parse_heartbeat "$agent_name" "$heartbeat_file" "$?"

        echo -e "${BOLD}└─────────────────────────────────────────${NC}"
        echo ""
    done

    # Summary
    echo -e "${BOLD}Summary:${NC}"
    echo -e "  Running: ${GREEN}$running_count${NC} | Stopped: ${RED}$stopped_count${NC}"
    echo ""

    # Footer with controls
    echo -e "${CYAN}Controls:${NC}"
    echo -e "  ${BLUE}./agent_status.sh watch${NC}  - Auto-refresh every 5s"
    echo -e "  ${BLUE}./agent_status.sh json${NC}   - JSON output for scripting"
    echo ""
}

# Watch mode - refresh every 5 seconds
watch_status() {
    echo -e "${CYAN}Starting watch mode (Ctrl+C to exit)...${NC}"
    echo ""

    while true; do
        # Clear screen and show status
        clear
        show_status
        sleep 5
    done
}

# Main
case "${1:-status}" in
    status|"")
        show_status
        ;;
    watch|-w)
        watch_status
        ;;
    json|-j)
        generate_json
        ;;
    help|--help|-h)
        echo "Agent Status Dashboard"
        echo ""
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  status    Show current status of all agents (default)"
        echo "  watch     Continuously refresh status every 5 seconds"
        echo "  json      Output status as JSON for scripting"
        echo "  help      Show this help message"
        echo ""
        echo "Monitored Agents:"
        echo "  - DirectiveAgent (directive_ctl.sh)"
        echo "  - RtsWatcherAgent (rts_watcher_ctl.sh)"
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo "Run '$0 help' for usage"
        exit 1
        ;;
esac
