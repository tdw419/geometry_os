#!/usr/bin/env python3
"""
Self-Hosting DNA - Transpiles the OS into its own buffer

This is the moment the OS becomes truly self-hosting:
1. Read the_mirror.py source code
2. Transpile Python → Geometry Bonds
3. Plant at (-1000, -1000) as "Code Garden"
4. Live Edit: Walk to coords, move Pixel-Byte, kernel absorbs change

Crystal Memory Defense:
- No .exe files to infect
- No registry to bloat
- No System32 to corrupt
- Only Geometry Tokens (0x80-0x8F) exist
- Invalid pixels ignored by hex_logic_runner.py

Usage:
    python3 self_hosting_dna.py --transpile  # Generate DNA
    python3 self_hosting_dna.py --plant      # Plant in buffer
"""

import os
import sys
import argparse
from pathlib import Path
from typing import List, Tuple, Optional

try:
    from integrations.openspec.geometry_bridge import GeometryBridge

    HAS_GEOMETRY_BRIDGE = True
except ImportError:
    HAS_GEOMETRY_BRIDGE = False


class SelfHostingDNA:
    """
    Transpiles the OS into its own buffer.

    The OS editing its own DNA from within the buffer.
    """

    def __init__(self, source_file: str = "the_mirror.py"):
        self.source_file = source_file
        self.source_code = ""
        self.dna_bonds = bytearray()

    def read_source(self) -> str:
        """Read the OS source code"""
        path = Path(__file__).parent / self.source_file

        if not path.exists():
            # Fallback: generate minimal self-reference
            return self._generate_minimal_self()

        with open(path, "r") as f:
            self.source_code = f.read()

        return self.source_code

    def _generate_minimal_self(self) -> str:
        """Generate minimal self-referential code"""
        return """# THE MIRROR - Self-Reference
# This code exists as pixels at (-1000, -1000)
# To edit: Move Pixel-Byte, kernel absorbs change

MAGIC = b"GEO1"
VERSION = 1

def mirror_loop():
    while True:
        read()
        translate()
        validate()
        reflect()
        sync()
"""

    def transpile_to_bonds(self) -> bytes:
        """
        Transpile source code to Geometry Bonds.

        Maps Python constructs to Spatial Tokens:
        - def/function → 0x8B AGENT
        - while True → 0x90 LOOP
        - if/else → 0x92 IF
        - return → 0x95 RETURN
        - variable = → 0x89 COLOR (state)
        - call() → 0x8C EMIT
        """
        if not self.source_code:
            self.read_source()

        bonds = bytearray()

        # Header - Self-Reference Marker
        bonds.extend(b"DNA1")  # Magic: DNA marker
        bonds.extend((0x0001).to_bytes(2, "little"))  # Version

        # Coordinate where this code lives
        bonds.append(0x80)  # MOVE
        bonds.extend((-1000).to_bytes(2, "little", signed=True))  # x
        bonds.extend((-1000).to_bytes(2, "little", signed=True))  # y

        # Transpile each line
        lines = self.source_code.split("\n")

        for i, line in enumerate(lines[:50]):  # First 50 lines
            line = line.strip()

            if not line or line.startswith("#"):
                # Comment/blank → skip (but record position)
                bonds.append(0x00)  # NOP
                bonds.extend(i.to_bytes(2, "little"))
                continue

            # def function_name():
            if line.startswith("def "):
                func_name = line[4:].split("(")[0]
                bonds.append(0x8B)  # AGENT (function = agent)
                bonds.extend(hash(func_name).to_bytes(2, "little") & 0xFFFF)
                bonds.extend((0).to_bytes(2, "little", signed=True))  # x
                bonds.extend(i.to_bytes(2, "little", signed=True))  # y = line number
                bonds.extend((0x0001).to_bytes(2, "little"))  # type: function
                continue

            # while True:
            if line.startswith("while "):
                bonds.append(0x90)  # LOOP
                continue

            # if condition:
            if line.startswith("if "):
                bonds.append(0x92)  # IF
                condition_hash = hash(line[3:]) & 0xFFFF
                bonds.extend(condition_hash.to_bytes(2, "little"))
                continue

            # else:
            if line == "else:" or line.startswith("elif "):
                bonds.append(0x92)  # IF (elif is another IF)
                continue

            # return
            if line.startswith("return"):
                bonds.append(0x95)  # RETURN
                continue

            # variable = value
            if "=" in line and not line.startswith(("if", "while", "for")):
                bonds.append(0x89)  # COLOR (state variable)
                var_hash = hash(line.split("=")[0].strip()) & 0xFFFFFFFF
                bonds.extend(var_hash.to_bytes(4, "little"))
                continue

            # function call
            if "(" in line and ")" in line:
                bonds.append(0x8C)  # EMIT (function call)
                call_hash = hash(line) & 0xFFFFFFFF
                bonds.extend(call_hash.to_bytes(4, "little"))
                continue

            # Default: generic instruction
            bonds.append(0x86)  # TEXT (code as text)
            line_bytes = line[:50].encode("utf-8")  # Max 50 chars
            bonds.append(len(line_bytes))
            bonds.extend(line_bytes)

        # Footer - Self-Edit Permission
        bonds.append(0x88)  # LAYER
        bonds.extend((255).to_bytes(2, "little"))  # Z=255 (system layer)

        bonds.append(0x8F)  # THAW - System ready for edits

        self.dna_bonds = bytes(bonds)
        return self.dna_bonds

    def get_code_garden_coords(self) -> Tuple[int, int]:
        """Return coordinates where Code Garden lives"""
        return (-1000, -1000)

    def plant(self, use_bridge: bool = True) -> bool:
        """
        Plant the DNA in the spatial buffer.

        Args:
            use_bridge: Use GeometryBridge if available, else write to local buffer

        Returns:
            True if planting succeeded
        """
        if not self.dna_bonds:
            self.transpile_to_bonds()

        x, y = self.get_code_garden_coords()

        if use_bridge and HAS_GEOMETRY_BRIDGE:
            try:
                bridge = GeometryBridge(canvas_offset=(x, y))
                bonds = self._build_planting_bonds()
                bridge.runner.write_spatial_tokens(bonds, x, y)
                print(f"✓ Planted {len(self.dna_bonds)} bytes at ({x}, {y}) via GeometryBridge")
                return True
            except Exception as e:
                print(f"⚠ GeometryBridge failed: {e}, falling back to local buffer")

        return self._plant_to_local_buffer(x, y)

    def _plant_to_local_buffer(self, x: int, y: int) -> bool:
        """Plant to local buffer file for later injection"""
        buffer_path = Path(__file__).parent / ".code_garden.buffer"

        planting_bonds = self._build_planting_bonds()

        with open(buffer_path, "wb") as f:
            f.write(planting_bonds)

        print(f"✓ Planted {len(self.dna_bonds)} bytes to local buffer: {buffer_path}")
        print(f"  Code Garden location: ({x}, {y})")
        print(f"  Inject manually or wait for auto-sync")

        return True

    def _build_planting_bonds(self) -> bytes:
        """Build bonds for planting operation"""
        bonds = bytearray()

        bonds.append(0x80)  # MOVE
        x, y = self.get_code_garden_coords()
        bonds.extend(x.to_bytes(2, "little", signed=True))
        bonds.extend(y.to_bytes(2, "little", signed=True))

        bonds.append(0x89)  # COLOR (cyan for DNA)
        bonds.extend([0, 255, 255, 255])

        bonds.append(0x86)  # TEXT
        dna_bytes = self.dna_bonds[:255]
        bonds.append(len(dna_bytes))
        bonds.extend(dna_bytes)

        bonds.append(0x8F)  # THAW - enable self-modification
        bonds.extend((1).to_bytes(2, "little"))  # enable=1

        return bytes(bonds)

    def describe_dna(self) -> str:
        """Describe the DNA structure"""
        if not self.dna_bonds:
            self.transpile_to_bonds()

        return f"""
SELF-HOSTING DNA
================

Source: {self.source_file}
DNA Size: {len(self.dna_bonds)} bytes
Code Garden: {self.get_code_garden_coords()}

Structure:
- Header: DNA1 magic + version
- Origin: MOVE to (-1000, -1000)
- Functions: AGENT tokens (0x8B)
- Loops: LOOP tokens (0x90)
- Conditionals: IF tokens (0x92)
- Variables: COLOR tokens (0x89)
- Calls: EMIT tokens (0x8C)
- Footer: LAYER 255 + THAW

Live Edit Protocol:
1. Walk to (-1000, -1000)
2. Find target Pixel-Byte
3. Move to change value
4. Kernel absorbs instantly
5. OS evolves

Defense:
- No .exe files
- No registry
- No System32
- Only 0x80-0x8F tokens
- Invalid pixels ignored
"""


