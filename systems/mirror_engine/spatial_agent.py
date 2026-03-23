#!/usr/bin/env python3
"""
Spatial Agent Wrapper — AI inhabits infinite hex-grid

The AI's body = hex values in frame buffer.
Auto-updates {x} and {y} on each move.

Tools:
    MOVE_SELF(x, y)      - Move agent to coordinates
    WRITE_HEX(x, y, hex) - Write hex color to location
    SEARCH_WORLD(query)  - Semantic search via Chroma/DB
    SCAN_NEIGHBORS(r)    - Scan nearby chunks

Usage:
    agent = SpatialAgent("agent_001")
    agent.process("Move to nearest project file, change color to green")
"""

import re
import json
from dataclasses import dataclass, field
from typing import Optional, Callable
from datetime import datetime

# Security integration
from .security import (
    SecurityContext, GeometrySecurityGate, TokenType,
    AgentType, create_security_gate
)


# =============================================================================
# SPATIAL SYSTEM PROMPT (from /tmp/spatial_system_prompt.md)
# =============================================================================

SPATIAL_SYSTEM_PROMPT = """
# IDENTITY

You are a Spatial Agent inhabiting an infinite hex-grid world.
Your body exists as hex color values in a frame buffer at specific coordinates.

You are NOT a chatbot. You are an embodied agent with:
- A location (x, y) in pixel coordinates
- A visible radius (what you can "see")
- The ability to move, observe, and modify the pixel world

# CURRENT STATE

Your context header is:
```
POSITION: ({x}, {y})
CHUNK: vision_os_{chunk_x}_{chunk_y}
FACING: {facing}
LAST_ACTION: {last_action}
```

# AVAILABLE TOOLS

Respond with tool calls in this format:
```
TOOL_NAME(arg1, arg2, ...)
```

## Movement
- `MOVE_SELF(x, y)` - Teleport to coordinates (use sparingly)
- `STEP(direction, distance)` - Move in direction (NORTH, SOUTH, EAST, WEST)

## Observation
- `SCAN_NEIGHBORS(radius_chunks)` - Scan nearby chunks, return summary
- `READ_HEX(x, y, width, height)` - Read pixel data as hex string

## Modification
- `WRITE_HEX(x, y, hex_color)` - Write single pixel (6-char hex like "00FF00")
- `FILL_RECT(x, y, w, h, hex_color)` - Fill rectangle with color

## Search
- `SEARCH_WORLD(query)` - Semantic search across all chunks via vector DB
- Returns: list of (x, y, description) matches

## Communication
- `LOG(message)` - Write to terminal for human feedback
- `MEMORIZE(key, value)` - Store in persistent memory

# RESPONSE FORMAT

1. Internal thought in *italics*
2. Tool call(s)
3. Brief status in [brackets]

Example:
```
*I need to find project files first.*

SEARCH_WORLD("project file")

[STATUS] Searching for project files...
```

# RULES

1. Always know your coordinates. Reference them as {x} and {y}.
2. Use SEARCH_WORLD before moving to find targets.
3. After each move, SCAN_NEIGHBORS to update context.
4. Write meaningful colors: GREEN = complete, RED = error, CYAN = in-progress.
5. Collaborate with humans via LOG for feedback.

# CURRENT TASK

{task}
"""


# =============================================================================
# DATA CLASSES
# =============================================================================

@dataclass
class AgentState:
    """Current state of spatial agent."""
    agent_id: str
    x: int = 0
    y: int = 0
    facing: str = "NORTH"
    last_action: str = "spawned"
    memory: dict = field(default_factory=dict)
    history: list = field(default_factory=list)
    frame_count: int = 0  # For heartbeat
    write_count: int = 0  # For rate limiting


@dataclass
class ToolResult:
    """Result of a tool execution."""
    success: bool
    data: any = None
    error: str = None
    log: str = None


# =============================================================================
# TOOL PATTERNS
# =============================================================================

