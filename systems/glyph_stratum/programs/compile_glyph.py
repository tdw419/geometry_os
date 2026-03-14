#!/usr/bin/env python3
"""Compile a .glyph file to .rts.png"""

import sys
import os

# Add parent directory to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from glyph_stratum.glyph_to_rts import compile_glyph_file

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: compile_glyph.py <input.glyph> <output.rts.png>")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    try:
        compile_glyph_file(input_path, output_path)
        print(f"✓ Compiled: {input_path} -> {output_path}")
    except Exception as e:
        print(f"✗ Error: {e}")
        sys.exit(1)
