# Evolution Daemon
**"Natural Selection for Operating Systems"**

The Evolution Daemon answers the question: *What if the OS could rewrite itself?*

By connecting **PixelRTS Linux** (The Append-Only Computer) with **LM Studio**, this daemon turns the Infinite Map into a genetic laboratory for software.

## How it Helps

1.  **Self-Healing**:
    *   **Problem**: A kernel update causes a boot loop.
    *   **Evolution**: The Daemon observes the visual "crash pattern" (entropy spike in the texture). It asks LM Studio "How do I revert the last commit?" and creates a new branch (Tile) with the fix.
    *   **Result**: You pan right to find the fixed OS waiting for you.

2.  **Optimization**:
    *   **Goal**: "Make boot faster."
    *   **Evolution**: The Daemon forks the OS 10 times, applying 10 different `sysctl` tweaks suggested by the LLM. It places them at `y=1, y=2, ... y=10`.
    *   **Selection**: You visually inspect which one boots fastest (the texture brightens up first) and continue using that branch.

3.  **Experimentation**:
    *   You can ask the Daemon: "Try to install Arch Linux on this Alpine base."
    *   It will hallucinate/generate the shell commands, try them in a VM, snapshot the result, and place it on the map.

## Architecture

```
┌──────────────┐      Observation       ┌─────────────────┐
│              │ ─────────────────────> │                 │
│  Infinite    │ (Logs/Screenshots)     │   LM Studio     │
│    Map       │                        │   (Intelligence)│
│              │ <~~~~~~~~~~~~~~~~~~~~~ │                 │
└──────────────┘      Mutation          └─────────────────┘
    (New Tile)      (Code Patch)
```

## Usage

```bash
# Start the Daemon
cd systems/evolution_daemon
python3 evolution_daemon.py
```

The daemon will theoretically watch your active tile. If you tag it `goal="optimize"`, it will begin forking new versions nearby.

## New Capabilities (V11)

### 👁️ Mirror Neuron (Visual Self-Awareness)
The daemon can now **see** the user interface it manages.
- **Tool**: `render_visual_layout()`
- **Function**: Converts the PixiJS scene graph into a structured ASCII representation.
- **Impact**: The AI can verify if a button is actually visible, if text is readable, or if a layout is broken, without needing complex pixel analysis. This enables a closed-loop visual self-improvement cycle.
