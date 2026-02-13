"""
Test suite for streaming I/O implementation for Infinite Map filesystem.

TDD: These tests are written FIRST before implementation.
"""

import pytest
import threading
import time
import tempfile
from pathlib import Path
from unittest.mock import MagicMock, patch
from dataclasses import dataclass
from typing import Optional, Dict, Any

from systems.pixel_compiler.infinite_map_streaming import (
    StreamingReader, StreamingWriter, StreamingCopier,
    StreamingConfig, StreamState, StreamProgress
)


class MockFuseInstance:
    """Mock FUSE instance for testing streaming operations."""

    def __init__(self, files: Optional[Dict[str, bytes]] = None):
        self.files = files or {}
        self.written_files: Dict[str, bytes] = {}
        self._lock = threading.Lock()

    def getattr(self, path: str) -> Dict[str, Any]:
        """Get file attributes."""
        clean_path = path.lstrip('/')
        # Check both with and without leading slash
        if clean_path not in self.files and path not in self.files:
            raise FileNotFoundError(f"No such file: {path}")
        data = self.files.get(clean_path) or self.files.get(path, b"")
        return {
            'st_size': len(data),
            'st_mode': 0o644,
            'st_mtime': time.time()
        }

    def read(self, path: str, size: int, offset: int) -> bytes:
        """Read data from a file."""
        clean_path = path.lstrip('/')
        with self._lock:
            # Check both with and without leading slash
            if clean_path not in self.files and path not in self.files:
                raise FileNotFoundError(f"No such file: {path}")
            data = self.files.get(clean_path) or self.files.get(path, b"")
            return data[offset:offset + size]

    def write(self, path: str, data: bytes, offset: int) -> int:
        """Write data to a file."""
        clean_path = path.lstrip('/')
        with self._lock:
            if clean_path not in self.written_files:
                self.written_files[clean_path] = bytearray()

            file_data = self.written_files[clean_path]
            # Extend file if necessary
            while len(file_data) < offset + len(data):
                file_data.append(0)

            file_data[offset:offset + len(data)] = data
            self.written_files[clean_path] = file_data
            return len(data)

    def create(self, path: str, mode: int) -> int:
        """Create a new file."""
        clean_path = path.lstrip('/')
        with self._lock:
            self.written_files[clean_path] = bytearray()
            return 0

    def flush(self, path: str) -> int:
        """Flush file to storage."""
        # Copy written file to readable files for roundtrip tests
        clean_path = path.lstrip('/')
        if clean_path in self.written_files:
            self.files[clean_path] = bytes(self.written_files[clean_path])
        return 0


class TestStreamingConfig:
    """Test StreamingConfig configuration."""

    def test_default_config(self):
        """Test default configuration values."""
        config = StreamingConfig()
        assert config.chunk_size == 64 * 1024  # 64KB
        assert config.read_ahead_chunks == 2
        assert config.write_behind_chunks == 2
        assert config.max_buffer_size == 10 * 1024 * 1024  # 10MB

    def test_custom_config(self):
        """Test custom configuration values."""
        config = StreamingConfig(
            chunk_size=128 * 1024,
            read_ahead_chunks=4,
            write_behind_chunks=3,
            max_buffer_size=20 * 1024 * 1024
        )
        assert config.chunk_size == 128 * 1024
        assert config.read_ahead_chunks == 4
        assert config.write_behind_chunks == 3
        assert config.max_buffer_size == 20 * 1024 * 1024


class TestStreamProgress:
    """Test StreamProgress dataclass."""

    def test_progress_properties(self):
        """Test progress calculation."""
        progress = StreamProgress(
            bytes_transferred=500,
            total_bytes=1000,
            chunks_processed=5,
            state=StreamState.READING
        )
        assert progress.percent_complete == 50.0

    def test_progress_zero_total(self):
        """Test progress with zero total bytes."""
        progress = StreamProgress(
            bytes_transferred=0,
            total_bytes=0,
            chunks_processed=0,
            state=StreamState.IDLE
        )
        assert progress.percent_complete == 100.0