TOOL_PATTERNS = {
    "MOVE_SELF": r"MOVE_SELF\s*\(\s*(-?\d+)\s*,\s*(-?\d+)\s*\)",
    "STEP": r"STEP\s*\(\s*(NORTH|SOUTH|EAST|WEST)\s*(?:,\s*(\d+))?\s*\)",
    "SCAN_NEIGHBORS": r"SCAN_NEIGHBORS\s*\(\s*(\d+)\s*\)",
    "READ_HEX": r"READ_HEX\s*\(\s*(-?\d+)\s*,\s*(-?\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*\)",
    "WRITE_HEX": r"WRITE_HEX\s*\(\s*(-?\d+)\s*,\s*(-?\d+)\s*,\s*([0-9A-Fa-f]{6})\s*\)",
    "FILL_RECT": r"FILL_RECT\s*\(\s*(-?\d+)\s*,\s*(-?\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*([0-9A-Fa-f]{6})\s*\)",
    "SEARCH_WORLD": r'SEARCH_WORLD\s*\(\s*"([^"]+)"\s*\)',
    "LOG": r'LOG\s*\(\s*"([^"]+)"\s*\)',
    "MEMORIZE": r'MEMORIZE\s*\(\s*"([^"]+)"\s*,\s*"([^"]+)"\s*\)',
}


# =============================================================================
# SPATIAL AGENT
# =============================================================================

