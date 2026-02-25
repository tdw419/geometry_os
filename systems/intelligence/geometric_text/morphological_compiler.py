"""
Morphological Compiler

Compiles GeoASM (Geometric Assembly) source code to executable RGBA textures.
Each 16x16 glyph encodes an instruction with:
  - R channel = opcode (0x00-0xFF)
  - G channel = operand >> 8 (high byte)
  - B channel = operand & 0xFF (low byte)
  - A channel = morphological intensity from glyph synthesis
"""

import os
from dataclasses import dataclass
from typing import Optional

import numpy as np
from PIL import Image

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
        Compile a GeoASM file to an RGBA texture with metadata.

        Args:
            input_path: Path to the .geo source file
            output_path: Optional output path for .rts.png texture.
                        If None, uses input_path with .rts.png extension.

        Returns:
            dict with keys: texture_path, instructions, errors, metadata
        """
        # Read source
        with open(input_path, 'r') as f:
            source = f.read()

        # Parse to get instructions
        instructions, errors = self.parser.parse(source)

        # Determine output path
        if output_path is None:
            base = os.path.splitext(input_path)[0]
            output_path = f"{base}.rts.png"

        # Compile to texture
        texture = self.compile(source)

        # Save texture
        texture.save(output_path)

        # Build metadata
        metadata = {
            'source_file': input_path,
            'texture_file': output_path,
            'texture_size': texture.size,
            'instruction_count': len(instructions),
            'error_count': len(errors),
        }

        return {
            'texture_path': output_path,
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
