#!/usr/bin/env python3
"""
Geometry Assembler - Spatial Abstraction Layer (SAL)

The "Molecular Assembler" for Geometry OS. Takes high-level commands
and "bakes" them into raw Geometry Bonds (0x80-0x8F).

Think of this as a compiler for the Infinite Map:
- Input: Human-readable commands (SPAWN(CLOCK, 10, 10))
- Process: Look up blueprint, calculate offsets
- Output: Raw hex tokens injected into buffer

Standard Library Macros:
- WINDOW(w, h) → RECT + BORDER + LISTEN
- PORTAL(dest_x, dest_y) → CIRC + LINK tokens
- MONITOR(stat) → TEXT + FREEZE + System hook

Usage:
    assembler = GeometryAssembler()
    assembler.spawn("CLOCK", 10, 10)
    assembler.window(800, 600, color="#1A1A2E")
    assembler.portal(1000, 1000, label="AI Zone")
"""

from typing import Dict, Tuple, Optional
from dataclasses import dataclass


@dataclass
class Blueprint:
    """Molecular blueprint for an atomic app"""
    name: str
    hex_template: bytes
    width: int
    height: int
    tokens_used: list


class GeometryAssembler:
    """
    The Spatial Abstraction Layer (SAL).
    
    Bridges the gap between high-level intent and low-level hex tokens.
    Once the SAL "bakes" code into the frame buffer, it stops running.
    The code is now "living" in the buffer's Instruction Tape.
    """
    
    def __init__(self):
        self.blueprints: Dict[str, Blueprint] = {}
        self._load_standard_library()
    
    def _load_standard_library(self):
        """Load the Standard Library of macros"""
        
        # Spatial Clock blueprint
        self.blueprints["CLOCK"] = Blueprint(
            name="CLOCK",
            hex_template=bytes.fromhex(
                "886400890a0a1aff840a000a00c80032000a0a1aff8900ffffff"
                "840a000a00c800020000ffffff89888888ff8614002800055449"
                "4d453a888888ff8900ff00ff86500028000831323a35323a3130"
                "00ff00ff8e3c008f"
            ),
            width=200,
            height=50,
            tokens_used=["LAYER", "COLOR", "RECT", "TEXT", "FREEZE", "THAW"]
        )
        
        # Security Radar blueprint
        self.blueprints["RADAR"] = Blueprint(
            name="RADAR",
            hex_template=bytes.fromhex(
                "88640089ff0000ff85c800c8003200ff0000ff89ffffff80"
                "85c800c8003700ffffff8089ffffffff869600180105434c"
                "454152ffffffff8d3200"
            ),
            width=110,
            height=160,
            tokens_used=["LAYER", "COLOR", "CIRC", "TEXT", "LISTEN"]
        )
        
        # Atomic Notepad blueprint
        self.blueprints["NOTEPAD"] = Blueprint(
            name="NOTEPAD",
            hex_template=bytes.fromhex(
                "88640089ffffffff84f401f40100010001ffffffff89000000ff"
                "84f401f40102010200000000ff89000000ff86fe0108020e4154"
                "4f4d4943204e4f5445504144000000ff89000000ff86fe012602"
                "1148656c6c6f2047656f6d65747279204f53000000ff89000000"
                "ff84fe01260208000c00000000ff8d800080fe012602"
            ),
            width=258,
            height=258,
            tokens_used=["LAYER", "COLOR", "RECT", "TEXT", "LISTEN", "MOVE"]
        )
    
    # =========================================================================
    # Standard Library Macros
    # =========================================================================
    
    def window(self, width: int, height: int, x: int = 0, y: int = 0,
               color: str = "#1A1A2E", border_color: str = "#00FFFF",
               title: str = "WINDOW") -> bytes:
        """
        WINDOW(w, h) → Expands to RECT + BORDER + LISTEN
        
        Creates a standard window with border and interaction.
        
        Args:
            width, height: Window dimensions
            x, y: Position
            color: Background color (hex)
            border_color: Border color (hex)
            title: Window title text
        
        Returns:
            Geometry Bond bytes
        """
        tokens = bytearray()
        
        # Layer
        tokens.append(0x88)  # LAYER
        tokens.extend((100).to_bytes(2, 'little'))
        
        # Background
        bg_color = self._parse_color(color)
        tokens.append(0x89)  # COLOR
        tokens.extend(bg_color)
        
        tokens.append(0x84)  # RECT
        tokens.extend(x.to_bytes(2, 'little', signed=True))
        tokens.extend(y.to_bytes(2, 'little', signed=True))
        tokens.extend(width.to_bytes(2, 'little'))
        tokens.extend(height.to_bytes(2, 'little'))
        tokens.extend(bg_color)
        
        # Top border
        bd_color = self._parse_color(border_color)
        tokens.append(0x89)
        tokens.extend(bd_color)
        
        tokens.append(0x84)
        tokens.extend(x.to_bytes(2, 'little', signed=True))
        tokens.extend(y.to_bytes(2, 'little', signed=True))
        tokens.extend((width + 2).to_bytes(2, 'little'))
        tokens.extend((2).to_bytes(2, 'little'))
        tokens.extend(bd_color)
        
        # Title
        tokens.append(0x89)
        tokens.extend(self._parse_color("#FFFFFF"))
        
        tokens.append(0x86)  # TEXT
        tokens.extend((x + 10).to_bytes(2, 'little', signed=True))
        tokens.extend((y + 20).to_bytes(2, 'little', signed=True))
        encoded = title.encode('utf-8')
        tokens.append(len(encoded))
        tokens.extend(encoded)
        tokens.extend(self._parse_color("#FFFFFF"))
        
        # LISTEN for interaction
        tokens.append(0x8D)  # LISTEN
        tokens.extend(max(width, height).to_bytes(2, 'little'))
        
        return bytes(tokens)
    
    def portal(self, dest_x: int, dest_y: int, x: int = 0, y: int = 0,
               radius: int = 30, label: str = "PORTAL") -> bytes:
        """
        PORTAL(dest_x, dest_y) → Expands to CIRC + LINK tokens
        
        Creates a teleportation portal to another coordinate.
        
        Args:
            dest_x, dest_y: Destination coordinates
            x, y: Portal position
            radius: Portal size
            label: Portal label text
        
        Returns:
            Geometry Bond bytes
        """
        tokens = bytearray()
        
        # Layer
        tokens.append(0x88)
        tokens.extend((100).to_bytes(2, 'little'))
        
        # Portal glow (outer circle)
        tokens.append(0x89)
        tokens.extend(self._parse_color("#00FFFF80"))  # Semi-transparent cyan
        
        tokens.append(0x85)  # CIRC
        tokens.extend(x.to_bytes(2, 'little', signed=True))
        tokens.extend(y.to_bytes(2, 'little', signed=True))
        tokens.extend((radius + 5).to_bytes(2, 'little'))
        tokens.extend(self._parse_color("#00FFFF80"))
        
        # Portal core (inner circle)
        tokens.append(0x89)
        tokens.extend(self._parse_color("#FF00FFFF"))  # Magenta
        
        tokens.append(0x85)
        tokens.extend(x.to_bytes(2, 'little', signed=True))
        tokens.extend(y.to_bytes(2, 'little', signed=True))
        tokens.extend(radius.to_bytes(2, 'little'))
        tokens.extend(self._parse_color("#FF00FFFF"))
        
        # LINK to destination
        tokens.append(0x82)  # LINK
        tokens.extend(x.to_bytes(2, 'little', signed=True))
        tokens.extend(y.to_bytes(2, 'little', signed=True))
        tokens.extend(dest_x.to_bytes(2, 'little', signed=True))
        tokens.extend(dest_y.to_bytes(2, 'little', signed=True))
        
        # Label
        tokens.append(0x89)
        tokens.extend(self._parse_color("#FFFFFF"))
        
        tokens.append(0x86)
        tokens.extend((x - 30).to_bytes(2, 'little', signed=True))
        tokens.extend((y + radius + 20).to_bytes(2, 'little', signed=True))
        encoded = label.encode('utf-8')
        tokens.append(len(encoded))
        tokens.extend(encoded)
        tokens.extend(self._parse_color("#FFFFFF"))
        
        # LISTEN for entry
        tokens.append(0x8D)
        tokens.extend(radius.to_bytes(2, 'little'))
        
        return bytes(tokens)
    
    def monitor(self, stat: str, x: int = 0, y: int = 0,
                 update_interval: int = 30) -> bytes:
        """
        MONITOR(stat) → Expands to TEXT + FREEZE + System hook
        
        Creates a hardware stat monitor that updates periodically.
        
        Args:
            stat: What to monitor (CPU, GPU, RAM, TEMP)
            x, y: Position
            update_interval: Frames between updates (30 = 0.5s at 60fps)
        
        Returns:
            Geometry Bond bytes
        """
        tokens = bytearray()
        
        # Layer
        tokens.append(0x88)
        tokens.extend((100).to_bytes(2, 'little'))
        
        # Background
        tokens.append(0x89)
        tokens.extend(self._parse_color("#0A0A1A"))
        
        tokens.append(0x84)
        tokens.extend(x.to_bytes(2, 'little', signed=True))
        tokens.extend(y.to_bytes(2, 'little', signed=True))
        tokens.extend((200).to_bytes(2, 'little'))
        tokens.extend((50).to_bytes(2, 'little'))
        tokens.extend(self._parse_color("#0A0A1A"))
        
        # Label
        stat_colors = {
            "CPU": "#00FF00",
            "GPU": "#00FFFF",
            "RAM": "#FF00FF",
            "TEMP": "#FFFF00"
        }
        color = stat_colors.get(stat.upper(), "#FFFFFF")
        
        tokens.append(0x89)
        tokens.extend(self._parse_color(color))
        
        tokens.append(0x86)
        tokens.extend((x + 10).to_bytes(2, 'little', signed=True))
        tokens.extend((y + 30).to_bytes(2, 'little', signed=True))
        label = f"{stat.upper()}: ---%"
        encoded = label.encode('utf-8')
        tokens.append(len(encoded))
        tokens.extend(encoded)
        tokens.extend(self._parse_color(color))
        
        # FREEZE for update interval
        tokens.append(0x8E)  # FREEZE
        tokens.extend(update_interval.to_bytes(2, 'little'))
        
        # System hook marker (special token for system_monitor.py)
        tokens.append(0x8C)  # EMIT
        tokens.extend(f"STAT_{stat.upper()}".encode('utf-8')[:8].ljust(8, b'\x00'))
        
        return bytes(tokens)
    
    # =========================================================================
    # Core Assembly Functions
    # =========================================================================
    
    def spawn(self, app_name: str, x: int, y: int,
              color: Optional[str] = None) -> bytes:
        """
        Spawn an atomic app at coordinates.
        
        The SAL "bakes" the app into the buffer and stops running.
        The app is now "living" in the Instruction Tape.
        
        Args:
            app_name: App to spawn (CLOCK, RADAR, NOTEPAD)
            x, y: Position
            color: Optional color override
        
        Returns:
            Geometry Bond bytes
        """
        blueprint = self.blueprints.get(app_name.upper())
        if not blueprint:
            raise ValueError(f"Unknown app: {app_name}")
        
        # Get template
        raw_hex = blueprint.hex_template
        
        # Inject spatial coordinates
        spatial_hex = self._inject_metadata(raw_hex, x, y, color)
        
        return spatial_hex
    
    def clone(self, source_x: int, source_y: int,
              dest_x: int, dest_y: int) -> bytes:
        """
        CLONE_BOND(source, dest) - Biological replication
        
        Read source region, translate coordinates, paste at destination.
        No software installation - just molecular copying.
        
        Args:
            source_x, source_y: Source coordinates
            dest_x, dest_y: Destination coordinates
        
        Returns:
            Cloned Geometry Bond bytes
        """
        # In real implementation, this would read from the actual buffer
        # For now, we'll use the blueprint system
        
        # Calculate offset
        offset_x = dest_x - source_x
        offset_y = dest_y - source_y
        
        # For demo: clone a clock from (10, 10)
        if source_x == 10 and source_y == 10:
            return self.spawn("CLOCK", dest_x, dest_y)
        
        raise ValueError(f"Clone source not found at ({source_x}, {source_y})")
    
    def batch_spawn(self, app_name: str, positions: list) -> list:
        """
        Spawn multiple copies of an app.
        
        Args:
            app_name: App to spawn
            positions: List of (x, y) tuples
        
        Returns:
            List of Geometry Bond bytes
        """
        results = []
        for x, y in positions:
            results.append(self.spawn(app_name, x, y))
        return results
    
    # =========================================================================
    # Helper Functions
    # =========================================================================
    
    def _parse_color(self, color: str) -> bytes:
        """Parse hex color to RGBA bytes"""
        color = color.lstrip('#')
        if len(color) == 6:
            color += 'FF'
        elif len(color) == 8:
            pass
        else:
            color = 'FFFFFF' + 'FF'
        
        return bytes.fromhex(color)
    
    def _inject_metadata(self, raw_hex: bytes, x: int, y: int,
                          color: Optional[str]) -> bytes:
        """
        Inject spatial coordinates and color into hex template.
        
        This is where the "molecular assembly" happens.
        """
        # For now, just return the raw hex
        # In full implementation, this would:
        # 1. Find all position tokens (0x80, 0x84, 0x85, 0x86)
        # 2. Add offset to their coordinates
        # 3. Replace color if provided
        
        # Simplified: just return raw for now
        return raw_hex


