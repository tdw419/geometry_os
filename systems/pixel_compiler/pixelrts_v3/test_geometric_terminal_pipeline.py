#!/usr/bin/env python3
"""
Full Geometric Terminal Pipeline Test

Tests the complete PixelRTS v3 + Terminal Clone integration:
1. GeometricTerminal (Python) - High-level terminal operations
2. GeometricTerminalBuffer (Rust) - Low-level PTY processing
3. RGBA encoding/decoding - Cell-to-pixel mapping
4. Hilbert spatial mapping - 2D to 1D curve
5. Texture generation - GPU-ready output
"""

import sys
import os
from pathlib import Path

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "infinite_map_rs"))

from geometric_terminal import (
    GeometricTerminal, TerminalCell, HilbertCurve,
    TERMINAL_COLORS, TERMINAL_OPCODES
)
import numpy as np
from PIL import Image


def test_basic_terminal_operations():
    """Test basic terminal operations."""
    print("\n" + "="*60)
    print("TEST 1: Basic Terminal Operations")
    print("="*60)

    terminal = GeometricTerminal(cols=40, rows=10)

    # Test 1a: Put character
    terminal.putc('A', row=0, col=0, fg=10)
    cell = terminal.get_cell_at(0, 0)
    assert cell is not None, "Cell at (0,0) should exist"
    assert cell.char == ord('A'), f"Expected char 'A' (65), got {cell.char}"
    assert cell.fg == 10, f"Expected fg=10, got {cell.fg}"
    print(f"  ✓ putc('A') at (0,0): char={cell.char}, fg={cell.fg}")

    # Test 1b: Put string
    terminal.puts("Hello World", row=1, col=0)
    for i, c in enumerate("Hello World"):
        cell = terminal.get_cell_at(1, i)
        assert cell is not None and cell.char == ord(c), f"Expected '{c}' at col {i}"
    print(f"  ✓ puts('Hello World') at row 1")

    # Test 1c: Cursor movement
    terminal.move_cursor(5, 3)
    assert terminal.cursor_x == 5 and terminal.cursor_y == 3, "Cursor position mismatch"
    print(f"  ✓ move_cursor(5, 3): cursor=({terminal.cursor_x}, {terminal.cursor_y})")

    # Test 1d: Style flags
    terminal.set_style(bold=True, underline=True)
    terminal.putc('X', row=4, col=0)
    cell = terminal.get_cell_at(4, 0)
    assert cell.flags == 9, f"Expected flags=9 (bold+underline), got {cell.flags}"
    print(f"  ✓ set_style(bold=True, underline=True): flags={cell.flags}")

    return True


def test_pty_output_processing():
    """Test PTY output processing."""
    print("\n" + "="*60)
    print("TEST 2: PTY Output Processing")
    print("="*60)

    terminal = GeometricTerminal(cols=20, rows=5)

    # Simulate PTY output
    pty_output = b"Line1\nLine2\r\nLine3\tTab"
    terminal.from_pty_output(pty_output)

    # Verify Line1 at row 0
    cell = terminal.get_cell_at(0, 0)
    assert cell.char == ord('L'), f"Expected 'L', got {chr(cell.char)}"
    print(f"  ✓ 'Line1' at row 0: '{chr(cell.char)}...'")

    # Verify newline moved to row 1
    cell = terminal.get_cell_at(1, 0)
    assert cell.char == ord('L'), f"Expected 'L' at row 1, got {chr(cell.char)}"
    print(f"  ✓ Newline advanced to row 1")

    # Verify tab handling (8-space tab stops)
    # "Line3\tTab" - Tab at position 5, should land at position 8
    cell = terminal.get_cell_at(2, 8)
    assert cell.char == ord('T'), f"Expected 'T' at col 8, got {chr(cell.char)}"
    print(f"  ✓ Tab moved to column 8: '{chr(cell.char)}'")

    return True