class TestStreamingReader:
    """Test streaming reader."""

    @pytest.fixture
    def fuse_with_file(self):
        """Create FUSE instance with a test file."""
        # Create a 200KB file
        test_data = b"ABCDEFGHIJ" * 20 * 1024  # 200KB
        fuse = MockFuseInstance(files={"/large_file.bin": test_data})
        return fuse, test_data

    @pytest.fixture
    def fuse_with_large_file(self):
        """Create FUSE instance with a very large file (>10MB)."""
        # Create a 15MB file
        test_data = b"X" * (15 * 1024 * 1024)
        fuse = MockFuseInstance(files={"/huge_file.bin": test_data})
        return fuse, test_data

    def test_get_file_size(self, fuse_with_file):
        """Test getting file size."""
        fuse, test_data = fuse_with_file
        reader = StreamingReader(fuse, "/large_file.bin")
        assert reader.get_file_size() == len(test_data)

    def test_read_chunks_iterates_correctly(self, fuse_with_file):
        """Test that chunks() yields correct data."""
        fuse, test_data = fuse_with_file
        config = StreamingConfig(chunk_size=1024)  # 1KB chunks
        reader = StreamingReader(fuse, "/large_file.bin", config)

        chunks = list(reader.chunks())
        assert len(chunks) > 0

        # Verify data is correct when concatenated
        reconstructed = b"".join(chunks)
        assert reconstructed == test_data

    def test_read_chunks_with_offset(self, fuse_with_file):
        """Test reading chunks starting from an offset."""
        fuse, test_data = fuse_with_file
        config = StreamingConfig(chunk_size=1024)
        reader = StreamingReader(fuse, "/large_file.bin", config)

        offset = 5000
        chunks = list(reader.chunks(offset=offset))
        reconstructed = b"".join(chunks)

        assert reconstructed == test_data[offset:]

    def test_memory_usage_bounded(self, fuse_with_file):
        """Test that memory usage stays within bounds."""
        fuse, test_data = fuse_with_file
        # Use small max buffer size
        config = StreamingConfig(
            chunk_size=1024,
            max_buffer_size=4096  # 4KB max buffer
        )
        reader = StreamingReader(fuse, "/large_file.bin", config)

        # Read all chunks - memory should be bounded
        max_chunk_size = 0
        for chunk in reader.chunks():
            max_chunk_size = max(max_chunk_size, len(chunk))

        # Each chunk should be at most chunk_size
        assert max_chunk_size <= config.chunk_size

    def test_progress_tracking(self, fuse_with_file):
        """Test that progress is tracked correctly."""
        fuse, test_data = fuse_with_file
        config = StreamingConfig(chunk_size=1024)
        reader = StreamingReader(fuse, "/large_file.bin", config)

        progress_updates = []

        def progress_callback(progress):
            progress_updates.append(progress)

        # Read all data with progress tracking
        reader.read_all(progress_callback=progress_callback)

        assert len(progress_updates) > 0

        # Last progress should show completion
        final_progress = progress_updates[-1]
        assert final_progress.state == StreamState.COMPLETED
        assert final_progress.bytes_transferred == len(test_data)

    def test_read_all_returns_complete_data(self, fuse_with_file):
        """Test read_all returns complete file data."""
        fuse, test_data = fuse_with_file
        reader = StreamingReader(fuse, "/large_file.bin")

        data = reader.read_all()
        assert data == test_data

    def test_read_range(self, fuse_with_file):
        """Test reading a specific range of the file."""
        fuse, test_data = fuse_with_file
        reader = StreamingReader(fuse, "/large_file.bin")

        start, end = 100, 500
        data = reader.read_range(start, end)
        assert data == test_data[start:end]

    def test_cancellation(self, fuse_with_large_file):
        """Test that cancellation works."""
        fuse, test_data = fuse_with_large_file
        config = StreamingConfig(chunk_size=1024)
        reader = StreamingReader(fuse, "/huge_file.bin", config)

        chunks_read = []
        for chunk in reader.chunks():
            chunks_read.append(chunk)
            if len(chunks_read) >= 5:  # Read 5 chunks then cancel
                reader.cancel()

        # Should have stopped after cancellation
        total_read = sum(len(c) for c in chunks_read)
        assert total_read < len(test_data)  # Didn't read entire file

    def test_get_progress(self, fuse_with_file):
        """Test getting current progress."""
        fuse, test_data = fuse_with_file
        reader = StreamingReader(fuse, "/large_file.bin")

        # Initial progress
        progress = reader.get_progress()
        assert progress.state == StreamState.IDLE
        assert progress.bytes_transferred == 0

    def test_nonexistent_file_raises_error(self):
        """Test reading nonexistent file raises error."""
        fuse = MockFuseInstance(files={})
        reader = StreamingReader(fuse, "/nonexistent.bin")

        with pytest.raises(FileNotFoundError):
            list(reader.chunks())


