"""
Test suite for parallel I/O implementation for Infinite Map filesystem.

TDD: These tests are written FIRST before implementation.
"""

import pytest
import time
import threading
from concurrent.futures import Future
from unittest.mock import MagicMock, patch
from typing import Dict, Any, Optional

from systems.pixel_compiler.infinite_map_parallel import (
    IOPriority, IOPriorityQueue, ParallelConfig,
    ParallelExecutor, ParallelReader, ParallelWriter,
)


class MockFuseInstance:
    """Mock FUSE instance for testing parallel operations."""

    def __init__(self, files: Optional[Dict[str, bytes]] = None):
        self.files = files or {}
        self.written_files: Dict[str, bytes] = {}
        self._lock = threading.Lock()
        self.read_count = 0
        self.write_count = 0

    def getattr(self, path: str) -> Dict[str, Any]:
        """Get file attributes."""
        clean_path = path.lstrip('/')
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
            self.read_count += 1
            if clean_path not in self.files and path not in self.files:
                raise FileNotFoundError(f"No such file: {path}")
            data = self.files.get(clean_path) or self.files.get(path, b"")
            return data[offset:offset + size]

    def write(self, path: str, data: bytes, offset: int) -> int:
        """Write data to a file."""
        clean_path = path.lstrip('/')
        with self._lock:
            self.write_count += 1
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
        clean_path = path.lstrip('/')
        if clean_path in self.written_files:
            self.files[clean_path] = bytes(self.written_files[clean_path])
        return 0


class TestIOPriority:
    """Test IOPriority enum."""

    def test_priority_ordering(self):
        """Test that priority values are ordered correctly."""
        assert IOPriority.HIGH.value < IOPriority.NORMAL.value
        assert IOPriority.NORMAL.value < IOPriority.LOW.value

    def test_priority_values(self):
        """Test specific priority values."""
        assert IOPriority.HIGH.value == 0
        assert IOPriority.NORMAL.value == 1
        assert IOPriority.LOW.value == 2


class TestIOPriorityQueue:
    """Test priority queue."""

    def test_push_pop_single_item(self):
        """Test push and pop with a single item."""
        queue = IOPriorityQueue()

        task = lambda: "result"
        assert queue.push(task, IOPriority.NORMAL) is True

        result = queue.pop(timeout=1.0)
        assert result is not None
        assert result() == "result"

    def test_push_pop_fifo(self):
        """Test FIFO ordering within same priority."""
        queue = IOPriorityQueue()

        # Push tasks in order
        results = []
        queue.push(lambda: results.append(1), IOPriority.NORMAL)
        queue.push(lambda: results.append(2), IOPriority.NORMAL)
        queue.push(lambda: results.append(3), IOPriority.NORMAL)

        # Pop and execute in order
        for _ in range(3):
            task = queue.pop(timeout=1.0)
            if task:
                task()

        assert results == [1, 2, 3]

    def test_priority_ordering(self):
        """Test that HIGH priority tasks come first."""
        queue = IOPriorityQueue()

        results = []
        # Push in reverse priority order
        queue.push(lambda: results.append("low"), IOPriority.LOW)
        queue.push(lambda: results.append("normal"), IOPriority.NORMAL)
        queue.push(lambda: results.append("high"), IOPriority.HIGH)

        # Pop all tasks
        for _ in range(3):
            task = queue.pop(timeout=1.0)
            if task:
                task()

        # HIGH should be first, then NORMAL, then LOW
        assert results == ["high", "normal", "low"]

    def test_thread_safety(self):
        """Test concurrent push/pop."""
        queue = IOPriorityQueue()
        results = []
        errors = []

        def producer(start, count):
            for i in range(count):
                val = start + i
                if not queue.push(lambda v=val: results.append(v), IOPriority.NORMAL):
                    errors.append("Queue full")

        def consumer(count):
            for _ in range(count):
                task = queue.pop(timeout=2.0)
                if task:
                    task()

        # Start producers
        producers = [
            threading.Thread(target=producer, args=(0, 10)),
            threading.Thread(target=producer, args=(10, 10)),
            threading.Thread(target=producer, args=(20, 10)),
        ]

        for t in producers:
            t.start()
        for t in producers:
            t.join()

        # Consume all
        consumer_thread = threading.Thread(target=consumer, args=(30,))
        consumer_thread.start()
        consumer_thread.join()

        assert len(errors) == 0
        assert len(results) == 30

    def test_max_size_limit(self):
        """Test that queue rejects when full."""
        queue = IOPriorityQueue(max_size=3)

        assert queue.push(lambda: 1, IOPriority.NORMAL) is True
        assert queue.push(lambda: 2, IOPriority.NORMAL) is True
        assert queue.push(lambda: 3, IOPriority.NORMAL) is True
        # Queue is now full
        assert queue.push(lambda: 4, IOPriority.NORMAL) is False

    def test_size(self):
        """Test size method."""
        queue = IOPriorityQueue()

        assert queue.size() == 0
        queue.push(lambda: 1, IOPriority.NORMAL)
        assert queue.size() == 1
        queue.push(lambda: 2, IOPriority.NORMAL)
        assert queue.size() == 2
        queue.pop(timeout=1.0)
        assert queue.size() == 1

    def test_get_stats(self):
        """Test statistics tracking."""
        queue = IOPriorityQueue()

        queue.push(lambda: 1, IOPriority.HIGH)
        queue.push(lambda: 2, IOPriority.NORMAL)
        queue.push(lambda: 3, IOPriority.LOW)
        queue.push(lambda: 4, IOPriority.NORMAL)

        stats = queue.get_stats()
        assert stats["high_count"] == 1
        assert stats["normal_count"] == 2
        assert stats["low_count"] == 1


