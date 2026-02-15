# systems/pixel_compiler/tests/test_cartridge_assembly.py
"""Tests for CartridgeAssembly module."""

import pytest
import tempfile
import json
from pathlib import Path


class TestCartridgeAssembly:
    """Test cartridge assembly from source files."""

    def test_assemble_from_files_returns_bytes(self):
        """Assembly from file list should return PNG bytes."""
        from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler

        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test source file
            source_file = Path(tmpdir) / "test.py"
            source_file.write_text("print('hello')")

            assembler = CartridgeAssembler()
            result = assembler.assemble_from_files([source_file], name="test_cart")

            assert isinstance(result, bytes)
            assert len(result) > 8  # PNG header minimum
            assert result[:8] == b'\x89PNG\r\n\x1a\n'  # PNG magic bytes

    def test_assemble_includes_metadata(self):
        """Assembled cartridge should include metadata chunk."""
        from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler

        with tempfile.TemporaryDirectory() as tmpdir:
            source_file = Path(tmpdir) / "code.py"
            source_file.write_text("x = 1")

            assembler = CartridgeAssembler()
            result = assembler.assemble_from_files(
                [source_file],
                name="meta_test",
                description="Test cartridge",
                entry_point="code.py:main"
            )

            # Should be valid PNG with metadata
            assert result[:8] == b'\x89PNG\r\n\x1a\n'

            # Check that metadata is extractable
            metadata = assembler.extract_metadata(result)
            assert metadata["name"] == "meta_test"
            assert metadata["description"] == "Test cartridge"
            assert metadata["entry_point"] == "code.py:main"

    def test_assemble_from_directory(self):
        """Assembly from directory should include all files."""
        from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler

        with tempfile.TemporaryDirectory() as tmpdir:
            tmpdir = Path(tmpdir)
            (tmpdir / "main.py").write_text("print('main')")
            (tmpdir / "lib.py").write_text("def helper(): pass")

            assembler = CartridgeAssembler()
            result = assembler.assemble_from_directory(tmpdir, name="dir_test")

            assert isinstance(result, bytes)
            assert result[:8] == b'\x89PNG\r\n\x1a\n'

            metadata = assembler.extract_metadata(result)
            assert metadata["file_count"] == 2