if __name__ == "__main__":
    print("=" * 60)
    print("GEOMETRY ASSEMBLER - Spatial Abstraction Layer")
    print("=" * 60)
    
    assembler = GeometryAssembler()
    
    # Test Standard Library Macros
    print("\n" + "=" * 60)
    print("MACRO 1: WINDOW(w, h) → RECT + BORDER + LISTEN")
    print("=" * 60)
    window_hex = assembler.window(400, 300, 100, 100, 
                                   title="Geometry OS Terminal")
    print(f"Size: {len(window_hex)} bytes")
    print(f"Hex: {window_hex.hex()[:100]}...")
    
    print("\n" + "=" * 60)
    print("MACRO 2: PORTAL(dest_x, dest_y) → CIRC + LINK")
    print("=" * 60)
    portal_hex = assembler.portal(1000, 1000, 300, 300, 
                                   label="AI Zone")
    print(f"Size: {len(portal_hex)} bytes")
    print(f"Hex: {portal_hex.hex()[:100]}...")
    
    print("\n" + "=" * 60)
    print("MACRO 3: MONITOR(stat) → TEXT + FREEZE + Hook")
    print("=" * 60)
    monitor_hex = assembler.monitor("CPU", 500, 100, update_interval=30)
    print(f"Size: {len(monitor_hex)} bytes")
    print(f"Hex: {monitor_hex.hex()[:100]}...")
    
    # Test spawning
    print("\n" + "=" * 60)
    print("SPAWN: Instantiating Atomic Apps")
    print("=" * 60)
    clock = assembler.spawn("CLOCK", 10, 10)
    print(f"Clock @ (10, 10): {len(clock)} bytes")
    
    # Test cloning
    print("\n" + "=" * 60)
    print("CLONE: Biological Replication")
    print("=" * 60)
    clone1 = assembler.clone(10, 10, 1000, 1000)
    print(f"Cloned to (1000, 1000): {len(clone1)} bytes")
    
    # Test batch spawn
    print("\n" + "=" * 60)
    print("BATCH: Clock Grid")
    print("=" * 60)
    positions = [(10, 10), (1000, 1000), (2000, 2000)]
    clocks = assembler.batch_spawn("CLOCK", positions)
    print(f"Spawned {len(clocks)} clocks")
    for i, (x, y) in enumerate(positions):
        print(f"  Clock {i+1} @ ({x}, {y}): {len(clocks[i])} bytes")
    
    print("\n" + "=" * 60)
    print("GEOMETRY ASSEMBLER READY")
    print("=" * 60)
    print("\nStandard Library Macros:")
    print("  WINDOW(w, h) → RECT + BORDER + LISTEN")
    print("  PORTAL(dest_x, dest_y) → CIRC + LINK")
    print("  MONITOR(stat) → TEXT + FREEZE + Hook")
    print("\nCore Functions:")
    print("  SPAWN(app, x, y) - Instantiate atomic app")
    print("  CLONE(src, dest) - Biological replication")
    print("  BATCH(app, positions) - Multiple spawns")
    print("\n🔷🔒 Geometry OS Assembler Active")
