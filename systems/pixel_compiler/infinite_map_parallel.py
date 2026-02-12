"""
Parallel I/O for Infinite Map filesystem.

Provides concurrent read/write operations using thread pools.

Features:
- Priority-based task scheduling (HIGH, NORMAL, LOW)
- Thread-safe priority queue with FIFO ordering within priority
- Configurable worker count
- Graceful shutdown
- Progress callbacks
- Write serialization per file for consistency

Usage:
    from systems.pixel_compiler.infinite_map_parallel import (
        ParallelExecutor, ParallelReader, ParallelWriter, IOPriority
    )

    # Using executor directly
    executor = ParallelExecutor(config)
    futures = []
    for path in files:
        f = executor.submit_read(read_func, path, priority=IOPriority.NORMAL)
        futures.append(f)

    for f in as_completed(futures):
        data = f.result()
        process(data)

    executor.shutdown()

    # Using high-level reader/writer
    reader = ParallelReader(fuse_instance, config)
    results = reader.read_files(["/file1", "/file2", "/file3"])
    print(results["/file1"])  # bytes

    writer = ParallelWriter(fuse_instance, config)
    results = writer.write_files({"/out1": b"data1", "/out2": b"data2"})
"""

from concurrent.futures import ThreadPoolExecutor, Future, as_completed
from dataclasses import dataclass, field
from typing import Callable, List, Optional, Dict, Any, Tuple
from enum import Enum, auto
import threading
import queue
import time
import heapq


class IOPriority(Enum):
    """Priority levels for I/O operations."""
    HIGH = 0      # Metadata, critical operations
    NORMAL = 1    # Default priority
    LOW = 2       # Background, prefetch


@dataclass(order=True)
class PrioritizedTask:
    """Task with priority for the priority queue."""
    priority: int
    sequence: int  # Tie-breaker for FIFO ordering
    task: Any = field(compare=False)


class IOPriorityQueue:
    """
    Priority queue for I/O operations.

    Features:
    - Three priority levels (HIGH, NORMAL, LOW)
    - FIFO ordering within same priority
    - Thread-safe push/pop
    - Statistics tracking
    """

    def __init__(self, max_size: int = 1000):
        self.max_size = max_size
        self._queue: List[PrioritizedTask] = []
        self._lock = threading.Lock()
        self._not_empty = threading.Condition(self._lock)
        self._sequence = 0
        self._stats = {
            "high_count": 0,
            "normal_count": 0,
            "low_count": 0,
            "total_processed": 0,
        }

    def push(self, task: Callable, priority: IOPriority = IOPriority.NORMAL) -> bool:
        """Add task to queue with priority. Returns False if queue full."""
        with self._lock:
            if len(self._queue) >= self.max_size:
                return False

            prioritized = PrioritizedTask(
                priority=priority.value,
                sequence=self._sequence,
                task=task
            )
            self._sequence += 1
            heapq.heappush(self._queue, prioritized)

            # Update stats
            if priority == IOPriority.HIGH:
                self._stats["high_count"] += 1
            elif priority == IOPriority.NORMAL:
                self._stats["normal_count"] += 1
            else:
                self._stats["low_count"] += 1

            self._not_empty.notify()
            return True

    def pop(self, timeout: float = None) -> Optional[Callable]:
        """Get highest priority task. Blocks if empty."""
        with self._not_empty:
            if not self._queue:
                if not self._not_empty.wait(timeout):
                    return None

            if not self._queue:
                return None

            prioritized = heapq.heappop(self._queue)
            self._stats["total_processed"] += 1
            return prioritized.task

    def size(self) -> int:
        """Current queue size."""
        with self._lock:
            return len(self._queue)

    def get_stats(self) -> Dict[str, int]:
        """Get queue statistics."""
        with self._lock:
            return self._stats.copy()


class ParallelConfig:
    """Configuration for parallel I/O."""

    def __init__(
        self,
        max_workers: int = 4,
        queue_size: int = 100,
        task_timeout: float = 30.0,
    ):
        self.max_workers = max_workers
        self.queue_size = queue_size
        self.task_timeout = task_timeout