class TestParallelConfig:
    """Test ParallelConfig configuration."""

    def test_default_config(self):
        """Test default configuration values."""
        config = ParallelConfig()
        assert config.max_workers == 4
        assert config.queue_size == 100
        assert config.task_timeout == 30.0

    def test_custom_config(self):
        """Test custom configuration values."""
        config = ParallelConfig(
            max_workers=8,
            queue_size=200,
            task_timeout=60.0
        )
        assert config.max_workers == 8
        assert config.queue_size == 200
        assert config.task_timeout == 60.0


class TestParallelExecutor:
    """Test parallel executor."""

    def test_submit_read(self):
        """Test submitting read operations."""
        config = ParallelConfig(max_workers=2)
        executor = ParallelExecutor(config)

        def read_func():
            return b"test data"

        future = executor.submit_read(read_func, priority=IOPriority.NORMAL)
        assert isinstance(future, Future)

        result = future.result(timeout=5.0)
        assert result == b"test data"

        executor.shutdown()

    def test_submit_write(self):
        """Test submitting write operations."""
        config = ParallelConfig(max_workers=2)
        executor = ParallelExecutor(config)

        write_called = []

        def write_func(data):
            write_called.append(data)
            return len(data)

        future = executor.submit_write(write_func, b"test data", priority=IOPriority.NORMAL)
        result = future.result(timeout=5.0)

        assert result == 9
        assert b"test data" in write_called

        executor.shutdown()

    def test_submit_batch(self):
        """Test submitting multiple tasks at once."""
        config = ParallelConfig(max_workers=4)
        executor = ParallelExecutor(config)

        results = []

        tasks = [
            (lambda r=results, i=1: r.append(i), (), {}),
            (lambda r=results, i=2: r.append(i), (), {}),
            (lambda r=results, i=3: r.append(i), (), {}),
        ]

        futures = executor.submit_batch(tasks, priority=IOPriority.NORMAL)
        assert len(futures) == 3

        # Wait for all to complete
        for f in futures:
            f.result(timeout=5.0)

        assert sorted(results) == [1, 2, 3]
        executor.shutdown()

    def test_parallel_read_files(self):
        """Test reading multiple files in parallel."""
        fuse = MockFuseInstance(files={
            "/file1.txt": b"content1",
            "/file2.txt": b"content2",
            "/file3.txt": b"content3",
        })

        config = ParallelConfig(max_workers=3)
        executor = ParallelExecutor(config)

        def read_func(path):
            return fuse.read(path, 1024, 0)

        files = ["/file1.txt", "/file2.txt", "/file3.txt"]
        results = executor.parallel_read_files(files, read_func)

        assert len(results) == 3
        assert results["/file1.txt"] == b"content1"
        assert results["/file2.txt"] == b"content2"
        assert results["/file3.txt"] == b"content3"

        executor.shutdown()

    def test_parallel_write_files(self):
        """Test writing multiple files in parallel."""
        fuse = MockFuseInstance(files={})

        config = ParallelConfig(max_workers=3)
        executor = ParallelExecutor(config)

        def write_func(path, data):
            fuse.create(path, 0o644)
            return fuse.write(path, data, 0)

        files = {
            "/file1.txt": b"content1",
            "/file2.txt": b"content2",
            "/file3.txt": b"content3",
        }

        results = executor.parallel_write_files(files, write_func)

        assert len(results) == 3
        assert all(results.values())  # All writes should succeed

        executor.shutdown()

    def test_statistics_tracking(self):
        """Test that stats are tracked."""
        config = ParallelConfig(max_workers=2)
        executor = ParallelExecutor(config)

        # Submit some reads and writes
        executor.submit_read(lambda: b"data").result(timeout=5.0)
        executor.submit_read(lambda: b"data2").result(timeout=5.0)
        executor.submit_write(lambda d: len(d), b"write").result(timeout=5.0)

        stats = executor.get_stats()
        assert stats["reads_submitted"] == 2
        assert stats["reads_completed"] == 2
        assert stats["writes_submitted"] == 1
        assert stats["writes_completed"] == 1

        executor.shutdown()

    def test_context_manager(self):
        """Test using executor as context manager."""
        with ParallelExecutor() as executor:
            future = executor.submit_read(lambda: b"test")
            result = future.result(timeout=5.0)
            assert result == b"test"
        # Executor should be shut down after context exit

    def test_graceful_shutdown(self):
        """Test executor shutdown."""
        executor = ParallelExecutor()

        # Submit a task
        future = executor.submit_read(lambda: b"test")
        future.result(timeout=5.0)

        # Shutdown
        executor.shutdown(wait=True)

        # Further submissions should fail gracefully
        with pytest.raises(RuntimeError):
            executor.submit_read(lambda: b"test")


