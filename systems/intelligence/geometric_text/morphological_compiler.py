"""
Morphological Compiler

Compiles GeoASM (Geometric Assembly) source code to executable RGBA textures.
Each 16x16 glyph encodes an instruction with:
  - R channel = opcode (0x00-0xFF)
  - G channel = operand >> 8 (high byte)
  - B channel = operand & 0xFF (low byte)
  - A channel = morphological intensity from glyph synthesis

Usage:
    python -m systems.intelligence.geometric_text.morphological_compiler input.geo -o output.rts.png
    python -m systems.intelligence.geometric_text.morphological_compiler -v output.rts.png
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, asdict
from typing import Optional, List

import numpy as np
from PIL import Image

from systems.intelligence.geometric_text.geoasm_opcodes import OPCODE_TO_SYMBOL, OPCODE_NAMES
from systems.intelligence.geometric_text.geoasm_parser import GeoASMParser, GeoASMInstruction
from systems.intelligence.geometric_text.universal_font_demo import UniversalMorphologicalFont


@dataclass
class CompileResult:
    """Result of compiling GeoASM to texture."""
    texture: Image.Image
    instructions: list
    errors: list
    metadata: dict


class MorphologicalCompiler:
    """
    Compiles GeoASM source code to executable RGBA textures.

    The output texture is human-readable (as geometric glyphs) AND
    machine-executable (via RGBA channel encoding).

    Example:
        compiler = MorphologicalCompiler()
        texture = compiler.compile("$ 255")
        # texture.size = (16, 16)
        # pixel at (8,8) -> (0x41, 0x00, 0xFF, <intensity>)
    """

    GLYPH_SIZE = 16  # Each glyph is 16x16 pixels

    def __init__(self, model_path: Optional[str] = None):
        """
        Initialize the Morphological Compiler.

        Args:
            model_path: Optional path to the synthesizer model.
                       If None, uses default data/synthesizer_v2.pth
        """
        self.parser = GeoASMParser()
        self.font = UniversalMorphologicalFont(model_path=model_path)

    def compile(self, source: str) -> Image.Image:
        """
        Compile GeoASM source to an RGBA texture.

        Args:
            source: GeoASM source code string

        Returns:
            PIL RGBA Image with encoded instructions
        """
        # Parse source
        instructions, errors = self.parser.parse(source)

        # Handle empty source - return minimal 16x16 texture
        if not instructions:
            return Image.new('RGBA', (self.GLYPH_SIZE, self.GLYPH_SIZE), (0, 0, 0, 0))

        # Calculate canvas size
        width = len(instructions) * self.GLYPH_SIZE
        height = self.GLYPH_SIZE

        # Create RGBA canvas
        canvas = Image.new('RGBA', (width, height), (0, 0, 0, 0))
        canvas_array = np.array(canvas)

        # Render each instruction as a glyph with RGBA encoding
        for idx, instr in enumerate(instructions):
            # Get the morphological glyph for the instruction's symbol
            glyph_gray = self.font.render_char(instr.char)
            glyph_array = np.array(glyph_gray)

            # Create RGBA glyph with encoded instruction
            glyph_rgba = np.zeros((self.GLYPH_SIZE, self.GLYPH_SIZE, 4), dtype=np.uint8)

            # Encode instruction in channels:
            # R = opcode
            # G = operand high byte
            # B = operand low byte
            # A = morphological intensity
            glyph_rgba[:, :, 0] = instr.opcode  # R channel
            glyph_rgba[:, :, 1] = (instr.operand >> 8) & 0xFF  # G channel (high byte)
            glyph_rgba[:, :, 2] = instr.operand & 0xFF  # B channel (low byte)
            glyph_rgba[:, :, 3] = glyph_array  # A channel (intensity)

            # Place glyph on canvas
            x_offset = idx * self.GLYPH_SIZE
            canvas_array[:, x_offset:x_offset + self.GLYPH_SIZE] = glyph_rgba

        return Image.fromarray(canvas_array, 'RGBA')

    def compile_file(self, input_path: str, output_path: Optional[str] = None) -> dict:
        """
        Compile a GeoASM file to an RGBA texture with metadata JSON.

        Args:
            input_path: Path to the .geo source file
            output_path: Optional output path for .rts.png texture.
                        If None, uses input_path with .rts.png extension.

        Returns:
            dict with keys: texture_path, json_path, instructions, errors, metadata
        """
        # Read source
        with open(input_path, 'r') as f:
            source = f.read()

        # Parse to get instructions
        instructions, errors = self.parser.parse(source)

        # Determine output paths
        if output_path is None:
            base = os.path.splitext(input_path)[0]
            output_path = f"{base}.rts.png"

        json_path = os.path.splitext(output_path)[0] + ".json"

        # Compile to texture
        texture = self.compile(source)

        # Save texture
        texture.save(output_path)

        # Build instruction data for JSON (serializable)
        instruction_data = [
            {
                'index': i,
                'opcode': instr.opcode,
                'opcode_name': OPCODE_NAMES.get(instr.opcode, f"0x{instr.opcode:02X}"),
                'operand': instr.operand,
                'symbol': instr.char,
                'line': instr.line,
                'col': instr.col,
            }
            for i, instr in enumerate(instructions)
        ]

        # Build metadata
        metadata = {
            'source_file': os.path.basename(input_path),
            'texture_file': os.path.basename(output_path),
            'texture_size': list(texture.size),
            'instruction_count': len(instructions),
            'error_count': len(errors),
            'glyph_size': self.GLYPH_SIZE,
            'encoding': {
                'R': 'opcode',
                'G': 'operand_high_byte',
                'B': 'operand_low_byte',
                'A': 'morphological_intensity',
            },
        }

        # Save metadata JSON
        json_data = {
            'metadata': metadata,
            'instructions': instruction_data,
            'errors': [str(e) for e in errors],
        }
        with open(json_path, 'w') as f:
            json.dump(json_data, f, indent=2)

        return {
            'texture_path': output_path,
            'json_path': json_path,
            'instructions': instructions,
            'errors': errors,
            'metadata': metadata,
        }

    def decode_pixel(self, pixel: tuple) -> dict:
        """
        Decode an RGBA pixel back to instruction components.

        Args:
            pixel: RGBA tuple (R, G, B, A)

        Returns:
            dict with opcode, operand, intensity
        """
        r, g, b, a = pixel
        return {
            'opcode': r,
            'operand': (g << 8) | b,
            'intensity': a,
        }

    def verify_texture(self, texture_path: str) -> List[dict]:
        """
        Load a PNG texture and decode pixels back to instructions.

        Args:
            texture_path: Path to the .rts.png texture file

        Returns:
            List of dicts with keys: index, opcode, opcode_name, operand, symbol, alpha
        """
        # Load texture
        texture = Image.open(texture_path).convert('RGBA')
        width, height = texture.size

        # Calculate number of glyphs
        num_glyphs = width // self.GLYPH_SIZE

        decoded = []
        for i in range(num_glyphs):
            # Sample center pixel of each glyph
            center_x = i * self.GLYPH_SIZE + self.GLYPH_SIZE // 2
            center_y = self.GLYPH_SIZE // 2

            pixel = texture.getpixel((center_x, center_y))
            decoded_pixel = self.decode_pixel(pixel)

            # Look up symbol and name
            symbol = OPCODE_TO_SYMBOL.get(decoded_pixel['opcode'], '?')
            opcode_name = OPCODE_NAMES.get(decoded_pixel['opcode'], f"0x{decoded_pixel['opcode']:02X}")

            decoded.append({
                'index': i,
                'opcode': decoded_pixel['opcode'],
                'opcode_name': opcode_name,
                'operand': decoded_pixel['operand'],
                'symbol': symbol,
                'alpha': decoded_pixel['intensity'],
            })

        return decoded


def main():
    """CLI entry point for morphological compiler."""
    parser = argparse.ArgumentParser(
        description='Compile GeoASM source to executable RGBA textures',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog='''
Examples:
  Compile a GeoASM file:
    python -m systems.intelligence.geometric_text.morphological_compiler input.geo

  Compile with custom output path:
    python -m systems.intelligence.geometric_text.morphological_compiler input.geo -o output.rts.png

  Verify a compiled texture:
    python -m systems.intelligence.geometric_text.morphological_compiler -v texture.rts.png
'''
    )
    parser.add_argument('input', nargs='?', help='Input .geo source file')
    parser.add_argument('-o', '--output', help='Output .rts.png texture path')
    parser.add_argument('-v', '--verify', metavar='TEXTURE',
                        help='Verify a texture file by decoding it')

    args = parser.parse_args()

    compiler = MorphologicalCompiler()

    # Verify mode
    if args.verify:
        print(f"Verifying texture: {args.verify}")
        decoded = compiler.verify_texture(args.verify)
        print(f"Found {len(decoded)} instructions:")
        for instr in decoded:
            print(f"  [{instr['index']}] {instr['symbol']} ({instr['opcode_name']}) operand={instr['operand']}")
        return 0

    # Compile mode
    if not args.input:
        parser.error("Input file required for compilation (use -h for help)")

    if not os.path.exists(args.input):
        print(f"Error: Input file not found: {args.input}", file=sys.stderr)
        return 1

    print(f"Compiling: {args.input}")
    result = compiler.compile_file(args.input, args.output)

    print(f"Created: {result['texture_path']}")
    print(f"Created: {result['json_path']}")
    print(f"Instructions: {result['metadata']['instruction_count']}")
    print(f"Texture size: {result['metadata']['texture_size']}")

    if result['errors']:
        print(f"Errors: {len(result['errors'])}")
        for err in result['errors']:
            print(f"  {err}")
        return 1

    # Optional: verify the compiled texture
    print("\nVerifying compiled texture...")
    decoded = compiler.verify_texture(result['texture_path'])
    print(f"Verified {len(decoded)} glyphs decoded correctly")

    return 0


if __name__ == '__main__':
    sys.exit(main())
