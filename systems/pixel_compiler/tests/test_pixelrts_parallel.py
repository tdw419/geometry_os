"""
Tests for PixelRTS parallel batch processing.
"""

import pytest
import tempfile
from pathlib import Path


def test_parallel_batch_encode():
    """Test encoding multiple files in parallel."""
    from systems.pixel_compiler.pixelrts_parallel import ParallelPixelRTSEncoder

    # Create test files
    test_files = []
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Create 5 test files of varying sizes
        for i in range(5):
            test_file = tmpdir / f"test_{i}.bin"
            data = bytes([i % 256] * (1024 * 100 * (i + 1)))  # 100KB, 200KB, etc.
            test_file.write_bytes(data)
            test_files.append(test_file)

        # Encode in parallel
        encoder = ParallelPixelRTSEncoder(workers=2)
        results = encoder.encode_batch(
            input_files=test_files,
            output_dir=tmpdir,
            pattern="*.rts.png"
        )

        # Verify all files were encoded
        assert len(results) == 5
        for result in results:
            assert result['success']
            assert Path(result['output_path']).exists()

            # Verify output file is valid PNG
            from PIL import Image
            img = Image.open(result['output_path'])
            assert img.size[0] == img.size[1]  # Square image


def test_parallel_encode_with_progress():
    """Test that parallel encoding reports progress correctly."""
    from systems.pixel_compiler.pixelrts_parallel import ParallelPixelRTSEncoder

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Create test files
        test_files = []
        for i in range(3):
            test_file = tmpdir / f"test_{i}.bin"
            test_file.write_bytes(b'\x00' * (1024 * 100))
            test_files.append(test_file)

        # Track progress
        progress_updates = []

        def progress_callback(current, total, filename):
            progress_updates.append((current, total, filename))

        encoder = ParallelPixelRTSEncoder(workers=2)
        results = encoder.encode_batch(
            input_files=test_files,
            output_dir=tmpdir,
            progress_callback=progress_callback
        )

        # Verify progress was reported
        assert len(progress_updates) == 3
        assert progress_updates[-1][0] == 3  # All files processed


def test_parallel_encode_error_handling():
    """Test that parallel encoding handles errors gracefully."""
    from systems.pixel_compiler.pixelrts_parallel import ParallelPixelRTSEncoder

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Create valid and invalid test files
        # Use names that sort correctly (a_valid comes before b_invalid)
        valid_file = tmpdir / "a_valid.bin"
        valid_file.write_bytes(b'\x00' * 1024)

        invalid_file = tmpdir / "b_nonexistent.bin"  # Doesn't exist

        encoder = ParallelPixelRTSEncoder(workers=2)
        results = encoder.encode_batch(
            input_files=[valid_file, invalid_file],
            output_dir=tmpdir
        )

        # Verify one succeeded, one failed
        assert len(results) == 2
        assert results[0]['success']
        assert not results[1]['success']
        assert 'error' in results[1]


def test_encode_directory():
    """Test encoding all files in a directory."""
    from systems.pixel_compiler.pixelrts_parallel import ParallelPixelRTSEncoder

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        input_dir = tmpdir / "input"
        output_dir = tmpdir / "output"
        input_dir.mkdir()

        # Create test files
        for i in range(3):
            (input_dir / f"file_{i}.bin").write_bytes(bytes([i] * 1024))

        # Encode directory
        encoder = ParallelPixelRTSEncoder(workers=2)
        results = encoder.encode_directory(
            input_dir=input_dir,
            output_dir=output_dir,
            pattern="*.bin"
        )

        # Verify all files were encoded
        assert len(results) == 3
        assert all(r['success'] for r in results)
        assert output_dir.exists()
        assert len(list(output_dir.glob("*.rts.png"))) == 3


def test_parallel_decode_batch():
    """Test decoding multiple files in parallel."""
    from systems.pixel_compiler.pixelrts_parallel import ParallelPixelRTSEncoder, parallel_decode_batch

    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        input_dir = tmpdir / "input"
        output_dir = tmpdir / "encoded"
        decoded_dir = tmpdir / "decoded"
        input_dir.mkdir()
        output_dir.mkdir()

        # Create and encode test files
        test_files = []
        for i in range(3):
            test_file = input_dir / f"test_{i}.bin"
            data = bytes([i] * 1024)
            test_file.write_bytes(data)
            test_files.append(test_file)

        # Encode
        encoder = ParallelPixelRTSEncoder(workers=2)
        encode_results = encoder.encode_batch(
            input_files=test_files,
            output_dir=output_dir
        )

        # Decode in parallel
        encoded_files = [r['output_path'] for r in encode_results]
        decode_results = parallel_decode_batch(
            input_files=encoded_files,
            output_dir=decoded_dir,
            workers=2
        )

        # Verify all decoded successfully
        assert len(decode_results) == 3
        assert all(r['success'] for r in decode_results)

        # Verify decoded data matches original
        for i, result in enumerate(decode_results):
            decoded_data = Path(result['output_path']).read_bytes()
            original_data = test_files[i].read_bytes()
            assert decoded_data == original_data
