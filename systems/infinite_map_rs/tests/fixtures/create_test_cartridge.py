#!/usr/bin/env python3
"""Create a test .rts.png file for integration testing.

Generates gradient .rts.png cartridge files using PixelRTS v2 encoding.
"""

import sys
import os
from pathlib import Path

# Get the repo root and add pixel_compiler to path
script_path = Path(__file__).resolve()
repo_root = script_path.parents[4]  # Go up to geometry_os root
pixel_compiler_path = repo_root / "systems" / "pixel_compiler"
sys.path.insert(0, str(pixel_compiler_path))

from pixelrts_v2_core import PixelRTSEncoder


def create_test_cartridge(output_path: str, size: int = 64, mode: str = "standard"):
    """Create a test cartridge .rts.png with a gradient pattern.

    Args:
        output_path: Path to save the .rts.png file
        size: Grid size (must be power of 2)
        mode: Encoding mode ("standard" or "code")
    """
    # Verify size is power of 2
    if size & (size - 1) != 0:
        raise ValueError(f"Size must be power of 2, got {size}")

    # Create gradient pattern data
    # Each pixel gets 4 bytes (RGBA), so we need size*size*4 bytes
    data = bytearray(size * size * 4)

    for y in range(size):
        for x in range(size):
            idx = (y * size + x) * 4
            data[idx + 0] = int((x / size) * 255)     # Red: horizontal gradient
            data[idx + 1] = int((y / size) * 255)     # Green: vertical gradient
            data[idx + 2] = 128                       # Blue: constant
            data[idx + 3] = 255                       # Alpha: fully opaque

    # Create metadata
    metadata = {
        "type": "test_cartridge",
        "name": f"test_cartridge_{size}x{size}",
        "description": "Test cartridge for integration testing",
        "generation": 0,
    }

    # Encode and save
    encoder = PixelRTSEncoder(mode=mode)
    encoder.save(
        data=bytes(data),
        output_path=output_path,
        metadata=metadata,
        grid_size=size,
        sidecar=True
    )

    print(f"Created test cartridge: {output_path}")
    print(f"  Size: {size}x{size}")
    print(f"  Mode: {mode}")
    print(f"  Data: {len(data)} bytes")


if __name__ == '__main__':
    import argparse

    parser = argparse.ArgumentParser(
        description='Create test .rts.png cartridge files'
    )
    parser.add_argument(
        'output',
        nargs='?',
        default='test_cartridge.rts.png',
        help='Output .rts.png file path (default: test_cartridge.rts.png)'
    )
    parser.add_argument(
        '--size', '-s',
        type=int,
        default=64,
        help='Grid size (power of 2, default: 64)'
    )
    parser.add_argument(
        '--mode', '-m',
        choices=['standard', 'code'],
        default='standard',
        help='Encoding mode (default: standard)'
    )

    args = parser.parse_args()

    create_test_cartridge(args.output, args.size, args.mode)