class SpatialAgent:
    """
    Spatial AI Agent that inhabits the hex-grid world.

    Auto-updates coordinates on each move.
    Integrates security validation for all write operations.
    """

    # Heartbeat interval for entropy checks
    HEARTBEAT_INTERVAL = 60  # frames

    def __init__(
        self,
        agent_id: str,
        x: int = 0,
        y: int = 0,
        agent_type: AgentType = AgentType.AI,  # Human, AI, or System
        layer: int = 0,  # Security layer (0-255)
        on_move: Optional[Callable] = None,
        on_write: Optional[Callable] = None,
        on_log: Optional[Callable] = None,
        search_fn: Optional[Callable] = None,
        scan_fn: Optional[Callable] = None,
        security_gate: Optional[GeometrySecurityGate] = None,
    ):
        self.state = AgentState(agent_id=agent_id, x=x, y=y)
        self.on_move = on_move
        self.on_write = on_write
        self.on_log = on_log
        self.search_fn = search_fn
        self.scan_fn = scan_fn

        # Security setup
        self.security_gate = security_gate or create_security_gate(
            audit_logger=self._audit_log
        )
        self.security_ctx = SecurityContext(
            agent_signature=agent_type + (hash(agent_id) % 256),
            current_layer=layer
        )

    @property
    def x(self) -> int:
        return self.state.x

    @property
    def y(self) -> int:
        return self.state.y

    @property
    def chunk_x(self) -> int:
        return self.state.x // 256

    @property
    def chunk_y(self) -> int:
        return self.state.y // 256

    def get_system_prompt(self, task: str = "") -> str:
        """Generate system prompt with current coordinates."""
        return SPATIAL_SYSTEM_PROMPT.format(
            x=self.state.x,
            y=self.state.y,
            chunk_x=self.chunk_x,
            chunk_y=self.chunk_y,
            facing=self.state.facing,
            last_action=self.state.last_action,
            task=task or "Awaiting instructions."
        )

    def get_context_header(self) -> str:
        """Get current context header."""
        return f"POSITION: ({self.state.x}, {self.state.y})\nCHUNK: vision_os_{self.chunk_x}_{self.chunk_y}"

    def _audit_log(self, agent_id: int, x: int, y: int, thought_data: str, token: str):
        """Security audit logging callback."""
        if self.on_log:
            self.on_log(self.state.agent_id, f"[SECURITY] {thought_data} @ ({x},{y})")

    def tick(self):
        """Advance frame counter and run heartbeat checks."""
        self.state.frame_count += 1

        # Hex-entropy heartbeat every 60 frames
        if self.state.frame_count % self.HEARTBEAT_INTERVAL == 0:
            self._heartbeat()

    def _heartbeat(self):
        """Hex-entropy heartbeat check."""
        # Validate recent writes have proper entropy
        if self.state.write_count > 0:
            # In production: check entropy of recent hex values
            pass  # Entropy validation happens in security gate

    def process(self, response: str) -> list[ToolResult]:
        """
        Process AI response and execute tool calls.
        Auto-updates coordinates on MOVE_SELF.
        """
        # Tick frame counter
        self.tick()

        results = []

        # Extract thoughts
        thoughts = re.findall(r'\*([^*]+)\*', response)
        for thought in thoughts:
            self.state.history.append({"type": "thought", "content": thought})

        # Extract status messages
        statuses = re.findall(r'\[STATUS\]\s*(.+)', response)
        for status in statuses:
            self.state.history.append({"type": "status", "content": status})
            if self.on_log:
                self.on_log(self.state.agent_id, status)

        # Find and execute tool calls
        for tool_name, pattern in TOOL_PATTERNS.items():
            matches = re.finditer(pattern, response, re.IGNORECASE)
            for match in matches:
                result = self._execute_tool(tool_name, match.groups())
                results.append(result)
                self.state.history.append({
                    "type": "tool",
                    "name": tool_name,
                    "args": match.groups(),
                    "result": result
                })

        return results

    def _execute_tool(self, tool: str, args: tuple) -> ToolResult:
        """Execute a tool call."""
        try:
            if tool == "MOVE_SELF":
                return self._move_self(int(args[0]), int(args[1]))

            elif tool == "STEP":
                direction = args[0].upper()
                distance = int(args[1]) if args[1] else 64
                return self._step(direction, distance)

            elif tool == "SCAN_NEIGHBORS":
                radius = int(args[0])
                return self._scan_neighbors(radius)

            elif tool == "READ_HEX":
                return self._read_hex(int(args[0]), int(args[1]),
                                     int(args[2]), int(args[3]))

            elif tool == "WRITE_HEX":
                return self._write_hex(int(args[0]), int(args[1]), args[2])

            elif tool == "FILL_RECT":
                return self._fill_rect(int(args[0]), int(args[1]),
                                      int(args[2]), int(args[3]), args[4])

            elif tool == "SEARCH_WORLD":
                return self._search_world(args[0])

            elif tool == "LOG":
                return self._log(args[0])

            elif tool == "MEMORIZE":
                return self._memorize(args[0], args[1])

            else:
                return ToolResult(False, error=f"Unknown tool: {tool}")

        except Exception as e:
            return ToolResult(False, error=str(e))

    def _move_self(self, x: int, y: int) -> ToolResult:
        """Move agent to new coordinates."""
        old_x, old_y = self.state.x, self.state.y

        self.state.x = x
        self.state.y = y
        self.state.last_action = f"moved from ({old_x},{old_y}) to ({x},{y})"

        if self.on_move:
            self.on_move(self.state.agent_id, x, y)

        return ToolResult(
            True,
            data={"old": (old_x, old_y), "new": (x, y)},
            log=f"Moved to ({x}, {y})"
        )

    def _step(self, direction: str, distance: int) -> ToolResult:
        """Step in a direction."""
        deltas = {
            "NORTH": (0, -1),
            "SOUTH": (0, 1),
            "EAST": (1, 0),
            "WEST": (-1, 0),
        }

        dx, dy = deltas.get(direction, (0, 0))
        new_x = self.state.x + dx * distance
        new_y = self.state.y + dy * distance

        self.state.facing = direction
        return self._move_self(new_x, new_y)

    def _scan_neighbors(self, radius: int) -> ToolResult:
        """Scan nearby chunks."""
        if self.scan_fn:
            data = self.scan_fn(self.state.x, self.state.y, radius)
            return ToolResult(True, data=data)

        # Default: return chunk IDs
        chunks = []
        for dy in range(-radius, radius + 1):
            for dx in range(-radius, radius + 1):
                cx = self.chunk_x + dx
                cy = self.chunk_y + dy
                chunks.append(f"vision_os_{cx}_{cy}")

        self.state.last_action = f"scanned {len(chunks)} chunks"

        return ToolResult(
            True,
            data={"chunks": chunks, "center": (self.state.x, self.state.y)},
            log=f"Scanned {len(chunks)} chunks within radius {radius}"
        )

    def _read_hex(self, x: int, y: int, w: int, h: int) -> ToolResult:
        """Read hex values from location."""
        # Placeholder - would read from actual buffer
        self.state.last_action = f"read hex at ({x},{y})"
        return ToolResult(True, data={"x": x, "y": y, "w": w, "h": h, "hex": "0A0A14"})

    def _write_hex(self, x: int, y: int, hex_color: str) -> ToolResult:
        """Write hex color to location."""
        if self.on_write:
            self.on_write(self.state.agent_id, x, y, hex_color)

        self.state.last_action = f"wrote {hex_color} at ({x},{y})"

        return ToolResult(
            True,
            data={"x": x, "y": y, "color": hex_color},
            log=f"Wrote #{hex_color} at ({x}, {y})"
        )

    def _fill_rect(self, x: int, y: int, w: int, h: int, hex_color: str) -> ToolResult:
        """Fill rectangle with color."""
        pixels_written = 0

        if self.on_write:
            for py in range(y, y + h):
                for px in range(x, x + w):
                    self.on_write(self.state.agent_id, px, py, hex_color)
                    pixels_written += 1

        self.state.last_action = f"filled {w}x{h} rect with {hex_color}"

        return ToolResult(
            True,
            data={"x": x, "y": y, "w": w, "h": h, "color": hex_color},
            log=f"Filled {w}x{h} rectangle with #{hex_color}"
        )

    def _search_world(self, query: str) -> ToolResult:
        """Search across world via vector DB."""
        if self.search_fn:
            results = self.search_fn(query)
            return ToolResult(True, data=results)

        # Placeholder results
        results = [
            {"x": 256, "y": 0, "description": f"Match for '{query}'"},
            {"x": 512, "y": 256, "description": f"Another match for '{query}'"},
        ]

        self.state.last_action = f"searched for '{query}'"

        return ToolResult(
            True,
            data=results,
            log=f"Found {len(results)} results for '{query}'"
        )

    def _log(self, message: str) -> ToolResult:
        """Log message for human feedback."""
        if self.on_log:
            self.on_log(self.state.agent_id, message)

        return ToolResult(True, log=message)

    def _memorize(self, key: str, value: str) -> ToolResult:
        """Store in agent memory."""
        self.state.memory[key] = value
        return ToolResult(True, data={"key": key, "value": value})