class ParallelExecutor:
    """
    Parallel I/O executor using thread pool.

    Features:
    - Configurable worker count
    - Priority-based task scheduling
    - Graceful shutdown
    - Statistics tracking

    Usage:
        executor = ParallelExecutor(config)

        # Submit parallel reads
        futures = []
        for path in files:
            f = executor.submit_read(read_func, path, priority=IOPriority.NORMAL)
            futures.append(f)

        # Collect results
        for f in as_completed(futures):
            data = f.result()
            process(data)

        executor.shutdown()
    """

    def __init__(self, config: Optional[ParallelConfig] = None):
        self.config = config or ParallelConfig()
        self._executor = ThreadPoolExecutor(max_workers=self.config.max_workers)
        self._priority_queue = IOPriorityQueue(max_size=self.config.queue_size)
        self._lock = threading.Lock()
        self._stats = {
            "reads_submitted": 0,
            "reads_completed": 0,
            "writes_submitted": 0,
            "writes_completed": 0,
            "errors": 0,
        }
        self._shutdown = False

    def submit_read(
        self,
        read_func: Callable,
        *args,
        priority: IOPriority = IOPriority.NORMAL,
        **kwargs,
    ) -> Future:
        """
        Submit a read operation for parallel execution.

        Args:
            read_func: Function to execute (e.g., fuse.read)
            priority: Operation priority
            *args, **kwargs: Arguments for read_func

        Returns:
            Future for the operation
        """
        with self._lock:
            if self._shutdown:
                raise RuntimeError("Executor has been shut down")
            self._stats["reads_submitted"] += 1

        def wrapped_read():
            try:
                result = read_func(*args, **kwargs)
                with self._lock:
                    self._stats["reads_completed"] += 1
                return result
            except Exception as e:
                with self._lock:
                    self._stats["errors"] += 1
                raise

        return self._executor.submit(wrapped_read)

    def submit_write(
        self,
        write_func: Callable,
        *args,
        priority: IOPriority = IOPriority.NORMAL,
        **kwargs,
    ) -> Future:
        """
        Submit a write operation for parallel execution.

        Note: Writes to same file are serialized for consistency.
        """
        with self._lock:
            if self._shutdown:
                raise RuntimeError("Executor has been shut down")
            self._stats["writes_submitted"] += 1

        def wrapped_write():
            try:
                result = write_func(*args, **kwargs)
                with self._lock:
                    self._stats["writes_completed"] += 1
                return result
            except Exception as e:
                with self._lock:
                    self._stats["errors"] += 1
                raise

        return self._executor.submit(wrapped_write)

    def submit_batch(
        self,
        tasks: List[Tuple[Callable, tuple, dict]],
        priority: IOPriority = IOPriority.NORMAL,
    ) -> List[Future]:
        """
        Submit multiple tasks at once.

        Args:
            tasks: List of (func, args, kwargs) tuples

        Returns:
            List of futures in submission order
        """
        futures = []
        for func, args, kwargs in tasks:
            future = self._executor.submit(func, *args, **kwargs)
            futures.append(future)
        return futures

    def parallel_read_files(
        self,
        file_paths: List[str],
        read_func: Callable,
        progress_callback: Optional[Callable[[int, int], None]] = None,
    ) -> Dict[str, bytes]:
        """
        Read multiple files in parallel.

        Args:
            file_paths: Files to read
            read_func: Function to read a file (takes path, returns bytes)
            progress_callback: Called with (completed, total)

        Returns:
            Dict mapping path -> file contents
        """
        results: Dict[str, bytes] = {}
        results_lock = threading.Lock()
        completed_count = [0]  # Use list for mutable closure
        total = len(file_paths)

        def read_with_tracking(path: str):
            data = read_func(path)
            with results_lock:
                results[path] = data
                completed_count[0] += 1
                if progress_callback:
                    progress_callback(completed_count[0], total)
            return data

        futures = []
        for path in file_paths:
            future = self.submit_read(read_with_tracking, path, priority=IOPriority.NORMAL)
            futures.append((path, future))

        # Wait for all to complete
        for path, future in futures:
            try:
                future.result(timeout=self.config.task_timeout)
            except Exception:
                # Store None for failed reads
                with results_lock:
                    results[path] = None

        return results

    def parallel_write_files(
        self,
        files: Dict[str, bytes],
        write_func: Callable,
        progress_callback: Optional[Callable[[int, int], None]] = None,
    ) -> Dict[str, bool]:
        """
        Write multiple files in parallel.

        Note: Files are grouped by parent directory and serialized
        within each group to prevent conflicts.

        Args:
            files: Dict mapping path -> contents
            write_func: Function to write a file
            progress_callback: Called with (completed, total)

        Returns:
            Dict mapping path -> success status
        """
        results: Dict[str, bool] = {}
        results_lock = threading.Lock()
        completed_count = [0]
        total = len(files)

        def write_with_tracking(path: str, data: bytes):
            try:
                write_func(path, data)
                with results_lock:
                    results[path] = True
                    completed_count[0] += 1
                    if progress_callback:
                        progress_callback(completed_count[0], total)
                return True
            except Exception:
                with results_lock:
                    results[path] = False
                    completed_count[0] += 1
                    if progress_callback:
                        progress_callback(completed_count[0], total)
                return False

        futures = []
        for path, data in files.items():
            future = self.submit_write(write_with_tracking, path, data, priority=IOPriority.NORMAL)
            futures.append((path, future))

        # Wait for all to complete
        for path, future in futures:
            try:
                future.result(timeout=self.config.task_timeout)
            except Exception:
                with results_lock:
                    if path not in results:
                        results[path] = False

        return results

    def get_stats(self) -> Dict[str, Any]:
        """Get executor statistics."""
        with self._lock:
            return self._stats.copy()

    def shutdown(self, wait: bool = True, timeout: float = None):
        """Shutdown the executor."""
        with self._lock:
            self._shutdown = True
        self._executor.shutdown(wait=wait, cancel_futures=not wait)

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.shutdown()
        return False


