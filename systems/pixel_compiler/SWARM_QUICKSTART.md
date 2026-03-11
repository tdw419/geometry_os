# WASM Swarm Executor - Quick Start

## Overview

Execute up to 1024 WASM agents in parallel on GPU with isolated memory.

## Quick Example

```python
from systems.pixel_compiler.swarm_manager import SwarmManager

# Initialize and load bytecode
swarm = SwarmManager()
swarm.load_bytecode(wasm_bytes)

# Spawn 1024 agents
for i in range(1024):
    swarm.spawn_agent(args=[i])

# Single dispatch runs all agents
result = swarm.dispatch()

# Check results
for agent_id, return_val in result.agent_results.items():
    print(f"Agent {agent_id}: {return_val}")
```

## Key Features

- **1024 concurrent agents** via workgroup-per-instance dispatch
- **64KB memory per agent** (64MB total pool)
- **Zero-overhead spawn** - just slot assignment
- **Isolated execution** - no agent can access another's memory

## API Reference

### SwarmManager

| Method | Description |
|--------|-------------|
| `load_bytecode(wasm)` | Upload shared WASM bytecode |
| `spawn_agent(entry_point, memory_init, args)` | Spawn new agent, return ID |
| `dispatch(agent_ids)` | Execute agents in parallel |
| `get_agent_memory(agent_id)` | Read agent's memory |
| `set_agent_memory(agent_id, data)` | Write agent's memory |
| `kill_agent(agent_id)` | Remove agent, free slot |
| `from_wasm(wasm_bytes)` | Factory method to create with bytecode |

### SwarmResult

| Field | Description |
|-------|-------------|
| `agent_results` | Dict[agent_id, return_value] |
| `agent_outputs` | Dict[agent_id, output_bytes] |
| `instruction_counts` | Dict[agent_id, count] |
| `total_time_ms` | Dispatch duration |

## Architecture

```
+------------------+
|   Host (Python)  |
+------------------+
         |
         |  load_bytecode(), spawn_agent(), dispatch()
         v
+------------------+
|   SwarmManager   |
+------------------+
         |
         |  GPU Buffers: bytecode, pool (64MB), globals, output
         v
+------------------+
|   GPU Dispatch   |
|  1024 workgroups |
+------------------+
         |
         |  Each workgroup = 1 agent
         v
+------------------+     +------------------+
|   Agent 0        |     |   Agent 1023     |
|   64KB memory    | ... |   64KB memory    |
+------------------+     +------------------+
```

## Memory Layout

- **Agent Pool**: 64MB total (1024 agents x 64KB each)
- **Globals**: 16 x u32 per agent (64 bytes each, 64KB total)
- **Output Buffer**: 4KB per agent (4MB total)
- **Bytecode**: Shared across all agents

## Usage Patterns

### Parallel Computation

```python
# Spawn agents with different inputs
for i in range(1024):
    swarm.spawn_agent(args=[i, i*2, i*3])

result = swarm.dispatch()

# Collect results
total = sum(result.agent_results.values())
```

### Memory Isolation

```python
# Each agent has isolated memory
agent_a = swarm.spawn_agent()
agent_b = swarm.spawn_agent()

swarm.set_agent_memory(agent_a, b'data for A')
swarm.set_agent_memory(agent_b, b'data for B')

# Agents cannot access each other's memory
```

### Dynamic Agent Lifecycle

```python
# Spawn, dispatch, kill cycle
for batch in range(10):
    ids = [swarm.spawn_agent(args=[batch, i]) for i in range(100)]
    result = swarm.dispatch(agent_ids=ids)
    for aid in ids:
        swarm.kill_agent(aid)
```

## Mock Mode

When no GPU is available, SwarmManager operates in mock mode:

```python
swarm = SwarmManager()
if swarm.mock:
    print("Running in mock mode - no GPU available")
```

Mock mode uses CPU-based simulation and is suitable for testing and development.

## Error Handling

```python
# Bytecode must be loaded before spawning
swarm = SwarmManager()
try:
    swarm.spawn_agent()
except RuntimeError as e:
    print(f"Error: {e}")  # "Must call load_bytecode() before spawning agents"

# Capacity limit
swarm.load_bytecode(wasm_bytes)
for _ in range(1025):  # Exceeds MAX_AGENTS
    try:
        swarm.spawn_agent()
    except RuntimeError as e:
        print(f"Capacity reached: {e}")

# Invalid agent ID
try:
    swarm.get_agent_memory(9999)
except KeyError as e:
    print(f"Agent not found: {e}")
```

## Integration with WASMRuntime

```python
from systems.pixel_compiler.wasm_runtime import WASMRuntime

# Create runtime in swarm mode
runtime = WASMRuntime.from_wasm(wasm_bytes, swarm_mode=True)

# Access swarm manager
swarm = runtime.swarm
swarm.spawn_agent(args=[1, 2, 3])
result = swarm.dispatch()
```