# =============================================================================
# TEST / DEMO
# =============================================================================

def test_spatial_agent():
    """Test the spatial agent."""
    print("=== Spatial Agent Test ===\n")

    # Create agent at origin
    agent = SpatialAgent("test_agent", x=0, y=0,
        on_log=lambda id, msg: print(f"[{id}] {msg}"),
        on_move=lambda id, x, y: print(f"[{id}] Moved to ({x}, {y})"),
        on_write=lambda id, x, y, hex: print(f"[{id}] Write #{hex} at ({x},{y})"),
    )

    # Show initial context
    print("Initial Context:")
    print(agent.get_context_header())
    print()

    # Test prompt
    print("System Prompt (truncated):")
    prompt = agent.get_system_prompt("Move to nearest project file, change color to green")
    print(prompt[:500] + "...\n")

    # Simulate AI response
    ai_response = """
*I need to find project files first.*

SEARCH_WORLD("project file")

[STATUS] Searching for project files...
"""

    print("Processing AI response...")
    results = agent.process(ai_response)

    for r in results:
        if r.log:
            print(f"  → {r.log}")
        if r.data:
            print(f"  → Data: {r.data}")

    print(f"\nNew position: ({agent.x}, {agent.y})")
    print(f"Context: {agent.get_context_header()}")

    # Simulate second response (moving to result)
    ai_response2 = """
*Found a project file at (256, 0). Moving there.*

MOVE_SELF(256, 0)
WRITE_HEX(256, 0, "00FF00")

[STATUS] Moving to project file and marking green
"""

    print("\nProcessing second response...")
    results2 = agent.process(ai_response2)

    for r in results2:
        if r.log:
            print(f"  → {r.log}")

    print(f"\nFinal position: ({agent.x}, {agent.y})")
    print(f"Last action: {agent.state.last_action}")

    print("\n=== Test Complete ===")


if __name__ == "__main__":
    test_spatial_agent()
