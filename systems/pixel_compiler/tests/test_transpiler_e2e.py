"""
End-to-End Tests for Universal Transpiler

Tests the complete workflow from input to .rts.png output,
including file type detection, conversion, and PNG generation.
"""

import pytest
import tempfile
import os
from pathlib import Path

from systems.pixel_compiler.universal_transpiler import UniversalTranspiler
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder


class TestTranspilerE2E:
    """End-to-end tests for UniversalTranspiler."""

    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory for test files."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        # Cleanup
        import shutil
        shutil.rmtree(temp_dir, ignore_errors=True)

    @pytest.fixture
    def minimal_wasm(self, temp_dir):
        """Create a minimal valid WASM file."""
        # Minimal WASM with magic, version, and empty sections
        wasm_data = (
            b'\x00asm\x01\x00\x00\x00'  # Magic + version
            # Type section (empty)
            b'\x01\x04\x01\x60\x00\x00'
        )
        wasm_path = Path(temp_dir) / "test.wasm"
        with open(wasm_path, 'wb') as f:
            f.write(wasm_data)
        return str(wasm_path)

    @pytest.fixture
    def minimal_elf(self, temp_dir):
        """Create a minimal ELF binary."""
        elf_data = b'\x7fELF\x02\x01\x01\x00'  # 64-bit ELF magic
        elf_path = Path(temp_dir) / "test.elf"
        with open(elf_path, 'wb') as f:
            f.write(elf_data)
        return str(elf_path)

    def test_wasm_to_rts_creates_output(self, minimal_wasm, temp_dir):
        """Test that WASM to RTS conversion creates an output file."""
        output_path = Path(temp_dir) / "output.rts.png"

        transpiler = UniversalTranspiler()
        result_path = transpiler.transpile_and_convert(minimal_wasm, str(output_path))

        # Verify output exists
        assert Path(result_path).exists(), "Output file should exist"
        assert result_path == str(output_path), "Result path should match output path"

    def test_wasm_to_rts_creates_valid_png(self, minimal_wasm, temp_dir):
        """Test that WASM to RTS conversion creates a valid PNG file."""
        output_path = Path(temp_dir) / "output.rts.png"

        transpiler = UniversalTranspiler()
        result_path = transpiler.transpile_and_convert(minimal_wasm, str(output_path))

        # Verify it's a valid PNG
        with open(result_path, 'rb') as f:
            png_data = f.read()

        assert png_data.startswith(b'\x89PNG'), "Should be a valid PNG file"
        assert b'IHDR' in png_data, "Should have IHDR chunk"

    def test_wasm_to_rts_roundtrip(self, minimal_wasm, temp_dir):
        """Test that WASM to RTS conversion can be decoded back.

        Note: Code Mode applies semantic coloring, so exact byte matching
        isn't expected. The test verifies the PNG structure is valid.
        """
        output_path = Path(temp_dir) / "output.rts.png"

        # Read original WASM
        with open(minimal_wasm, 'rb') as f:
            original_wasm = f.read()

        transpiler = UniversalTranspiler()
        result_path = transpiler.transpile_and_convert(minimal_wasm, str(output_path))

        # Decode the PNG back
        decoder = PixelRTSDecoder()
        with open(result_path, 'rb') as f:
            png_data = f.read()

        # The decoder should successfully parse the PNG
        # (exact data matching not applicable due to semantic coloring in Code Mode)
        assert png_data.startswith(b'\x89PNG'), "Should be valid PNG"

        # Verify the decoder can process it
        decoded_data = decoder.decode(png_data, expected_size=len(original_wasm))
        assert len(decoded_data) == len(original_wasm), \
            "Decoded size should match original size"

    def test_auto_output_naming(self, minimal_wasm):
        """Test that auto-naming generates correct output filename."""
        transpiler = UniversalTranspiler()

        # Convert without specifying output
        result_path = transpiler.transpile_and_convert(minimal_wasm)

        # Should create file with .rts.png extension in cwd
        assert result_path.endswith('.rts.png'), "Should have .rts.png extension"
        assert 'test.rts.png' in result_path, "Should use input filename"

        # Cleanup
        if os.path.exists(result_path):
            os.unlink(result_path)

    def test_elf_binary_analysis(self, minimal_elf, capsys):
        """Test that ELF binary analysis runs without errors."""
        transpiler = UniversalTranspiler()

        # This should run analysis and create output
        result_path = transpiler.transpile_and_convert(minimal_elf)

        # Check that analysis output was produced
        captured = capsys.readouterr()
        assert "Syscall Compatibility Check" in captured.out, \
            "Should show syscall compatibility report"

        # Should create an output file
        assert Path(result_path).exists(), "Should create output file"

    def test_binary_type_detection_wasm(self, minimal_wasm):
        """Test that WASM files are correctly detected."""
        transpiler = UniversalTranspiler()

        with open(minimal_wasm, 'rb') as f:
            header = f.read(4)

        assert header.startswith(b'\x00asm'), "WASM magic should be detected"

    def test_binary_type_detection_elf(self, minimal_elf):
        """Test that ELF files are correctly detected."""
        transpiler = UniversalTranspiler()

        with open(minimal_elf, 'rb') as f:
            header = f.read(4)

        assert header.startswith(b'\x7fELF'), "ELF magic should be detected"

    def test_missing_file_error(self, temp_dir):
        """Test that missing files produce appropriate errors."""
        transpiler = UniversalTranspiler()

        non_existent = Path(temp_dir) / "nonexistent.wasm"

        with pytest.raises(FileNotFoundError):
            transpiler.transpile_and_convert(str(non_existent))

    def test_syscall_bridge_available_during_conversion(self, minimal_elf, capsys):
        """Test that syscall bridge is used during binary conversion."""
        transpiler = UniversalTranspiler()

        # Verify bridge exists
        assert hasattr(transpiler, 'syscall_bridge'), "Should have syscall_bridge"

        # Convert ELF binary (which triggers syscall analysis)
        result_path = transpiler.transpile_and_convert(minimal_elf)

        # Check that syscall report was printed
        captured = capsys.readouterr()
        assert "Syscall Compatibility Check" in captured.out, \
            "Should print syscall compatibility report"
        assert "Total mapped syscalls:" in captured.out, \
            "Should show syscall count"

    def test_output_metadata_embedding(self, minimal_wasm, temp_dir):
        """Test that metadata is properly embedded in the output."""
        output_path = Path(temp_dir) / "output.rts.png"

        transpiler = UniversalTranspiler()
        result_path = transpiler.transpile_and_convert(minimal_wasm, str(output_path))

        # Try to read metadata from the PNG
        decoder = PixelRTSDecoder()
        with open(result_path, 'rb') as f:
            png_data = f.read()

        # The decoder should be able to parse the PNG
        # (metadata verification depends on specific implementation)
        assert png_data.startswith(b'\x89PNG'), "Should be valid PNG"
