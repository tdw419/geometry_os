# WordPress Evolution Bridge

Autonomous WordPress content evolution through analysis, proposal, and execution.

## Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                     WordPress Evolution Bridge                           │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                          │
│  ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐  │
│  │ ContentAnalyzer  │───>│  EvolutionAgent  │───>│ ActionExecutor   │  │
│  │                  │    │                  │    │                  │  │
│  │ - Read posts     │    │ - Run cycles     │    │ - Execute cmds   │  │
│  │ - Analyze content│    │ - Generate props │    │ - Via Playwright │  │
│  │ - Score issues   │    │ - Track history  │    │ - WebSocket conn │  │
│  └──────────────────┘    └──────────────────┘    └──────────────────┘  │
│           │                      │                       │              │
│           └──────────────────────┼───────────────────────┘              │
│                                  │                                      │
│                    ┌─────────────▼─────────────┐                        │
│                    │     BridgeService         │                        │
│                    │                           │                        │
│                    │ - Coordinate components   │                        │
│                    │ - Filter by confidence    │                        │
│                    │ - Optional memory sync    │                        │
│                    └─────────────┬─────────────┘                        │
│                                  │                                      │
└──────────────────────────────────┼──────────────────────────────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │       Visual Bridge         │
                    │      (WebSocket Hub)        │
                    │       Port 8768             │
                    └──────────────┬──────────────┘
                                   │
          ┌────────────────────────┼────────────────────────┐
          │                        │                        │
          ▼                        ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   WordPress     │    │  Playwright     │    │  Memory Beams   │
│   localhost     │    │  Bridge         │    │  (Optional)     │
│   :8080         │    │  (3200,1200)    │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## Components

### BridgeService (`bridge_service.py`)
Main orchestrator that coordinates all components in a continuous evolution loop.

- **Cycle Management**: Runs analysis cycles at configurable intervals
- **Proposal Filtering**: Only acts on proposals meeting confidence threshold
- **Safety Default**: `auto_execute=False` requires manual approval
- **Memory Sync**: Optional integration with Memory Beams

### ContentAnalyzer (`content_analyzer.py`)
Analyzes WordPress posts for improvement opportunities.

- **Issue Detection**: Identifies content problems (length, clarity, SEO)
- **Priority Scoring**: Weights issues by severity
- **Proposal Generation**: Creates actionable improvement suggestions

### EvolutionAgent (`evolution_agent.py`)
Runs evolution cycles on WordPress content.

- **Post Analysis**: Fetches and processes WordPress posts
- **Proposal Creation**: Generates improvement proposals
- **History Tracking**: Maintains cycle history and metrics

### ActionExecutor (`action_executor.py`)
Executes approved proposals via Playwright.

- **WebSocket Connection**: Communicates with Playwright bridge
- **Command Translation**: Converts proposals to Playwright actions
- **Execution Tracking**: Monitors success/failure of actions

## Quick Start

### Prerequisites

1. **Visual Bridge** running on port 8768:
   ```bash
   python3 systems/visual_shell/api/visual_bridge.py
   ```

2. **Playwright Bridge** connected to Visual Bridge:
   ```bash
   python3 wordpress_zone/wordpress_bridge_to_live_tile.py
   ```

3. **WordPress** accessible at http://localhost:8080

### Start the Bridge Service

Using the startup script (recommended):
```bash
cd wordpress_zone
./start_evolution_bridge.sh
```

Or directly with Python:
```bash
python3 -m systems.evolution_daemon.wordpress.bridge_service
```

### Run a Single Cycle

Test the system without continuous operation:
```bash
./start_evolution_bridge.sh --single-cycle --verbose
```

## Configuration

### Command Line Options

| Option | Default | Description |
|--------|---------|-------------|
| `--wp-url` | `http://localhost:8080` | WordPress base URL |
| `--ws-uri` | `ws://localhost:8768` | Visual Bridge WebSocket URI |
| `--interval` | `60` | Cycle interval in seconds |
| `--min-confidence` | `0.5` | Minimum confidence threshold |
| `--auto-execute` | `false` | Auto-execute approved proposals |
| `--single-cycle` | `false` | Run one cycle and exit |
| `--verbose` | `false` | Enable debug logging |

