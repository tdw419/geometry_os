#!/usr/bin/env python3
"""
Convert safetensors model to PixelBrain weight atlas (PNG).

This script converts a HuggingFace safetensors model file into a Hilbert-folded
weight atlas that can be loaded as a GPU texture for PixelBrain inference.

Usage:
    python convert_safetensors.py model.safetensors output.rts.png --size 2048

The output PNG is an RGBA image where:
- R, G channels: Float16 weight bits (R=low byte, G=high byte)
- B channel: Reserved (0)
- A channel: Full opacity (255)

Hilbert curve addressing ensures spatial locality - weights that are
semantically related stay near each other in 2D texture space.
"""

import argparse
import struct
import json
from pathlib import Path

import numpy as np
from PIL import Image

try:
    from safetensors import safe_open
except ImportError:
    print("Error: safetensors not installed. Run: pip install safetensors")
    exit(1)


def float32_to_f16_bytes(value: float) -> bytes:
    """Convert float32 to float16 bytes (little-endian)."""
    f16 = np.float16(value)
    return struct.pack('<e', f16)


def encode_weight_rgba(value: float) -> tuple:
    """Encode weight as RGBA pixel (float16 in R,G channels)."""
    f16_bytes = float32_to_f16_bytes(value)
    return (f16_bytes[0], f16_bytes[1], 0, 255)


def hilbert_d2xy(n: int, d: int) -> tuple:
    """
    Convert Hilbert distance to (x, y) coordinates.

    This is the canonical implementation matching the Rust hilbert module.

    Args:
        n: Grid size (must be power of 2)
        d: Distance along the curve (0 to n²-1)

    Returns:
        (x, y) coordinates where 0 ≤ x, y < n
    """
    x = y = 0
    s = 1
    t = d

    while s < n:
        rx = 1 & (t // 2)
        ry = 1 & (t ^ rx)

        # Rotate/flip quadrant
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            # Swap x and y
            x, y = y, x

        x += s * rx
        y += s * ry
        t //= 4
        s *= 2

    return x, y


def convert_safetensors_to_atlas(
    input_path: str,
    output_path: str,
    size: int = 2048,
    verbose: bool = True
) -> dict:
    """
    Convert safetensors model to PNG weight atlas.

    Args:
        input_path: Path to .safetensors file
        output_path: Path to output .rts.png file
        size: Atlas texture size (default 2048x2048)
        verbose: Print progress messages

    Returns:
        Metadata dict with conversion statistics
    """
    if verbose:
        print(f"[CONVERT] Loading {input_path}...")

    # Load all tensors
    tensors = {}
    tensor_shapes = {}
    with safe_open(input_path, framework="numpy") as f:
        for key in f.keys():
            tensor = f.get_tensor(key)
            tensors[key] = tensor
            tensor_shapes[key] = list(tensor.shape)

    total_params = sum(t.size for t in tensors.values())
    if verbose:
        print(f"[CONVERT] Found {len(tensors)} tensors, {total_params:,} total parameters")

    # Check if atlas is large enough
    max_params = size * size
    if total_params > max_params:
        print(f"[WARN] Atlas too small: {total_params:,} params > {max_params:,} capacity")
        print(f"[WARN] Only first {max_params:,} params will be stored")

    # Create atlas image
    atlas = Image.new('RGBA', (size, size), (0, 0, 0, 255))
    pixels = atlas.load()

    # Flatten and write weights sequentially using Hilbert addressing
    addr = 0
    tensor_offsets = {}

    for name in sorted(tensors.keys()):
        tensor = tensors[name]
        flat = tensor.flatten().astype(np.float32)
        tensor_offsets[name] = {
            "start": addr,
            "count": len(flat),
            "shape": tensor_shapes[name]
        }

        if verbose:
            print(f"[CONVERT] Writing {name}: {len(flat):,} weights at addr 0x{addr:06X}")

        for weight in flat:
            if addr >= max_params:
                if verbose:
                    print(f"[WARN] Atlas full at {addr:,} weights")
                break

            x, y = hilbert_d2xy(size, addr)
            pixels[x, y] = encode_weight_rgba(float(weight))
            addr += 1

        if addr >= max_params:
            break

    if verbose:
        print(f"[CONVERT] Total weights written: {addr:,}")

    # Save atlas
    atlas.save(output_path)
    if verbose:
        print(f"[CONVERT] Saved atlas to {output_path}")

    # Create metadata file
    meta = {
        "format": "pixel_brain_weight_atlas",
        "version": 1,
        "size": size,
        "total_params": addr,
        "encoding": "float16_rgba",
        "addressing": "hilbert",
        "source": str(input_path),
        "tensors": tensor_offsets
    }

    meta_path = Path(output_path).with_suffix('.meta.json')
    with open(meta_path, 'w') as f:
        json.dump(meta, f, indent=2)

    if verbose:
        print(f"[CONVERT] Saved metadata to {meta_path}")

    return meta


def main():
    parser = argparse.ArgumentParser(
        description="Convert safetensors to PixelBrain PNG atlas",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Convert TinyStories-1M model
  python convert_safetensors.py model.safetensors brain.rts.png

  # Use 4096x4096 atlas for larger models
  python convert_safetensors.py model.safetensors brain.rts.png --size 4096

  # Download from HuggingFace and convert
  huggingface-cli download roneneldan/TinyStories-1M model.safetensors --local-dir .
  python convert_safetensors.py model.safetensors tinystories.rts.png
        """
    )
    parser.add_argument("input", help="Input safetensors file")
    parser.add_argument("output", help="Output PNG file (.rts.png)")
    parser.add_argument("--size", type=int, default=2048,
                        help="Atlas size (default: 2048)")
    parser.add_argument("--quiet", action="store_true",
                        help="Suppress progress messages")

    args = parser.parse_args()

    convert_safetensors_to_atlas(
        args.input,
        args.output,
        size=args.size,
        verbose=not args.quiet
    )


if __name__ == "__main__":
    main()