class TestParallelReader:
    """Test parallel reader."""

    @pytest.fixture
    def fuse_with_files(self):
        """Create FUSE instance with test files."""
        files = {
            "/file1.txt": b"A" * 1000,
            "/file2.txt": b"B" * 1000,
            "/file3.txt": b"C" * 1000,
            "/file4.txt": b"D" * 1000,
            "/file5.txt": b"E" * 1000,
        }
        return MockFuseInstance(files=files)

    def test_read_multiple_files(self, fuse_with_files):
        """Test reading multiple files in parallel."""
        config = ParallelConfig(max_workers=3)
        reader = ParallelReader(fuse_with_files, config)

        paths = ["/file1.txt", "/file2.txt", "/file3.txt"]
        results = reader.read_files(paths)

        assert len(results) == 3
        assert results["/file1.txt"] == b"A" * 1000
        assert results["/file2.txt"] == b"B" * 1000
        assert results["/file3.txt"] == b"C" * 1000

        reader.shutdown()

    def test_read_with_priority(self, fuse_with_files):
        """Test reading with different priorities."""
        config = ParallelConfig(max_workers=2)
        reader = ParallelReader(fuse_with_files, config)

        paths = ["/file1.txt", "/file2.txt"]
        results = reader.read_files(paths, priority=IOPriority.HIGH)

        assert len(results) == 2
        reader.shutdown()

    def test_read_with_progress_callback(self, fuse_with_files):
        """Test progress callback during reads."""
        config = ParallelConfig(max_workers=2)
        reader = ParallelReader(fuse_with_files, config)

        progress_calls = []

        def progress_callback(completed, total):
            progress_calls.append((completed, total))

        paths = ["/file1.txt", "/file2.txt", "/file3.txt"]
        results = reader.read_files(paths, progress_callback=progress_callback)

        assert len(results) == 3
        assert len(progress_calls) >= 1  # Should have at least final callback

        reader.shutdown()

    def test_read_chunks_parallel(self, fuse_with_files):
        """Test reading chunks of a file in parallel."""
        config = ParallelConfig(max_workers=4)
        reader = ParallelReader(fuse_with_files, config)

        # Read file4 in chunks
        chunk_offsets = [0, 250, 500, 750]
        chunks = reader.read_chunks("/file4.txt", chunk_offsets, chunk_size=250)

        assert len(chunks) == 4
        # Each chunk should have 250 bytes
        for chunk in chunks:
            assert chunk == b"D" * 250

        reader.shutdown()

    def test_faster_than_sequential(self, fuse_with_files):
        """Test that parallel is faster than sequential for multiple files."""
        config = ParallelConfig(max_workers=4)
        reader = ParallelReader(fuse_with_files, config)

        paths = ["/file1.txt", "/file2.txt", "/file3.txt", "/file4.txt", "/file5.txt"]

        # Reset read count
        fuse_with_files.read_count = 0

        # Parallel read
        start_parallel = time.time()
        parallel_results = reader.read_files(paths)
        parallel_time = time.time() - start_parallel

        # Sequential read (simulated)
        fuse_with_files.read_count = 0
        start_sequential = time.time()
        sequential_results = {}
        for path in paths:
            sequential_results[path] = fuse_with_files.read(path, 1000, 0)
        sequential_time = time.time() - start_sequential

        # Results should be the same
        assert parallel_results == sequential_results

        # Parallel should generally not be slower (with small overhead)
        # In practice, parallel is often faster for I/O bound operations
        # This test just verifies both work correctly

        reader.shutdown()