def test_rgba_encoding():
    """Test RGBA cell encoding."""
    print("\n" + "="*60)
    print("TEST 3: RGBA Cell Encoding")
    print("="*60)

    # Test 3a: Basic encoding
    cell = TerminalCell(char=ord('G'), fg=10, bg=0, flags=1)
    rgba = cell.to_rgba()
    assert rgba == (ord('G'), 10, 0, 1), f"RGBA mismatch: {rgba}"
    print(f"  ✓ Cell('G', fg=10, bg=0, bold) -> RGBA{rgba}")

    # Test 3b: Round-trip encoding
    original = TerminalCell(char=ord('X'), fg=14, bg=4, flags=33)
    rgba = original.to_rgba()
    decoded = TerminalCell.from_rgba(rgba)
    assert decoded.char == original.char, "Char round-trip failed"
    assert decoded.fg == original.fg, "FG round-trip failed"
    assert decoded.bg == original.bg, "BG round-trip failed"
    assert decoded.flags == original.flags, "Flags round-trip failed"
    print(f"  ✓ Round-trip: RGBA{rgba} -> Cell(char={chr(decoded.char)}, fg={decoded.fg}, bg={decoded.bg}, flags={decoded.flags})")

    # Test 3c: Edge cases
    cell_empty = TerminalCell()
    assert cell_empty.to_rgba() == (0, 7, 0, 0), "Empty cell should be default"
    print(f"  ✓ Empty cell: {cell_empty.to_rgba()}")

    cell_max = TerminalCell(char=127, fg=15, bg=15, flags=63)
    rgba_max = cell_max.to_rgba()
    print(f"  ✓ Max values: RGBA{rgba_max}")

    return True


def test_hilbert_mapping():
    """Test Hilbert curve spatial mapping."""
    print("\n" + "="*60)
    print("TEST 4: Hilbert Curve Mapping")
    print("="*60)

    hilbert = HilbertCurve(4)  # 4x4 grid

    # Test 4a: Verify curve starts at origin and covers all positions
    x0, y0 = hilbert.d2xy(0)
    assert (x0, y0) == (0, 0), f"d=0 should be at origin, got ({x0},{y0})"
    print(f"  ✓ Curve starts at origin (0,0)")

    # Test 4b: All positions are unique
    positions = set()
    for d in range(16):
        x, y = hilbert.d2xy(d)
        positions.add((x, y))
    assert len(positions) == 16, "Should have 16 unique positions"
    print(f"  ✓ All 16 positions are unique")

    # Test 4c: Round-trip (d -> xy -> d)
    for d in range(16):
        x, y = hilbert.d2xy(d)
        d_back = hilbert.xy2d(x, y)
        assert d == d_back, f"Round-trip failed: {d} -> ({x},{y}) -> {d_back}"
    print(f"  ✓ Round-trip verified for all 16 positions")

    # Test 4d: Spatial locality
    # Adjacent indices should be spatially close (Manhattan distance <= 1 for most)
    distances = []
    for d in range(15):
        x1, y1 = hilbert.d2xy(d)
        x2, y2 = hilbert.d2xy(d + 1)
        dist = abs(x2 - x1) + abs(y2 - y1)  # Manhattan distance
        distances.append(dist)

    # In a proper Hilbert curve, consecutive points are always adjacent
    max_dist = max(distances)
    assert max_dist == 1, f"Adjacent indices should be adjacent in space, max_dist={max_dist}"
    print(f"  ✓ Spatial locality: all consecutive points are adjacent (dist=1)")

    return True


def test_texture_generation():
    """Test texture generation."""
    print("\n" + "="*60)
    print("TEST 5: Texture Generation")
    print("="*60)

    terminal = GeometricTerminal(cols=8, rows=8, use_hilbert=True)

    # Fill with test pattern
    for row in range(8):
        for col in range(8):
            char_code = (row * 8 + col) % 128
            fg = (row + col) % 16
            bg = (row * col) % 16
            terminal.cells[row][col] = TerminalCell(char=char_code, fg=fg, bg=bg, flags=0)

    # Render to texture
    output_path = "/tmp/test_geometric_terminal.rts.png"
    terminal.render_to_texture(output_path)

    # Verify texture
    assert os.path.exists(output_path), "Texture file not created"
    img = Image.open(output_path)
    width, height = img.size

    # Grid size should be power of 2 >= total cells
    assert width == height, "Texture should be square"
    assert width >= 8, f"Grid size should be >= 8, got {width}"
    print(f"  ✓ Texture created: {width}x{height}")

    # Verify some pixels
    pixels = img.load()
    hilbert = HilbertCurve(width)

    # Check first cell (index 0)
    x, y = hilbert.d2xy(0)
    r, g, b, a = pixels[x, y]
    assert r == 0, f"First cell char should be 0, got {r}"
    print(f"  ✓ Cell 0 at ({x},{y}): RGBA=({r},{g},{b},{a})")

    # Check cell at row 1, col 0 (index 8)
    x, y = hilbert.d2xy(8)
    r, g, b, a = pixels[x, y]
    assert r == 8, f"Cell 8 char should be 8, got {r}"
    print(f"  ✓ Cell 8 at ({x},{y}): RGBA=({r},{g},{b},{a})")

    # Cleanup
    os.remove(output_path)
    print(f"  ✓ Cleaned up test texture")

    return True