class TestStreamingWriter:
    """Test streaming writer."""

    @pytest.fixture
    def fuse_instance(self):
        """Create FUSE instance for writing."""
        return MockFuseInstance(files={})

    def test_write_chunks_correctly(self, fuse_instance):
        """Test that write() correctly buffers and writes."""
        config = StreamingConfig(chunk_size=1024)
        writer = StreamingWriter(fuse_instance, "/output.bin", config)

        # Write data in chunks
        data1 = b"A" * 500
        data2 = b"B" * 600  # Total 1100, should trigger flush at 1024

        written1 = writer.write(data1)
        written2 = writer.write(data2)

        assert written1 == len(data1)
        assert written2 == len(data2)

    def test_finalize_flushes_buffer(self, fuse_instance):
        """Test that finalize() flushes remaining data."""
        config = StreamingConfig(chunk_size=1024)
        writer = StreamingWriter(fuse_instance, "/output.bin", config)

        # Write less than chunk size
        data = b"X" * 500
        writer.write(data)

        # Finalize should flush remaining
        total = writer.finalize()
        assert total == len(data)

        # Verify data was written (strip leading slash for lookup)
        assert "output.bin" in fuse_instance.written_files

    def test_large_file_streaming(self, fuse_instance):
        """Test writing a large file (>10MB) with bounded memory."""
        config = StreamingConfig(
            chunk_size=64 * 1024,  # 64KB chunks
            max_buffer_size=256 * 1024  # 256KB max buffer
        )
        writer = StreamingWriter(fuse_instance, "/large_output.bin", config)

        # Write 12MB in chunks
        total_size = 12 * 1024 * 1024
        chunk_size = 64 * 1024

        written = 0
        while written < total_size:
            data = bytes([written % 256] * min(chunk_size, total_size - written))
            written += writer.write(data)

        total = writer.finalize()
        assert total == total_size

    def test_progress_tracking(self, fuse_instance):
        """Test that progress is tracked during writes."""
        config = StreamingConfig(chunk_size=1024)
        writer = StreamingWriter(fuse_instance, "/output.bin", config)

        progress_updates = []

        def progress_callback(progress):
            progress_updates.append(progress)

        # Write data with progress tracking
        data = b"Y" * 5000
        writer.write_all(data, progress_callback=progress_callback)

        assert len(progress_updates) > 0
        final_progress = progress_updates[-1]
        assert final_progress.state == StreamState.COMPLETED
        assert final_progress.bytes_transferred == len(data)

    def test_write_all(self, fuse_instance):
        """Test write_all writes complete data."""
        config = StreamingConfig(chunk_size=1024)
        writer = StreamingWriter(fuse_instance, "/output.bin", config)

        data = b"Z" * 5000
        written = writer.write_all(data)

        assert written == len(data)

    def test_cancellation(self, fuse_instance):
        """Test that cancellation works during writes."""
        config = StreamingConfig(chunk_size=1024)
        writer = StreamingWriter(fuse_instance, "/output.bin", config)

        # Write some data then cancel
        data = b"W" * 2000
        writer.write(data)
        writer.cancel()

        # Get progress should show cancelled
        progress = writer.get_progress()
        assert progress.state == StreamState.CANCELLED

    def test_get_progress(self, fuse_instance):
        """Test getting current progress."""
        writer = StreamingWriter(fuse_instance, "/output.bin")

        # Initial progress
        progress = writer.get_progress()
        assert progress.state == StreamState.IDLE
        assert progress.bytes_transferred == 0

    def test_multiple_finalize_calls_safe(self, fuse_instance):
        """Test that calling finalize multiple times is safe."""
        config = StreamingConfig(chunk_size=1024)
        writer = StreamingWriter(fuse_instance, "/output.bin", config)

        data = b"M" * 500
        writer.write(data)

        total1 = writer.finalize()
        total2 = writer.finalize()  # Should be safe

        assert total1 == len(data)
        assert total2 == total1  # Same result


