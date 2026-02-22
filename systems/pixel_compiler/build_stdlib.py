#!/usr/bin/env python3
"""
Build standard library as .rts.png
"""

import sys
import os

# Add parent directory to path for imports
sys.path.insert(0, os.path.dirname(__file__))

from vasm import VisualAssembler
from visual_linker import VisualLinker

def build_stdlib(output_path='stdlib.rts.png'):
    # Read stdlib.vasm
    script_dir = os.path.dirname(os.path.abspath(__file__))
    stdlib_path = os.path.join(script_dir, 'stdlib.vasm')
    output_full_path = os.path.join(script_dir, output_path)

    with open(stdlib_path, 'r') as f:
        source = f.read()

    # Assemble
    assembler = VisualAssembler()
    assembler.compile(source)

    # Get function addresses for exports
    exports = [
        ('math_add', assembler.labels.get('math_add', 0)),
        ('math_sub', assembler.labels.get('math_sub', 0)),
        ('math_mul', assembler.labels.get('math_mul', 0)),
        ('math_div', assembler.labels.get('math_div', 0)),
        ('cmp_eq', assembler.labels.get('cmp_eq', 0)),
        ('cmp_lt', assembler.labels.get('cmp_lt', 0)),
        ('mem_copy', assembler.labels.get('mem_copy', 0)),
        ('mem_set', assembler.labels.get('mem_set', 0)),
    ]

    # Encode with exports in Visual ABI header
    pixels = assembler.encode_to_pixels(mode='code')
    linker = VisualLinker()
    pixels = linker.write_exports(pixels, exports)

    # Save PNG
    from PIL import Image
    img = Image.fromarray(pixels, 'RGBA')
    img.save(output_full_path)

    print(f"Built stdlib with {len(exports)} functions -> {output_path}")
    for name, addr in exports:
        print(f"   {name}: @0x{addr:04x}")

    return 0

if __name__ == '__main__':
    sys.exit(build_stdlib())