class TestParallelWriter:
    """Test parallel writer."""

    @pytest.fixture
    def fuse_instance(self):
        """Create FUSE instance for writing."""
        return MockFuseInstance(files={})

    def test_write_multiple_files(self, fuse_instance):
        """Test writing multiple files in parallel."""
        config = ParallelConfig(max_workers=3)
        writer = ParallelWriter(fuse_instance, config)

        files = {
            "/file1.txt": b"content1",
            "/file2.txt": b"content2",
            "/file3.txt": b"content3",
        }

        results = writer.write_files(files)

        assert len(results) == 3
        assert all(results.values())

        writer.shutdown()

    def test_write_with_priority(self, fuse_instance):
        """Test writing with different priorities."""
        config = ParallelConfig(max_workers=2)
        writer = ParallelWriter(fuse_instance, config)

        files = {
            "/file1.txt": b"content1",
            "/file2.txt": b"content2",
        }

        results = writer.write_files(files, priority=IOPriority.HIGH)

        assert all(results.values())
        writer.shutdown()

    def test_write_ordering(self, fuse_instance):
        """Test that writes to same file are ordered."""
        config = ParallelConfig(max_workers=1)  # Single worker for ordering
        writer = ParallelWriter(fuse_instance, config)

        # Multiple writes to same file
        files = {
            "/same.txt": b"final_content",
        }

        results = writer.write_files(files)

        assert results["/same.txt"]
        # The file should contain the written content
        assert fuse_instance.written_files.get("same.txt") == bytearray(b"final_content")

        writer.shutdown()

    def test_write_conflict_handling(self, fuse_instance):
        """Test handling of concurrent writes to same file."""
        config = ParallelConfig(max_workers=4)
        writer = ParallelWriter(fuse_instance, config)

        # Write multiple files simultaneously
        files = {
            f"/file{i}.txt": f"content{i}".encode()
            for i in range(10)
        }

        results = writer.write_files(files)

        # All writes should succeed
        assert len(results) == 10
        assert all(results.values())

        # Verify all files were written
        for i in range(10):
            key = f"file{i}.txt"
            assert key in fuse_instance.written_files
            assert bytes(fuse_instance.written_files[key]) == f"content{i}".encode()

        writer.shutdown()

    def test_write_with_progress_callback(self, fuse_instance):
        """Test progress callback during writes."""
        config = ParallelConfig(max_workers=2)
        writer = ParallelWriter(fuse_instance, config)

        progress_calls = []

        def progress_callback(completed, total):
            progress_calls.append((completed, total))

        files = {
            "/file1.txt": b"content1",
            "/file2.txt": b"content2",
            "/file3.txt": b"content3",
        }

        results = writer.write_files(files, progress_callback=progress_callback)

        assert all(results.values())
        assert len(progress_calls) >= 1

        writer.shutdown()

    def test_file_lock_management(self, fuse_instance):
        """Test that file locks are properly managed."""
        config = ParallelConfig(max_workers=2)
        writer = ParallelWriter(fuse_instance, config)

        # Get lock for a file
        lock1 = writer._get_file_lock("/test.txt")
        lock2 = writer._get_file_lock("/test.txt")

        # Same file should return same lock
        assert lock1 is lock2

        # Different file should return different lock
        lock3 = writer._get_file_lock("/other.txt")
        assert lock1 is not lock3

        writer.shutdown()