class TestStreamingCopier:
    """Test streaming copy between files."""

    @pytest.fixture
    def fuse_with_files(self):
        """Create FUSE instance with source files."""
        source_data = b"S" * (5 * 1024 * 1024)  # 5MB source
        fuse = MockFuseInstance(files={"/source.bin": source_data})
        return fuse, source_data

    def test_copy_streams_data(self, fuse_with_files):
        """Test that copy streams data correctly."""
        fuse, source_data = fuse_with_files
        config = StreamingConfig(chunk_size=64 * 1024)
        copier = StreamingCopier(fuse, config)

        bytes_copied = copier.copy("/source.bin", "/dest.bin")
        assert bytes_copied == len(source_data)

        # Verify destination content (strip leading slash for lookup)
        assert "dest.bin" in fuse.written_files
        dest_data = bytes(fuse.written_files["dest.bin"])
        assert dest_data == source_data

    def test_copy_with_progress(self, fuse_with_files):
        """Test copy with progress callback."""
        fuse, source_data = fuse_with_files
        config = StreamingConfig(chunk_size=64 * 1024)
        copier = StreamingCopier(fuse, config)

        progress_updates = []

        def progress_callback(progress):
            progress_updates.append(progress)

        copier.copy("/source.bin", "/dest.bin", progress_callback=progress_callback)

        assert len(progress_updates) > 0
        final_progress = progress_updates[-1]
        assert final_progress.state == StreamState.COMPLETED
        assert final_progress.bytes_transferred == len(source_data)

    def test_copy_nonexistent_source_raises_error(self):
        """Test copying nonexistent source raises error."""
        fuse = MockFuseInstance(files={})
        copier = StreamingCopier(fuse)

        with pytest.raises(FileNotFoundError):
            copier.copy("/nonexistent.bin", "/dest.bin")


class TestStreamingIntegration:
    """Integration tests for streaming I/O."""

    @pytest.fixture
    def fuse_instance(self):
        """Create FUSE instance for integration tests."""
        # Create some files of various sizes
        files = {
            "/small.txt": b"Hello, World!",
            "/medium.bin": b"M" * (100 * 1024),  # 100KB
            "/large.bin": b"L" * (1024 * 1024),  # 1MB
        }
        return MockFuseInstance(files=files)

    def test_read_write_roundtrip(self, fuse_instance):
        """Test that reading and writing produce identical data."""
        config = StreamingConfig(chunk_size=4096)

        # Read from source
        reader = StreamingReader(fuse_instance, "/large.bin", config)
        source_data = reader.read_all()

        # Write to destination
        writer = StreamingWriter(fuse_instance, "/copy.bin", config)
        writer.write_all(source_data)
        writer.finalize()

        # Read back and compare
        reader2 = StreamingReader(fuse_instance, "/copy.bin", config)
        dest_data = reader2.read_all()

        assert source_data == dest_data

    def test_copy_preserves_data_integrity(self, fuse_instance):
        """Test that streaming copy preserves data integrity."""
        config = StreamingConfig(chunk_size=8192)
        copier = StreamingCopier(fuse_instance, config)

        # Copy file
        copier.copy("/medium.bin", "/medium_copy.bin")

        # Verify
        reader = StreamingReader(fuse_instance, "/medium_copy.bin", config)
        copied_data = reader.read_all()

        assert copied_data == fuse_instance.files["/medium.bin"]

    def test_concurrent_reads(self, fuse_instance):
        """Test concurrent reads are thread-safe."""
        config = StreamingConfig(chunk_size=4096)
        results = {}
        errors = []

        def read_file(path):
            try:
                reader = StreamingReader(fuse_instance, path, config)
                data = reader.read_all()
                results[path] = len(data)
            except Exception as e:
                errors.append((path, e))

        threads = [
            threading.Thread(target=read_file, args=("/small.txt",)),
            threading.Thread(target=read_file, args=("/medium.bin",)),
            threading.Thread(target=read_file, args=("/large.bin",)),
        ]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0, f"Errors: {errors}"
        assert results["/small.txt"] == 13
        assert results["/medium.bin"] == 100 * 1024
        assert results["/large.bin"] == 1024 * 1024

    def test_concurrent_writes(self, fuse_instance):
        """Test concurrent writes are thread-safe."""
        config = StreamingConfig(chunk_size=4096)
        errors = []

        def write_file(path, data):
            try:
                writer = StreamingWriter(fuse_instance, path, config)
                writer.write_all(data)
                writer.finalize()
            except Exception as e:
                errors.append((path, e))

        threads = [
            threading.Thread(target=write_file, args=("/out1.bin", b"1" * 50000)),
            threading.Thread(target=write_file, args=("/out2.bin", b"2" * 50000)),
            threading.Thread(target=write_file, args=("/out3.bin", b"3" * 50000)),
        ]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0, f"Errors: {errors}"

        # Verify all files written correctly (strip leading slash for lookup)
        for i in range(1, 4):
            key = f"out{i}.bin"
            assert key in fuse_instance.written_files
            data = bytes(fuse_instance.written_files[key])
            assert len(data) == 50000
            assert data == bytes([ord(str(i))] * 50000)