### Environment Variables

All options can be set via environment variables:

```bash
export WP_URL="http://localhost:8080"
export WS_URI="ws://localhost:8768"
export INTERVAL="60"
export MIN_CONFIDENCE="0.5"
export VERBOSE="false"
export AUTO_EXECUTE="false"
```

### Programmatic Configuration

```python
from systems.evolution_daemon.wordpress.bridge_service import (
    BridgeServiceConfig,
    WPEvolutionBridgeService
)

config = BridgeServiceConfig(
    wp_url="http://localhost:8080",
    ws_uri="ws://localhost:8768",
    cycle_interval=60,
    auto_execute=False,  # Safety: require manual approval
    min_confidence=0.5
)

service = WPEvolutionBridgeService(config)
await service.start()
```

## Safety Features

### Default Safe Mode
- **auto_execute=False**: Proposals are generated but not executed
- **min_confidence=0.5**: Only high-quality proposals are considered
- **Manual Review**: Inspect proposals before enabling auto-execute

### Enabling Auto-Execute

**WARNING**: `--auto-execute` will modify WordPress content automatically.

Before enabling:
1. Run with `--single-cycle` to see generated proposals
2. Review proposal quality and confidence scores
3. Adjust `--min-confidence` if needed
4. Enable auto-execute only in trusted environments

```bash
# Safe: Review proposals first
./start_evolution_bridge.sh --single-cycle --verbose

# Cautious: Higher confidence threshold
./start_evolution_bridge.sh --auto-execute --min-confidence 0.8

# Production-ready (after testing)
./start_evolution_bridge.sh --auto-execute
```

## Monitoring

### Service Statistics

```python
stats = service.get_stats()
print(f"Cycles: {stats.cycles_completed}")
print(f"Proposals: {stats.proposals_generated}")
print(f"Executed: {stats.proposals_executed}")
print(f"Errors: {stats.errors}")
print(f"Uptime: {stats.uptime_seconds}s")
```

### Logs

Enable verbose logging for detailed output:
```bash
./start_evolution_bridge.sh --verbose
```

Log format:
```
2026-02-21 12:00:00 [INFO] wp_evolution_bridge: WordPress Evolution Bridge started
2026-02-21 12:01:00 [INFO] wp_evolution_bridge: Cycle 1: 10 posts, 3 proposals, 0 executed
```

## Integration Points

### Visual Bridge
The Visual Bridge (port 8768) is the communication hub:
- Receives commands from Evolution Bridge
- Forwards to Playwright Bridge
- Broadcasts results to connected clients

### Playwright Bridge
Located at tile coordinates (3200, 1200):
- Executes browser automation commands
- Interacts with WordPress admin interface
- Returns execution results

### Memory Beams (Optional)
When `memory_provider` is configured:
- Syncs WordPress posts to Memory Beams
- Enables semantic navigation via Memory Beams
- Updates spatial embeddings after changes

## Troubleshooting

### "Failed to connect to Playwright bridge"
- Ensure Visual Bridge is running: `nc -z localhost 8768`
- Check Playwright Bridge is connected to Visual Bridge
- Verify WS_URI matches Visual Bridge port

### "WordPress may not be accessible"
- Verify WordPress is running at the configured URL
- Check WP_URL environment variable
- Ensure network connectivity

### "No proposals generated"
- Run with `--verbose` to see analysis details
- Check ContentAnalyzer logs for issue detection
- Verify WordPress has posts to analyze

### Memory sync failures
- Check WordPressMemoryProvider configuration
- Verify database connectivity
- Review memory_provider logs

## Related Documentation

- [Visual Bridge](../../../visual_shell/api/visual_bridge.py) - WebSocket hub
- [WordPress Memory Provider](../../../wordpress_zone/wordpress_memory_provider.py) - Memory Beams integration
- [Evolution Daemon](../evolution_daemon.py) - Main evolution daemon
- [Playwright Bridge](../../../wordpress_zone/wordpress_bridge_to_live_tile.py) - GUI automation