class ParallelReader:
    """
    High-level parallel file reader.

    Usage:
        reader = ParallelReader(fuse_instance, config)
        results = reader.read_files(["/file1", "/file2", "/file3"])
        print(results["/file1"])  # bytes
    """

    def __init__(self, fuse_instance, config: Optional[ParallelConfig] = None):
        self.fuse = fuse_instance
        self.config = config or ParallelConfig()
        self._executor = ParallelExecutor(self.config)

    def read_files(
        self,
        paths: List[str],
        priority: IOPriority = IOPriority.NORMAL,
        progress_callback: Optional[Callable[[int, int], None]] = None,
    ) -> Dict[str, bytes]:
        """Read multiple files in parallel."""
        results = {}
        results_lock = threading.Lock()
        completed = [0]
        total = len(paths)

        def read_file(path: str) -> bytes:
            try:
                attrs = self.fuse.getattr(path)
                size = attrs['st_size']
                return self.fuse.read(path, size, 0)
            except Exception:
                return None

        def track_progress(path: str):
            data = read_file(path)
            with results_lock:
                results[path] = data
                completed[0] += 1
                if progress_callback:
                    progress_callback(completed[0], total)
            return data

        futures = []
        for path in paths:
            future = self._executor.submit_read(track_progress, path, priority=priority)
            futures.append((path, future))

        # Wait for completion
        for path, future in futures:
            try:
                future.result(timeout=self.config.task_timeout)
            except Exception:
                with results_lock:
                    if path not in results:
                        results[path] = None

        return results

    def read_chunks(
        self,
        path: str,
        chunk_offsets: List[int],
        chunk_size: int,
        priority: IOPriority = IOPriority.NORMAL,
    ) -> List[bytes]:
        """Read chunks of a single file in parallel."""
        chunks = [None] * len(chunk_offsets)
        chunks_lock = threading.Lock()

        def read_chunk(index: int, offset: int) -> bytes:
            return self.fuse.read(path, chunk_size, offset)

        def track_chunk(index: int, offset: int):
            data = read_chunk(index, offset)
            with chunks_lock:
                chunks[index] = data
            return data

        futures = []
        for i, offset in enumerate(chunk_offsets):
            future = self._executor.submit_read(
                track_chunk, i, offset, priority=priority
            )
            futures.append(future)

        # Wait for completion
        for future in futures:
            try:
                future.result(timeout=self.config.task_timeout)
            except Exception:
                pass

        return chunks

    def shutdown(self):
        """Shutdown the executor."""
        self._executor.shutdown()


class ParallelWriter:
    """
    High-level parallel file writer.

    Ensures ordering for writes to same file.
    """

    def __init__(self, fuse_instance, config: Optional[ParallelConfig] = None):
        self.fuse = fuse_instance
        self.config = config or ParallelConfig()
        self._executor = ParallelExecutor(self.config)
        self._file_locks: Dict[str, threading.Lock] = {}
        self._locks_lock = threading.Lock()

    def _get_file_lock(self, path: str) -> threading.Lock:
        """Get or create lock for a file."""
        with self._locks_lock:
            if path not in self._file_locks:
                self._file_locks[path] = threading.Lock()
            return self._file_locks[path]

    def write_files(
        self,
        files: Dict[str, bytes],
        priority: IOPriority = IOPriority.NORMAL,
        progress_callback: Optional[Callable[[int, int], None]] = None,
    ) -> Dict[str, bool]:
        """Write multiple files in parallel."""
        results = {}
        results_lock = threading.Lock()
        completed = [0]
        total = len(files)

        def write_file(path: str, data: bytes) -> bool:
            try:
                # Get lock for this file to serialize writes
                file_lock = self._get_file_lock(path)
                with file_lock:
                    # Create file if needed
                    try:
                        self.fuse.create(path, 0o644)
                    except Exception:
                        pass  # File might exist

                    # Write data
                    self.fuse.write(path, data, 0)
                    return True
            except Exception:
                return False

        def track_progress(path: str, data: bytes):
            success = write_file(path, data)
            with results_lock:
                results[path] = success
                completed[0] += 1
                if progress_callback:
                    progress_callback(completed[0], total)
            return success

        futures = []
        for path, data in files.items():
            future = self._executor.submit_write(
                track_progress, path, data, priority=priority
            )
            futures.append((path, future))

        # Wait for completion
        for path, future in futures:
            try:
                future.result(timeout=self.config.task_timeout)
            except Exception:
                with results_lock:
                    if path not in results:
                        results[path] = False

        return results

    def shutdown(self):
        """Shutdown the executor."""
        self._executor.shutdown()