class TestStreamingEdgeCases:
    """Test edge cases for streaming I/O."""

    def test_empty_file_read(self):
        """Test reading an empty file."""
        fuse = MockFuseInstance(files={"/empty.bin": b""})
        reader = StreamingReader(fuse, "/empty.bin")

        data = reader.read_all()
        assert data == b""

    def test_empty_file_write(self):
        """Test writing an empty file."""
        fuse = MockFuseInstance(files={})
        writer = StreamingWriter(fuse, "/empty.bin")

        writer.write(b"")
        total = writer.finalize()
        assert total == 0

    def test_single_byte_file(self):
        """Test reading/writing a single byte file."""
        fuse = MockFuseInstance(files={"/single.bin": b"X"})

        # Read
        reader = StreamingReader(fuse, "/single.bin")
        assert reader.read_all() == b"X"

        # Write
        writer = StreamingWriter(fuse, "/single_out.bin")
        writer.write(b"Y")
        writer.finalize()

        assert fuse.written_files.get("single_out.bin") == bytearray(b"Y")

    def test_exact_chunk_size_file(self):
        """Test file that is exactly chunk size."""
        chunk_size = 1024
        data = b"E" * chunk_size
        fuse = MockFuseInstance(files={"/exact.bin": data})

        config = StreamingConfig(chunk_size=chunk_size)
        reader = StreamingReader(fuse, "/exact.bin", config)

        result = reader.read_all()
        assert result == data
        assert len(result) == chunk_size

    def test_one_byte_over_chunk_size(self):
        """Test file that is one byte over chunk size."""
        chunk_size = 1024
        data = b"O" * (chunk_size + 1)
        fuse = MockFuseInstance(files={"/over.bin": data})

        config = StreamingConfig(chunk_size=chunk_size)
        reader = StreamingReader(fuse, "/over.bin", config)

        chunks = list(reader.chunks())
        assert len(chunks) == 2  # Two chunks needed
        assert b"".join(chunks) == data

    def test_zero_chunk_size_config_raises_error(self):
        """Test that zero chunk size raises error."""
        with pytest.raises(ValueError):
            StreamingConfig(chunk_size=0)

    def test_negative_chunk_size_config_raises_error(self):
        """Test that negative chunk size raises error."""
        with pytest.raises(ValueError):
            StreamingConfig(chunk_size=-1)


class TestStreamingStateTransitions:
    """Test stream state transitions."""

    def test_reader_state_transitions(self):
        """Test reader state transitions during read."""
        fuse = MockFuseInstance(files={"/test.bin": b"data"})
        reader = StreamingReader(fuse, "/test.bin")

        # Initial state
        assert reader.get_progress().state == StreamState.IDLE

        # During read
        for chunk in reader.chunks():
            progress = reader.get_progress()
            assert progress.state in (StreamState.READING, StreamState.COMPLETED)

        # After completion
        final_progress = reader.get_progress()
        assert final_progress.state == StreamState.COMPLETED

    def test_writer_state_transitions(self):
        """Test writer state transitions during write."""
        fuse = MockFuseInstance(files={})
        writer = StreamingWriter(fuse, "/test.bin")

        # Initial state
        assert writer.get_progress().state == StreamState.IDLE

        # After write
        writer.write(b"data")
        progress = writer.get_progress()
        assert progress.state in (StreamState.WRITING, StreamState.IDLE)

        # After finalize
        writer.finalize()
        final_progress = writer.get_progress()
        assert final_progress.state == StreamState.COMPLETED

    def test_error_state_on_exception(self):
        """Test that state becomes ERROR on exception."""
        fuse = MockFuseInstance(files={})  # Empty - will cause read error
        reader = StreamingReader(fuse, "/nonexistent.bin")

        try:
            list(reader.chunks())
        except FileNotFoundError:
            pass

        # State should reflect error
        progress = reader.get_progress()
        assert progress.state == StreamState.ERROR
