#!/usr/bin/env python3
"""
Merge RTS Textures - Unified RAM Builder for Geometry OS

Combines multiple .rts.png programs into a single Hilbert-mapped texture
at specified offsets. This creates the unified spatial memory substrate.

Usage:
    python merge_rts_textures.py output.rts.png program1.rts.png:offset program2.rts.png:offset ...

Example:
    python merge_rts_textures.py unified_boot.rts.png \
        window_manager.rts.png:0 \
        ubuntu_native.rts.png:32768

The output texture uses Hilbert curve addressing, so programs are placed
at the correct spatial coordinates.
"""

import sys
import numpy as np
from PIL import Image
from pathlib import Path


class HilbertCurve:
    """Hilbert curve utilities for spatial mapping."""

    @staticmethod
    def d2xy(n: int, d: int) -> tuple[int, int]:
        """Convert Hilbert index d to (x, y) coordinates in n x n grid."""
        x, y = 0, 0
        s = 1
        t = d
        while s < n:
            rx = 1 & (t // 2)
            ry = 1 & (t ^ rx)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            x += s * rx
            y += s * ry
            t //= 4
            s *= 2
        return x, y

    @staticmethod
    def xy2d(n: int, x: int, y: int) -> int:
        """Convert (x, y) coordinates to Hilbert index d."""
        d = 0
        s = n // 2
        while s > 0:
            rx = 1 if (x & s) else 0
            ry = 1 if (y & s) else 0
            d += s * s * ((3 * rx) ^ ry)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            s //= 2
        return d


def merge_textures(output_path: str, programs: list[tuple[str, int]], grid_size: int = 4096):
    """
    Merge multiple RTS textures into a unified Hilbert-mapped texture.

    Args:
        output_path: Path to save the unified texture
        programs: List of (path, hilbert_offset) tuples
        grid_size: Size of the output texture (must be power of 2)
    """
    print(f"[MERGE] Creating unified RAM texture ({grid_size}x{grid_size})")

    # Create output canvas
    output = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
    hilbert = HilbertCurve()

    for program_path, offset in programs:
        print(f"[MERGE] Loading: {program_path} at offset 0x{offset:X}")

        # Load the source texture
        img = Image.open(program_path)
        if img.mode != 'RGBA':
            img = img.convert('RGBA')
        src_data = np.array(img)
        src_h, src_w = src_data.shape[:2]

        print(f"[MERGE]   Source: {src_w}x{src_h} ({src_w * src_h} pixels)")
        print(f"[MERGE]   Placing at Hilbert offset: {offset} (0x{offset:X})")

        # Copy each pixel from source to correct Hilbert position
        # Source image is already Hilbert-mapped, so we read sequentially
        for src_idx in range(src_w * src_h):
            # Source position (sequential in Hilbert-mapped texture)
            src_x = src_idx % src_w
            src_y = src_idx // src_w

            if src_y >= src_h:
                break

            # Destination Hilbert index
            dst_d = offset + src_idx

            # Check bounds
            if dst_d >= grid_size * grid_size:
                print(f"[MERGE]   WARNING: Texture overflow at index {dst_d}")
                break

            # Convert to destination (x, y)
            dst_x, dst_y = hilbert.d2xy(grid_size, dst_d)

            # Copy pixel
            output[dst_y, dst_x] = src_data[src_y, src_x]

        print(f"[MERGE]   ✓ Placed {min(src_w * src_h, grid_size * grid_size - offset)} pixels")

    # Save the unified texture
    print(f"[MERGE] Saving to: {output_path}")
    Image.fromarray(output, 'RGBA').save(output_path)

    # Print summary
    total_used = sum(min(
        Image.open(p).width * Image.open(p).height,
        grid_size * grid_size - o
    ) for p, o in programs)
    print(f"[MERGE] ✓ Complete: {total_used} pixels used in {grid_size}x{grid_size} grid")
    print(f"[MERGE]   Utilization: {100 * total_used / (grid_size * grid_size):.2f}%")


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        sys.exit(1)

    output_path = sys.argv[1]
    programs = []

    for arg in sys.argv[2:]:
        if ':' in arg:
            path, offset_str = arg.rsplit(':', 1)
            offset = int(offset_str, 0)  # Support hex (0x) and decimal
            programs.append((path, offset))
        else:
            print(f"[ERROR] Invalid format: {arg}. Expected path:offset")
            sys.exit(1)

    if not programs:
        print("[ERROR] No programs specified")
        sys.exit(1)

    merge_textures(output_path, programs)


if __name__ == "__main__":
    main()
