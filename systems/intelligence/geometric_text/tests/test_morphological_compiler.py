"""
Unit tests for Morphological Compiler

Tests for compiling GeoASM source code to executable RGBA textures.
"""

import json
import os
import tempfile
import pytest
from PIL import Image

from systems.intelligence.geometric_text.morphological_compiler import (
    MorphologicalCompiler,
    CompileResult,
)
from systems.intelligence.geometric_text.geoasm_opcodes import (
    OP_I32_CONST,
    OP_I32_ADD,
    OP_I32_SUB,
)


@pytest.fixture
def compiler():
    """Create a MorphologicalCompiler instance for testing."""
    return MorphologicalCompiler()


class TestCompileEmpty:
    """Tests for empty source compilation."""

    def test_compile_empty_returns_valid_texture(self, compiler):
        """Empty source returns valid 16x16 RGBA texture."""
        texture = compiler.compile("")

        assert texture is not None
        assert texture.size == (16, 16)
        assert texture.mode == 'RGBA'

    def test_compile_empty_all_transparent(self, compiler):
        """Empty texture has all transparent pixels."""
        texture = compiler.compile("")

        # Sample center pixel
        pixel = texture.getpixel((8, 8))
        assert pixel == (0, 0, 0, 0)


class TestCompileSingleInstruction:
    """Tests for single instruction compilation."""

    def test_compile_single_instruction_returns_16x16_texture(self, compiler):
        """Single '$ 5' returns 16x16 texture."""
        texture = compiler.compile("$ 5")

        assert texture.size == (16, 16)
        assert texture.mode == 'RGBA'

    def test_compile_single_instruction_encoding(self, compiler):
        """'$ 5' encodes opcode and operand correctly."""
        texture = compiler.compile("$ 5")

        # Sample center pixel
        pixel = texture.getpixel((8, 8))
        r, g, b, a = pixel

        # R = opcode (0x41 for i32.const)
        assert r == OP_I32_CONST

        # G = operand high byte (5 >> 8 = 0)
        assert g == 0

        # B = operand low byte (5 & 0xFF = 5)
        assert b == 5

        # A > 0 (morphological intensity from glyph)
        assert a > 0


class TestCompileMultipleInstructions:
    """Tests for multiple instruction compilation."""

    def test_compile_multiple_instructions_returns_48x16_texture(self, compiler):
        """'$ 5 $ 3 +' returns 48x16 texture (3 glyphs * 16px)."""
        texture = compiler.compile("$ 5 $ 3 +")

        assert texture.size == (48, 16)
        assert texture.mode == 'RGBA'

    def test_compile_multiple_instructions_encoding(self, compiler):
        """Each glyph encodes correct instruction."""
        texture = compiler.compile("$ 5 $ 3 +")

        # First glyph: $ 5
        pixel0 = texture.getpixel((8, 8))  # Center of first 16px glyph
        assert pixel0[0] == OP_I32_CONST  # R = opcode
        assert pixel0[2] == 5  # B = operand low byte

        # Second glyph: $ 3
        pixel1 = texture.getpixel((24, 8))  # Center of second 16px glyph
        assert pixel1[0] == OP_I32_CONST  # R = opcode
        assert pixel1[2] == 3  # B = operand low byte

        # Third glyph: +
        pixel2 = texture.getpixel((40, 8))  # Center of third 16px glyph
        assert pixel2[0] == OP_I32_ADD  # R = opcode


class TestRGBAEncoding:
    """Tests for RGBA channel encoding protocol."""

    def test_rgba_encoding_opcode_in_red(self, compiler):
        """Opcode is encoded in R channel."""
        texture = compiler.compile("$ 5")

        pixel = texture.getpixel((8, 8))
        assert pixel[0] == OP_I32_CONST

    def test_rgba_encoding_high_byte_in_green(self, compiler):
        """Operand high byte is encoded in G channel."""
        # 1000 = 0x03E8 -> G = 0x03, B = 0xE8
        texture = compiler.compile("$ 1000")

        pixel = texture.getpixel((8, 8))
        assert pixel[1] == 3  # High byte

    def test_rgba_encoding_low_byte_in_blue(self, compiler):
        """Operand low byte is encoded in B channel."""
        # 1000 = 0x03E8 -> G = 0x03, B = 0xE8
        texture = compiler.compile("$ 1000")

        pixel = texture.getpixel((8, 8))
        assert pixel[2] == 232  # Low byte (0xE8)

    def test_rgba_encoding_alpha_greater_than_zero(self, compiler):
        """Alpha channel contains morphological intensity (>0 for valid glyph)."""
        texture = compiler.compile("$ 5")

        pixel = texture.getpixel((8, 8))
        assert pixel[3] > 0  # A channel has intensity from glyph rendering


