#!/usr/bin/env python3
"""
Merge multiple compiled glyph programs into a single substrate image.
Each program is placed at its designated Hilbert offset.
"""

import numpy as np
from PIL import Image

def hilbert_d2xy(n, d):
    """Convert Hilbert linear index to 2D coordinates."""
    x = y = 0
    s = 1
    while s < n:
        rx = (d >> 1) & 1
        ry = (d ^ rx) & 1
        if ry == 0:
            if rx == 1:
                x = s - 1 - x
                y = s - 1 - y
            x, y = y, x
        x += s * rx
        y += s * ry
        d >>= 2
        s <<= 1
    return x, y

def get_instruction_count(img_path):
    """Count non-black pixels (instructions) in a glyph image."""
    img = Image.open(img_path).convert('RGBA')
    data = np.array(img)
    # Count pixels where any channel is non-zero
    non_zero = np.any(data[:, :, :3] > 0, axis=2)
    return np.sum(non_zero)

def inject_instructions(substrate, img_path, hilbert_offset, instruction_count):
    """Inject instructions at a Hilbert offset, following the curve."""
    img = Image.open(img_path).convert('RGBA')
    data = np.array(img)
    h, w = data.shape[:2]

    # Flatten the source image in Hilbert order
    src_instructions = []
    for d in range(h * w):
        y, x = divmod(d, w)
        pixel = data[y, x]
        if np.any(pixel[:3] > 0):  # Non-black pixel
            src_instructions.append(pixel)

    print(f"  Source has {len(src_instructions)} instructions")

    # Write each instruction to its Hilbert position
    for i, pixel in enumerate(src_instructions[:instruction_count]):
        target_d = hilbert_offset + i
        tx, ty = hilbert_d2xy(4096, target_d)
        if ty < 4096 and tx < 4096:
            substrate[ty, tx] = pixel

    return substrate

def main():
    # Create 4096x4096 black substrate
    substrate = np.zeros((4096, 4096, 4), dtype=np.uint8)

    # Configuration: (image_path, hilbert_offset)
    programs = [
        ('/tmp/daemon.rts.png', 0),              # Root at 0
        ('/tmp/emulator_v5.rts.png', 0x10000), # Emulator at 64K
    ]

    for path, offset in programs:
        print(f"\nProcessing {path} at offset {offset} (0x{offset:X})...")
        count = get_instruction_count(path)
        print(f"  Found ~{count} non-zero pixels")
        inject_instructions(substrate, path, offset, count)

    # Save merged substrate
    output_path = '/tmp/geos_substrate_merged.rts.png'
    Image.fromarray(substrate).save(output_path)
    print(f"\n✓ Saved merged substrate to {output_path}")

if __name__ == '__main__':
    main()