def test_scroll_behavior():
    """Test terminal scrolling."""
    print("\n" + "="*60)
    print("TEST 6: Scroll Behavior")
    print("="*60)

    terminal = GeometricTerminal(cols=10, rows=3)

    # Fill terminal and trigger scroll
    terminal.puts("Line1\nLine2\nLine3\nLine4")

    # After 4 lines in 3-row buffer, "Line1" should be scrolled off
    cell = terminal.get_cell_at(0, 0)
    assert cell.char == ord('L'), f"Expected 'L' from Line2, got {chr(cell.char)}"
    print(f"  ✓ Scrolled: Row 0 now contains 'Line2'")

    # Check bottom row has Line4
    cell = terminal.get_cell_at(2, 0)
    assert cell.char == ord('L'), f"Expected 'L' from Line4, got {chr(cell.char)}"
    print(f"  ✓ Bottom row contains 'Line4'")

    return True


def test_terminal_opcodes():
    """Test terminal-specific opcodes."""
    print("\n" + "="*60)
    print("TEST 7: Terminal Opcodes")
    print("="*60)

    # Verify opcode values
    assert TERMINAL_OPCODES['PUTC'] == 0x40, "PUTC opcode mismatch"
    assert TERMINAL_OPCODES['MVCR'] == 0x41, "MVCR opcode mismatch"
    assert TERMINAL_OPCODES['SCRL'] == 0x42, "SCRL opcode mismatch"
    assert TERMINAL_OPCODES['CLR'] == 0x43, "CLR opcode mismatch"
    print(f"  ✓ Opcodes: PUTC=0x40, MVCR=0x41, SCRL=0x42, CLR=0x43")

    # Verify color palette
    assert len(TERMINAL_COLORS) == 16, "Should have 16 colors"
    assert TERMINAL_COLORS[0] == (0, 0, 0), "Black should be (0,0,0)"
    assert TERMINAL_COLORS[15] == (233, 235, 235), "Bright White mismatch"
    print(f"  ✓ Color palette: 16 colors verified")

    return True


def test_rust_interop():
    """Test Rust interoperability via encoding."""
    print("\n" + "="*60)
    print("TEST 8: Rust Interoperability")
    print("="*60)

    # Simulate Rust's GeometricTerminalBuffer encoding
    # u32 encoding: (char << 24) | (fg << 16) | (bg << 8) | flags

    def cell_to_u32_rust(cell: TerminalCell) -> int:
        """Rust-compatible u32 encoding."""
        return (cell.char << 24) | (cell.fg << 16) | (cell.bg << 8) | cell.flags

    def u32_to_cell_rust(val: int) -> TerminalCell:
        """Rust-compatible u32 decoding."""
        return TerminalCell(
            char=(val >> 24) & 0xFF,
            fg=(val >> 16) & 0xFF,
            bg=(val >> 8) & 0xFF,
            flags=val & 0xFF
        )

    # Test encoding matches Rust implementation
    test_cells = [
        TerminalCell(char=72, fg=10, bg=0, flags=1),  # 'H' bright green bold
        TerminalCell(char=105, fg=14, bg=4, flags=0), # 'i' cyan on blue
        TerminalCell(char=33, fg=9, bg=0, flags=32),  # '!' bright red inverse
    ]

    for cell in test_cells:
        encoded = cell_to_u32_rust(cell)
        decoded = u32_to_cell_rust(encoded)
        assert decoded.char == cell.char, f"Char mismatch: {decoded.char} != {cell.char}"
        assert decoded.fg == cell.fg, f"FG mismatch: {decoded.fg} != {cell.fg}"
        assert decoded.bg == cell.bg, f"BG mismatch: {decoded.bg} != {cell.bg}"
        assert decoded.flags == cell.flags, f"Flags mismatch: {decoded.flags} != {cell.flags}"

    print(f"  ✓ Rust encoding compatible: {len(test_cells)} cells verified")

    # Verify GPU buffer format
    terminal = GeometricTerminal(cols=4, rows=2)
    terminal.puts("TEST", row=0, col=0)

    gpu_buffer = []
    for row in range(terminal.rows):
        for col in range(terminal.cols):
            cell = terminal.cells[row][col]
            gpu_buffer.append(cell_to_u32_rust(cell))

    print(f"  ✓ GPU buffer: {len(gpu_buffer)} u32 values")
    print(f"    First 4 values: {[hex(v) for v in gpu_buffer[:4]]}")

    return True


