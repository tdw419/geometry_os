#!/usr/bin/env python3
"""
Tests for CLI verify command.

Tests the 'pixelrts verify' command which composes all verification steps.
"""

import json
import sys
import tempfile
import base64
from pathlib import Path
from unittest.mock import patch, MagicMock
from io import StringIO

import numpy as np
from PIL import Image
from PIL import PngImagePlugin
import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.pixelrts_cli import cmd_verify, main
from systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata


class TestCliVerify:
    """Tests for CLI verify command."""

    @pytest.fixture
    def valid_rts_png(self):
        """Create a valid .rts.png file for testing."""
        test_data = b"Test data for verification"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["segments"] = [
            {"name": "data", "offset": 0, "length": len(test_data), "hash": data_hash[:16]}
        ]

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        yield temp_path

        if temp_path.exists():
            temp_path.unlink()

    @pytest.fixture
    def invalid_png(self):
        """Create an invalid PNG file (not a valid PNG)."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            f.write(b"This is not a valid PNG file content")
            temp_path = Path(f.name)

        yield temp_path

        if temp_path.exists():
            temp_path.unlink()

    @pytest.fixture
    def non_existent_file(self):
        """Return a path to a non-existent file."""
        return Path("/tmp/non_existent_file_12345.rts.png")

    @pytest.fixture
    def ed25519_key_pair(self):
        """Generate an Ed25519 key pair for testing."""
        from cryptography.hazmat.primitives.asymmetric.ed25519 import Ed25519PrivateKey

        private_key = Ed25519PrivateKey.generate()
        public_key = private_key.public_key()

        return {
            "private_key": private_key,
            "public_key": public_key,
            "public_key_hex": public_key.public_bytes_raw().hex()
        }

    @pytest.fixture
    def signed_rts_png(self, ed25519_key_pair):
        """Create a signed .rts.png file for testing."""
        test_data = b"Test data for signed verification"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        signature = ed25519_key_pair["private_key"].sign(bytes.fromhex(data_hash))
        signature_hex = signature.hex()
        public_key_hex = ed25519_key_pair["public_key_hex"]

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        metadata["segments"] = [
            {"name": "data", "offset": 0, "length": len(test_data), "hash": data_hash[:16]}
        ]
        metadata["signature"] = {
            "value": signature_hex,
            "public_key": public_key_hex,
            "algorithm": "Ed25519"
        }

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        yield temp_path

        if temp_path.exists():
            temp_path.unlink()

    def make_args(self, input_path, json_output=False, verbose=False):
        """Create mock args object for cmd_verify."""
        class Args:
            pass
        args = Args()
        args.input = str(input_path)
        args.json = json_output
        args.verbose = verbose
        return args

    def test_verify_pass(self, valid_rts_png):
        """Test that a valid file returns exit code 0."""
        args = self.make_args(valid_rts_png)

        # Capture stdout
        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()

        assert exit_code == 0
        assert "PASS" in output

    def test_verify_fail_invalid_png(self, invalid_png):
        """Test that an invalid PNG returns exit code 1."""
        args = self.make_args(invalid_png)

        exit_code = cmd_verify(args)

        assert exit_code == 1

    def test_verify_fail_missing_file(self, non_existent_file):
        """Test that a non-existent file returns exit code 1."""
        args = self.make_args(non_existent_file)

        captured_stderr = StringIO()
        with patch('sys.stderr', captured_stderr):
            exit_code = cmd_verify(args)

        stderr = captured_stderr.getvalue()

        assert exit_code == 1
        assert "not found" in stderr

    def test_verify_json_output(self, valid_rts_png):
        """Test that --json flag produces valid JSON with expected structure."""
        args = self.make_args(valid_rts_png, json_output=True)

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()

        assert exit_code == 0

        # Parse JSON and verify structure
        result = json.loads(output)
        assert "overall_status" in result
        assert "file_path" in result
        assert "timestamp" in result
        assert "steps" in result
        assert "summary" in result

        # Verify summary structure
        assert "total" in result["summary"]
        assert "passed" in result["summary"]
        assert "failed" in result["summary"]

    def test_verify_verbose_output(self, valid_rts_png):
        """Test that --verbose flag includes step details."""
        args = self.make_args(valid_rts_png, verbose=True)

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()

        assert exit_code == 0

        # Verbose output should include step details
        assert "Step Details:" in output
        assert "structure" in output.lower()
        assert "consistency" in output.lower()

    def test_verify_unsigned_file(self, valid_rts_png):
        """Test that unsigned file passes (SKIP not FAIL)."""
        args = self.make_args(valid_rts_png)

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()

        # Unsigned files should pass (SKIP is not a failure)
        assert exit_code == 0
        assert "PASS" in output

    def test_verify_output_format(self, valid_rts_png):
        """Test that human-readable output has PASS/FAIL/WARN markers."""
        args = self.make_args(valid_rts_png)

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()

        assert exit_code == 0

        # Output should have clear status markers
        assert "[PASS]" in output or "PASS" in output
        assert "Verification:" in output

    def test_verify_all_steps_run(self, valid_rts_png):
        """Test that all four verifiers are executed."""
        args = self.make_args(valid_rts_png, json_output=True)

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()
        result = json.loads(output)

        # Should have 4 verification steps
        step_names = [s["step_name"] for s in result["steps"]]
        assert "structure" in step_names
        assert "consistency" in step_names
        assert "segment_integrity" in step_names  # SegmentIntegrityChecker
        assert "signature" in step_names

    def test_verify_signed_file_pass(self, signed_rts_png):
        """Test that a properly signed file passes all verifications."""
        args = self.make_args(signed_rts_png, json_output=True)

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()
        result = json.loads(output)

        assert exit_code == 0
        assert result["overall_status"] == "pass"

    def test_verify_signed_file_verbose(self, signed_rts_png):
        """Test that a signed file shows signature details in verbose mode."""
        args = self.make_args(signed_rts_png, verbose=True)

        captured_output = StringIO()
        with patch('sys.stdout', captured_output):
            exit_code = cmd_verify(args)

        output = captured_output.getvalue()

        assert exit_code == 0
        assert "signature" in output.lower()

    def test_verify_directory_fails(self):
        """Test that passing a directory instead of file returns exit code 1."""
        with tempfile.TemporaryDirectory() as tmpdir:
            args = self.make_args(tmpdir)

            captured_stderr = StringIO()
            with patch('sys.stderr', captured_stderr):
                exit_code = cmd_verify(args)

            assert exit_code == 1
            assert "not a file" in captured_stderr.getvalue()

    def test_verify_exception_handling(self):
        """Test that exceptions are handled gracefully."""
        # Create a mock args that will cause an exception in verification
        class BadArgs:
            input = "/nonexistent/path/to/file.rts.png"  # Non-existent file
            json = False
            verbose = False

        captured_stderr = StringIO()
        with patch('sys.stderr', captured_stderr):
            exit_code = cmd_verify(BadArgs())

        assert exit_code == 1


class TestCliVerifyIntegration:
    """Integration tests for verify command via main()."""

    def test_verify_command_via_main(self):
        """Test that verify command works via main() entry point."""
        # Create a valid file first
        test_data = b"Integration test data"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        try:
            # Test via main() with sys.argv
            with patch('sys.argv', ['pixelrts', 'verify', str(temp_path)]):
                captured_output = StringIO()
                with patch('sys.stdout', captured_output):
                    exit_code = main()

                output = captured_output.getvalue()
                assert exit_code == 0
                assert "PASS" in output
        finally:
            if temp_path.exists():
                temp_path.unlink()

    def test_verify_command_missing_file_via_main(self):
        """Test verify command with missing file via main()."""
        with patch('sys.argv', ['pixelrts', 'verify', '/nonexistent/file.rts.png']):
            captured_stderr = StringIO()
            with patch('sys.stderr', captured_stderr):
                exit_code = main()

            assert exit_code == 1

    def test_verify_command_json_via_main(self):
        """Test verify command with --json flag via main()."""
        # Create a valid file
        test_data = b"JSON test data"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        try:
            with patch('sys.argv', ['pixelrts', 'verify', '--json', str(temp_path)]):
                captured_output = StringIO()
                with patch('sys.stdout', captured_output):
                    exit_code = main()

                output = captured_output.getvalue()
                assert exit_code == 0

                # Verify valid JSON
                result = json.loads(output)
                assert "overall_status" in result
        finally:
            if temp_path.exists():
                temp_path.unlink()


class TestCliVerifyExitCodes:
    """Tests for exit code behavior."""

    @pytest.fixture
    def valid_rts_png(self):
        """Create a valid .rts.png file for testing."""
        test_data = b"Test data for exit code verification"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        yield temp_path

        if temp_path.exists():
            temp_path.unlink()

    def make_args(self, input_path, json_output=False, verbose=False):
        """Create mock args object for cmd_verify."""
        class Args:
            pass
        args = Args()
        args.input = str(input_path)
        args.json = json_output
        args.verbose = verbose
        return args

    def test_exit_code_0_on_pass(self, valid_rts_png):
        """Test exit code 0 for PASS status."""
        args = self.make_args(valid_rts_png)
        assert cmd_verify(args) == 0

    def test_exit_code_0_on_warning(self):
        """Test exit code 0 for WARNING status (CI-compatible)."""
        # Create a file that will cause WARNING (e.g., no segments)
        test_data = b"Test data"
        data_hash = PixelRTSMetadata.hash_data(test_data)
        data_b64 = base64.b64encode(test_data).decode('utf-8')

        size = 256
        img_data = np.zeros((size, size, 4), dtype=np.uint8)
        img = Image.fromarray(img_data, 'RGBA')

        metadata = PixelRTSMetadata.create_metadata(grid_size=256)
        metadata["original_data_b64"] = data_b64
        metadata["hashes"]["data"] = data_hash
        # No segments - this should cause SKIP for segment integrity

        encoded = PixelRTSMetadata.encode_png_text(metadata)

        png_info = PngImagePlugin.PngInfo()
        png_info.add_text('PixelRTS', encoded.decode('utf-8'))

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            img.save(f, format='PNG', pnginfo=png_info)
            temp_path = Path(f.name)

        try:
            args = self.make_args(temp_path)
            # Should return 0 because SKIP is not FAIL
            assert cmd_verify(args) == 0
        finally:
            if temp_path.exists():
                temp_path.unlink()

    def test_exit_code_1_on_fail(self):
        """Test exit code 1 for FAIL status."""
        with tempfile.NamedTemporaryFile(suffix='.png', delete=False) as f:
            f.write(b"Not a valid PNG")
            temp_path = Path(f.name)

        try:
            args = self.make_args(temp_path)
            assert cmd_verify(args) == 1
        finally:
            if temp_path.exists():
                temp_path.unlink()

    def test_exit_code_1_on_exception(self):
        """Test exit code 1 on exception."""
        class BadArgs:
            input = "/nonexistent/path/to/file.rts.png"
            json = False
            verbose = False

        assert cmd_verify(BadArgs()) == 1