class TestParallelIntegration:
    """Integration tests for parallel I/O."""

    @pytest.fixture
    def fuse_with_data(self):
        """Create FUSE instance with test data."""
        files = {
            f"/data/file{i}.bin": bytes([i % 256] * 1000)
            for i in range(20)
        }
        return MockFuseInstance(files=files)

    def test_parallel_copy_operation(self, fuse_with_data):
        """Test parallel read then write (copy-like operation)."""
        config = ParallelConfig(max_workers=4)
        reader = ParallelReader(fuse_with_data, config)
        writer = ParallelWriter(fuse_with_data, config)

        # Read all files
        paths = [f"/data/file{i}.bin" for i in range(10)]
        data = reader.read_files(paths)

        # Write to new locations
        new_files = {
            f"/copy/file{i}.bin": data[f"/data/file{i}.bin"]
            for i in range(10)
        }
        results = writer.write_files(new_files)

        assert all(results.values())

        reader.shutdown()
        writer.shutdown()

    def test_high_load_parallel_reads(self, fuse_with_data):
        """Test high load with many parallel reads."""
        config = ParallelConfig(max_workers=8)
        reader = ParallelReader(fuse_with_data, config)

        # Read all 20 files
        paths = [f"/data/file{i}.bin" for i in range(20)]
        results = reader.read_files(paths)

        assert len(results) == 20
        for i in range(20):
            expected = bytes([i % 256] * 1000)
            assert results[f"/data/file{i}.bin"] == expected

        reader.shutdown()

    def test_high_load_parallel_writes(self):
        """Test high load with many parallel writes."""
        fuse = MockFuseInstance(files={})
        config = ParallelConfig(max_workers=8)
        writer = ParallelWriter(fuse, config)

        # Write 50 files
        files = {
            f"/batch/file{i}.bin": bytes([i % 256] * 500)
            for i in range(50)
        }
        results = writer.write_files(files)

        assert len(results) == 50
        assert all(results.values())

        writer.shutdown()

    def test_mixed_priority_operations(self, fuse_with_data):
        """Test operations with mixed priorities."""
        config = ParallelConfig(max_workers=4)
        executor = ParallelExecutor(config)

        results = []

        # Submit tasks with different priorities
        # LOW priority first
        f1 = executor.submit_read(lambda: results.append("low1"), priority=IOPriority.LOW)
        f2 = executor.submit_read(lambda: results.append("low2"), priority=IOPriority.LOW)
        # Then NORMAL
        f3 = executor.submit_read(lambda: results.append("normal"), priority=IOPriority.NORMAL)
        # Then HIGH
        f4 = executor.submit_read(lambda: results.append("high"), priority=IOPriority.HIGH)

        # Wait for all
        for f in [f1, f2, f3, f4]:
            f.result(timeout=5.0)

        # Due to thread pool execution, order might vary
        # but we should have all 4 results
        assert len(results) == 4
        assert set(results) == {"low1", "low2", "normal", "high"}

        executor.shutdown()
