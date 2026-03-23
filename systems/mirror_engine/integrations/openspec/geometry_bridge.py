#!/usr/bin/env python3
"""
Geometry Bridge for OpenSpec/AutoResearch

Connects the existing ASCII experiment framework to Mirror Engine canvas.
This is the ONLY file we need to create - everything else is imported.

Usage:
    from integrations.openspec.geometry_bridge import GeometryBridge

    bridge = GeometryBridge()
    bonds = bridge.spec_to_canvas(spec, x=100, y=100)
"""

import sys
from pathlib import Path

# Import from autospec (already built)
sys.path.insert(0, "/home/jericho/zion/projects/autospec/autospec/src")
from autospec.autoresearch.ascii_spec import (
    ASCIISpec,
    ASCIISpecParser,
    ASCIISpecRenderer,
    render_result,
)

# Import from Mirror Engine (already built)
MIRROR_ENGINE_PATH = Path(__file__).parent.parent.parent
sys.path.insert(0, str(MIRROR_ENGINE_PATH))
from hex_logic_runner import HexLogicRunner
from geometry_transpiler import GeometryTranspiler


class GeometryBridge:
    """
    Bridges OpenSpec ASCII experiments to Mirror Engine Geometry tokens.

    Uses existing:
    - ASCIISpecParser (from openspec+autoresearch)
    - ASCIISpecRenderer (from openspec+autoresearch)
    - GeometryTranspiler (from mirror_engine)
    - HexLogicRunner (from mirror_engine)
    """

    def __init__(self, canvas_offset: tuple = (0, 0), width: int = 1920, height: int = 1080):
        self.canvas_offset = canvas_offset
        self.width = width
        self.height = height
        self.parser = ASCIISpecParser()
        self.renderer = ASCIISpecRenderer()
        self.transpiler = GeometryTranspiler()
        # Create buffer for runner
        self.buffer = bytearray(width * height * 4)
        self.runner = HexLogicRunner(self.buffer, width, height)

    def parse(self, spec_text: str) -> ASCIISpec:
        """Parse ASCII spec text using existing parser."""
        return self.parser.parse(spec_text)

    def spec_to_canvas(self, spec: ASCIISpec, x: int, y: int, layer: int = 2) -> bytes:
        """
        Convert spec to Geometry bonds for canvas rendering.

        Args:
            spec: Parsed ASCIISpec
            x, y: Canvas coordinates
            layer: Render layer (0-3)

        Returns:
            Geometry bond bytes (0x80-0x8F tokens)
        """
        # Ensure spec has experiment_id
        if not spec.experiment_id:
            spec.experiment_id = "mirror-exp"

        # Render spec to ASCII text
        ascii_text = self.renderer.render(spec, layer=layer)

        # Build Geometry bonds
        bonds = bytearray()

        # MOVE to position
        bonds.append(0x80)  # MOVE
        bonds.extend((x + self.canvas_offset[0]).to_bytes(2, "little", signed=True))
        bonds.extend((y + self.canvas_offset[1]).to_bytes(2, "little", signed=True))

        # COLOR (cyan for experiments)
        bonds.append(0x89)  # COLOR
        bonds.extend([0, 255, 255, 255])  # RGBA

        # TEXT with ASCII spec
        bonds.append(0x86)  # TEXT
        text_bytes = ascii_text.encode("utf-8")[:255]
        bonds.append(len(text_bytes))
        bonds.extend(text_bytes)

        return bytes(bonds)

    def result_to_canvas(self, result, spec: ASCIISpec, x: int, y: int) -> bytes:
        """
        Convert experiment result to Geometry bonds.

        Args:
            result: ExperimentResult from AutoResearch
            spec: Original ASCIISpec
            x, y: Canvas coordinates

        Returns:
            Geometry bond bytes
        """
        # Render result to ASCII
        ascii_text = render_result(result, spec)

        bonds = bytearray()

        # MOVE
        bonds.append(0x80)
        bonds.extend((x + self.canvas_offset[0]).to_bytes(2, "little", signed=True))
        bonds.extend((y + self.canvas_offset[1]).to_bytes(2, "little", signed=True))

        # COLOR based on status
        bonds.append(0x89)  # COLOR
        if hasattr(result.status, "value"):
            status = result.status.value
        else:
            status = str(result.status)

        if status == "keep":
            bonds.extend([0, 255, 0, 255])  # Green
        else:
            bonds.extend([255, 100, 100, 255])  # Red

        # TEXT
        bonds.append(0x86)
        text_bytes = ascii_text.encode("utf-8")[:255]
        bonds.append(len(text_bytes))
        bonds.extend(text_bytes)

        return bytes(bonds)

    def execute_on_canvas(self, spec_text: str, x: int = 0, y: int = 0) -> tuple:
        """
        Full pipeline: Parse → Render → Display

        Args:
            spec_text: ASCII spec text
            x, y: Canvas coordinates

        Returns:
            (spec_bonds, result_bonds, mock_result)
        """
        # Parse
        spec = self.parse(spec_text)

        # Ensure experiment_id
        if not spec.experiment_id:
            spec.experiment_id = "mirror-exp"

        # Render spec to canvas
        spec_bonds = self.spec_to_canvas(spec, x, y)

        # Mock result for demo (real use would use AutoResearch ExperimentLoop)
        from dataclasses import dataclass
        from enum import Enum

        class MockStatus(Enum):
            KEEP = "keep"
            REVERT = "revert"

        @dataclass
        class MockResult:
            status: MockStatus
            metric: float
            commit_hash: str
            description: str

        result = MockResult(
            status=MockStatus.KEEP,
            metric=0.8,
            commit_hash="abc123",
            description=f"Test passed for {spec.hypothesis[:30]}",
        )

        # Render result to canvas
        result_bonds = self.result_to_canvas(result, spec, x, y + 15)

        return spec_bonds, result_bonds, result


def demo():
    """Demo: Full ASCII → Geometry pipeline"""
    print("=" * 60)
    print("GEOMETRY BRIDGE DEMO")
    print("=" * 60)

    bridge = GeometryBridge(canvas_offset=(100, 100))

    # AI outputs this naturally:
    spec_text = """
H: Add 0x8E FREEZE token to lock state
T: hex_logic_runner.py
M: exec_time < 1ms
B: 2
"""

    print("\n[1] AI outputs ASCII spec:")
    print(spec_text)

    # Parse
    spec = bridge.parse(spec_text)
    print(f"\n[2] Parsed: {spec.hypothesis}")

    # Render to canvas
    spec_bonds = bridge.spec_to_canvas(spec, x=0, y=0, layer=2)
    print(f"\n[3] Canvas bonds: {spec_bonds.hex()}")
    print(f"    Size: {len(spec_bonds)} bytes")

    # Full pipeline
    print("\n[4] Full pipeline:")
    spec_bonds, result_bonds, result = bridge.execute_on_canvas(spec_text, x=0, y=0)

    print(f"    Spec: {len(spec_bonds)} bytes")
    print(f"    Result: {len(result_bonds)} bytes")
    print(f"    Status: {result.status.value}")

    print("\n" + "=" * 60)
    print("BRIDGE READY")
    print("=" * 60)
    print("\nAI can now:")
    print("  1. Output ASCII spec naturally")
    print("  2. Bridge converts to Geometry tokens")
    print("  3. Render to Mirror Engine canvas")
    print("  4. Execute experiment")
    print("  5. See visual result")


if __name__ == "__main__":
    demo()