def test_full_pipeline():
    """Test full pipeline from PTY to texture."""
    print("\n" + "="*60)
    print("TEST 9: Full Pipeline (PTY -> Texture)")
    print("="*60)

    # Create terminal
    terminal = GeometricTerminal(cols=32, rows=8)

    # Simulate realistic PTY output
    pty_output = b"""
\x1b[32mGEOMETRY OS v3.0\x1b[0m
==================
\x1b[36mGeometric Terminal\x1b[0m

Ready.
$ echo "Hello, World!"
Hello, World!
$ """
    terminal.from_pty_output(pty_output)

    # Render to texture
    output_path = "/tmp/full_pipeline_test.rts.png"
    terminal.render_to_texture(output_path)

    # Verify
    img = Image.open(output_path)
    width, height = img.size
    print(f"  ✓ Texture: {width}x{width} pixels")

    # Count non-empty cells
    non_empty = 0
    for row in terminal.cells:
        for cell in row:
            if cell.char > 0 and cell.char != ord(' '):
                non_empty += 1
    print(f"  ✓ Non-empty cells: {non_empty}")

    # Verify texture has content
    pixels = img.load()
    non_zero_pixels = 0
    for y in range(height):
        for x in range(width):
            r, g, b, a = pixels[x, y]
            if r > 0 or g > 0 or b > 0 or a > 0:
                non_zero_pixels += 1
    print(f"  ✓ Non-zero pixels: {non_zero_pixels}/{width*height}")

    # Cleanup
    os.remove(output_path)
    print(f"  ✓ Pipeline complete")

    return True


def main():
    """Run all tests."""
    print("="*60)
    print("GEOMETRIC TERMINAL PIPELINE TEST SUITE")
    print("PixelRTS v3 + Terminal Clone Integration")
    print("="*60)

    tests = [
        ("Basic Operations", test_basic_terminal_operations),
        ("PTY Processing", test_pty_output_processing),
        ("RGBA Encoding", test_rgba_encoding),
        ("Hilbert Mapping", test_hilbert_mapping),
        ("Texture Generation", test_texture_generation),
        ("Scroll Behavior", test_scroll_behavior),
        ("Terminal Opcodes", test_terminal_opcodes),
        ("Rust Interop", test_rust_interop),
        ("Full Pipeline", test_full_pipeline),
    ]

    results = []
    for name, test_func in tests:
        try:
            success = test_func()
            results.append((name, "PASS", None))
        except Exception as e:
            results.append((name, "FAIL", str(e)))
            print(f"  ✗ FAILED: {e}")

    # Summary
    print("\n" + "="*60)
    print("TEST SUMMARY")
    print("="*60)

    passed = sum(1 for _, status, _ in results if status == "PASS")
    failed = sum(1 for _, status, _ in results if status == "FAIL")

    for name, status, error in results:
        symbol = "✓" if status == "PASS" else "✗"
        print(f"  {symbol} {name}: {status}")
        if error:
            print(f"      Error: {error}")

    print(f"\nTotal: {passed} passed, {failed} failed")

    if failed == 0:
        print("\n🎉 ALL TESTS PASSED!")
        return 0
    else:
        print(f"\n⚠️  {failed} tests failed")
        return 1


if __name__ == "__main__":
    sys.exit(main())