def main():
    parser = argparse.ArgumentParser(description="Self-Hosting DNA - OS Editing Its Own Source")
    parser.add_argument("--transpile", action="store_true", help="Generate DNA (default)")
    parser.add_argument("--plant", action="store_true", help="Plant DNA in spatial buffer")
    parser.add_argument(
        "--source", type=str, default="the_mirror.py", help="Source file to transpile"
    )
    args = parser.parse_args()

    print("=" * 60)
    print("SELF-HOSTING DNA - OS Editing Its Own Source")
    print("=" * 60)

    dna = SelfHostingDNA(args.source)

    # Read source
    print("\nReading source code...")
    source = dna.read_source()
    print(f"Source lines: {len(source.split(chr(10)))}")

    # Transpile
    print("\nTranspiling to Geometry Bonds...")
    bonds = dna.transpile_to_bonds()
    print(f"DNA Size: {len(bonds)} bytes")

    # Show structure
    print(dna.describe_dna())

    # Show hex
    print("\nDNA Hex (first 200 bytes):")
    print(bonds[:200].hex())

    # Plant if requested
    if args.plant:
        print("\n" + "=" * 60)
        print("PLANTING DNA IN SPATIAL BUFFER")
        print("=" * 60)
        dna.plant()
        print("\n✓ Code Garden planted at (-1000, -1000)")
        print("  The OS can now edit its own DNA from within.")
    else:
        print("\n" + "=" * 60)
        print("SELF-HOSTING DNA READY")
        print("=" * 60)
        print("\nTo plant in buffer:")
        print("  python3 self_hosting_dna.py --plant")
        print("\nCode Garden lives at (-1000, -1000)")
        print("Walk there to edit the OS from within the OS.")
        print("\n🔷🔒 The OS is now editing its own DNA")


if __name__ == "__main__":
    main()
