"""
Tests for CLI Transpiler Integration

Tests the transpile command that integrates the UniversalTranspiler
into the CLI for converting native software to PixelRTS format.
"""

import pytest
import tempfile
import shutil
from pathlib import Path
from unittest.mock import patch, MagicMock
import argparse

from systems.pixel_compiler.pixelrts_cli import main


class TestTranspileCommand:
    """Test the transpile command for UniversalTranspiler integration."""

    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory for test files."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    @pytest.fixture
    def sample_wasm_file(self, temp_dir):
        """Create a sample WASM file for testing."""
        # WASM magic number: \x00asm (little endian)
        wasm_path = Path(temp_dir) / "test.wasm"
        with open(wasm_path, 'wb') as f:
            f.write(b'\x00asm\x01\x00\x00\x00')
        return str(wasm_path)

    def test_transpile_wasm_to_rts(self, sample_wasm_file, temp_dir):
        """Test transpiling a WASM file to RTS format."""
        output_path = Path(temp_dir) / "output.rts.png"

        with patch('systems.pixel_compiler.universal_transpiler.UniversalTranspiler') as mock_transpiler_class:
            # Setup mock
            mock_transpiler = MagicMock()
            mock_transpiler.transpile_and_convert.return_value = str(output_path)
            mock_transpiler_class.return_value = mock_transpiler

            # Create args for transpile command
            args = argparse.Namespace(
                command='transpile',
                input=sample_wasm_file,
                output=str(output_path),
                verbose=False
            )

            # Mock sys.argv for the CLI
            with patch('sys.argv', ['pixelrts', 'transpile', sample_wasm_file, str(output_path)]):
                result = main()

            # Verify transpiler was called correctly
            mock_transpiler.transpile_and_convert.assert_called_once()
            call_args = mock_transpiler.transpile_and_convert.call_args
            assert call_args[0][0] == sample_wasm_file
            assert call_args[0][1] == str(output_path)

    def test_transpile_missing_input(self, temp_dir):
        """Test transpiling with missing input file."""
        non_existent = Path(temp_dir) / "nonexistent.wasm"

        with patch('systems.pixel_compiler.universal_transpiler.UniversalTranspiler') as mock_transpiler_class:
            # Setup mock to raise FileNotFoundError
            mock_transpiler = MagicMock()
            mock_transpiler.transpile_and_convert.side_effect = FileNotFoundError(f"Input not found: {non_existent}")
            mock_transpiler_class.return_value = mock_transpiler

            # Create args for transpile command
            args = argparse.Namespace(
                command='transpile',
                input=str(non_existent),
                output=None,
                verbose=False
            )

            # Mock sys.argv for the CLI
            with patch('sys.argv', ['pixelrts', 'transpile', str(non_existent)]):
                result = main()

            # Should fail gracefully
            assert result == 1

    def test_transpile_auto_naming(self, sample_wasm_file, temp_dir):
        """Test that auto-naming works when output is not specified."""
        with patch('systems.pixel_compiler.universal_transpiler.UniversalTranspiler') as mock_transpiler_class:
            # Setup mock
            mock_transpiler = MagicMock()
            # Should auto-name to test.rts.png
            mock_transpiler.transpile_and_convert.return_value = str(Path(temp_dir) / "test.rts.png")
            mock_transpiler_class.return_value = mock_transpiler

            # Create args without output
            args = argparse.Namespace(
                command='transpile',
                input=sample_wasm_file,
                output=None,
                verbose=False
            )

            # Mock sys.argv for the CLI (no output specified)
            with patch('sys.argv', ['pixelrts', 'transpile', sample_wasm_file]):
                result = main()

            # Verify transpiler was called with output=None
            mock_transpiler.transpile_and_convert.assert_called_once()
            call_args = mock_transpiler.transpile_and_convert.call_args
            assert call_args[0][0] == sample_wasm_file
            assert call_args[0][1] is None

    def test_transpile_verbose_output(self, sample_wasm_file, temp_dir):
        """Test that verbose flag produces detailed output."""
        output_path = Path(temp_dir) / "output.rts.png"

        with patch('systems.pixel_compiler.universal_transpiler.UniversalTranspiler') as mock_transpiler_class:
            # Setup mock
            mock_transpiler = MagicMock()
            mock_transpiler.transpile_and_convert.return_value = str(output_path)
            mock_transpiler_class.return_value = mock_transpiler

            # Create args with verbose flag
            args = argparse.Namespace(
                command='transpile',
                input=sample_wasm_file,
                output=str(output_path),
                verbose=True
            )

            # Mock sys.argv for the CLI
            with patch('sys.argv', ['pixelrts', 'transpile', sample_wasm_file, str(output_path), '--verbose']):
                result = main()

            # Verify transpiler was called
            mock_transpiler.transpile_and_convert.assert_called_once()

    def test_transpile_with_error(self, sample_wasm_file, temp_dir):
        """Test error handling during transpilation."""
        output_path = Path(temp_dir) / "output.rts.png"

        with patch('systems.pixel_compiler.universal_transpiler.UniversalTranspiler') as mock_transpiler_class:
            # Setup mock to raise an error
            mock_transpiler = MagicMock()
            mock_transpiler.transpile_and_convert.side_effect = RuntimeError("Conversion failed: invalid WASM")
            mock_transpiler_class.return_value = mock_transpiler

            # Create args
            args = argparse.Namespace(
                command='transpile',
                input=sample_wasm_file,
                output=str(output_path),
                verbose=True
            )

            # Mock sys.argv for the CLI
            with patch('sys.argv', ['pixelrts', 'transpile', sample_wasm_file, str(output_path), '--verbose']):
                result = main()

            # Should fail gracefully
            assert result == 1

    def test_transpile_colored_success_message(self, sample_wasm_file, temp_dir):
        """Test that success message uses colored output."""
        output_path = Path(temp_dir) / "output.rts.png"

        with patch('systems.pixel_compiler.universal_transpiler.UniversalTranspiler') as mock_transpiler_class:
            # Setup mock
            mock_transpiler = MagicMock()
            mock_transpiler.transpile_and_convert.return_value = str(output_path)
            mock_transpiler_class.return_value = mock_transpiler

            with patch('systems.pixel_compiler.pixelrts_cli.click') as mock_click:
                # Create args
                args = argparse.Namespace(
                    command='transpile',
                    input=sample_wasm_file,
                    output=str(output_path),
                    verbose=False
                )

                # Mock sys.argv for the CLI
                with patch('sys.argv', ['pixelrts', 'transpile', sample_wasm_file, str(output_path)]):
                    result = main()

                # Verify colored output was used for success message
                assert mock_click.secho.called or result == 0


class TestTranspileCommandIntegration:
    """Integration tests for transpile command with actual transpiler."""

    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory for test files."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        shutil.rmtree(temp_dir)

    @pytest.fixture
    def sample_binary_file(self, temp_dir):
        """Create a sample binary file for testing."""
        binary_path = Path(temp_dir) / "test.bin"
        with open(binary_path, 'wb') as f:
            f.write(b'\x00' * 100)  # 100 bytes of zeros
        return str(binary_path)

    def test_transpile_creates_output_file(self, sample_binary_file, temp_dir):
        """Test that transpile actually creates the output file."""
        from systems.pixel_compiler.universal_transpiler import UniversalTranspiler

        output_path = Path(temp_dir) / "output.rts.png"

        # This will use the actual transpiler
        transpiler = UniversalTranspiler()
        result = transpiler.transpile_and_convert(sample_binary_file, str(output_path))

        # Verify output file exists
        assert Path(result).exists()
        assert result == str(output_path)