class TestOperandEncoding16Bit:
    """Tests for 16-bit operand encoding."""

    def test_operand_encoding_1000(self, compiler):
        """1000 encodes correctly (G=3, B=232)."""
        # 1000 = 0x03E8
        # High byte: 1000 >> 8 = 3
        # Low byte: 1000 & 0xFF = 232
        texture = compiler.compile("$ 1000")

        pixel = texture.getpixel((8, 8))
        assert pixel[1] == 3  # G = high byte
        assert pixel[2] == 232  # B = low byte

    def test_operand_encoding_max_65535(self, compiler):
        """65535 (max 16-bit) encodes correctly."""
        # 65535 = 0xFFFF
        texture = compiler.compile("$ 65535")

        pixel = texture.getpixel((8, 8))
        assert pixel[1] == 255  # G = high byte
        assert pixel[2] == 255  # B = low byte

    def test_operand_encoding_zero(self, compiler):
        """Zero operand encodes correctly."""
        texture = compiler.compile("$ 0")

        pixel = texture.getpixel((8, 8))
        assert pixel[1] == 0  # G = high byte
        assert pixel[2] == 0  # B = low byte

    def test_operand_encoding_256(self, compiler):
        """256 encodes correctly (G=1, B=0)."""
        # 256 = 0x0100
        texture = compiler.compile("$ 256")

        pixel = texture.getpixel((8, 8))
        assert pixel[1] == 1  # G = high byte
        assert pixel[2] == 0  # B = low byte


class TestCompileAndVerify:
    """Tests for compile -> verify roundtrip."""

    def test_compile_and_verify_roundtrip(self, compiler):
        """Compile then verify_texture returns matching instructions."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create a test source file
            source_path = os.path.join(tmpdir, "test.geo")
            with open(source_path, 'w') as f:
                f.write("$ 5 $ 3 +")

            # Compile to texture
            result = compiler.compile_file(source_path)
            texture_path = result['texture_path']

            # Verify the texture
            decoded = compiler.verify_texture(texture_path)

            assert len(decoded) == 3

            # First instruction: $ 5
            assert decoded[0]['opcode'] == OP_I32_CONST
            assert decoded[0]['operand'] == 5
            assert decoded[0]['symbol'] == '$'

            # Second instruction: $ 3
            assert decoded[1]['opcode'] == OP_I32_CONST
            assert decoded[1]['operand'] == 3
            assert decoded[1]['symbol'] == '$'

            # Third instruction: +
            assert decoded[2]['opcode'] == OP_I32_ADD
            assert decoded[2]['operand'] == 0
            assert decoded[2]['symbol'] == '+'

    def test_compile_verify_large_operand(self, compiler):
        """Large operands survive roundtrip."""
        with tempfile.TemporaryDirectory() as tmpdir:
            source_path = os.path.join(tmpdir, "test.geo")
            with open(source_path, 'w') as f:
                f.write("$ 1000")

            result = compiler.compile_file(source_path)
            decoded = compiler.verify_texture(result['texture_path'])

            assert len(decoded) == 1
            assert decoded[0]['operand'] == 1000


class TestCompileFile:
    """Tests for file compilation with metadata."""

    def test_compile_file_creates_texture(self, compiler):
        """compile_file creates .rts.png texture."""
        with tempfile.TemporaryDirectory() as tmpdir:
            source_path = os.path.join(tmpdir, "test.geo")
            with open(source_path, 'w') as f:
                f.write("$ 5")

            result = compiler.compile_file(source_path)

            assert os.path.exists(result['texture_path'])
            assert result['texture_path'].endswith('.rts.png')

    def test_compile_file_creates_json_metadata(self, compiler):
        """compile_file creates .json metadata."""
        with tempfile.TemporaryDirectory() as tmpdir:
            source_path = os.path.join(tmpdir, "test.geo")
            with open(source_path, 'w') as f:
                f.write("$ 5")

            result = compiler.compile_file(source_path)

            assert os.path.exists(result['json_path'])
            assert result['json_path'].endswith('.json')

    def test_compile_file_metadata_content(self, compiler):
        """JSON metadata contains expected fields."""
        with tempfile.TemporaryDirectory() as tmpdir:
            source_path = os.path.join(tmpdir, "test.geo")
            with open(source_path, 'w') as f:
                f.write("$ 5 $ 3 +")

            result = compiler.compile_file(source_path)

            with open(result['json_path'], 'r') as f:
                metadata = json.load(f)

            assert 'metadata' in metadata
            assert 'instructions' in metadata
            assert metadata['metadata']['instruction_count'] == 3
            assert metadata['metadata']['texture_size'] == [48, 16]
            assert metadata['metadata']['glyph_size'] == 16

    def test_compile_file_instruction_data(self, compiler):
        """JSON contains instruction data."""
        with tempfile.TemporaryDirectory() as tmpdir:
            source_path = os.path.join(tmpdir, "test.geo")
            with open(source_path, 'w') as f:
                f.write("$ 5")

            result = compiler.compile_file(source_path)

            with open(result['json_path'], 'r') as f:
                data = json.load(f)

            assert len(data['instructions']) == 1
            assert data['instructions'][0]['opcode'] == OP_I32_CONST
            assert data['instructions'][0]['operand'] == 5
            assert data['instructions'][0]['symbol'] == '$'


class TestDecodePixel:
    """Tests for pixel decoding."""

    def test_decode_pixel_basic(self, compiler):
        """decode_pixel correctly extracts instruction from pixel."""
        pixel = (0x41, 0x00, 0x05, 128)
        decoded = compiler.decode_pixel(pixel)

        assert decoded['opcode'] == 0x41
        assert decoded['operand'] == 5
        assert decoded['intensity'] == 128

    def test_decode_pixel_16bit_operand(self, compiler):
        """decode_pixel correctly reconstructs 16-bit operand."""
        # 1000 = 0x03E8 -> G=0x03, B=0xE8
        pixel = (0x41, 0x03, 0xE8, 128)
        decoded = compiler.decode_pixel(pixel)

        assert decoded['operand'] == 1000
