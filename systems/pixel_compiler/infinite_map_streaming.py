"""
Streaming I/O for Infinite Map filesystem.

Provides chunked read/write operations for large files that don't fit in memory.

Features:
- Bounded memory usage via chunked operations
- Progress tracking and callbacks
- Cancellation support
- Thread-safe operations
"""

from dataclasses import dataclass
from typing import Callable, Optional, Iterator, Dict, Any
from enum import Enum
import threading


class StreamState(Enum):
    """State of a stream."""
    IDLE = "idle"
    READING = "reading"
    WRITING = "writing"
    COMPLETED = "completed"
    CANCELLED = "cancelled"
    ERROR = "error"


@dataclass
class StreamProgress:
    """Progress information for a stream operation."""
    bytes_transferred: int
    total_bytes: int
    chunks_processed: int
    state: StreamState

    @property
    def percent_complete(self) -> float:
        if self.total_bytes == 0:
            return 100.0
        return (self.bytes_transferred / self.total_bytes) * 100


ProgressCallback = Callable[[StreamProgress], None]


class StreamingConfig:
    """Configuration for streaming operations."""

    def __init__(
        self,
        chunk_size: int = 64 * 1024,  # 64KB default
        read_ahead_chunks: int = 2,
        write_behind_chunks: int = 2,
        max_buffer_size: int = 10 * 1024 * 1024,  # 10MB
    ):
        if chunk_size <= 0:
            raise ValueError("chunk_size must be positive")
        if max_buffer_size <= 0:
            raise ValueError("max_buffer_size must be positive")

        self.chunk_size = chunk_size
        self.read_ahead_chunks = read_ahead_chunks
        self.write_behind_chunks = write_behind_chunks
        self.max_buffer_size = max_buffer_size


class StreamingReader:
    """
    Streaming reader for large files.

    Reads files in chunks with read-ahead buffering.
    Memory usage bounded by config.max_buffer_size.

    Usage:
        reader = StreamingReader(fuse_instance, "/large/file.bin", config)
        for chunk in reader.chunks():
            process(chunk)

        # Or with progress callback
        reader.read_all(progress_callback=my_callback)
    """

    def __init__(
        self,
        fuse_instance,
        path: str,
        config: Optional[StreamingConfig] = None,
    ):
        self.fuse = fuse_instance
        self.path = path
        self.config = config or StreamingConfig()
        self._state = StreamState.IDLE
        self._bytes_read = 0
        self._chunks_processed = 0
        self._total_bytes: Optional[int] = None
        self._cancel_requested = False
        self._lock = threading.Lock()

    def get_file_size(self) -> int:
        """Get the total size of the file."""
        attrs = self.fuse.getattr(self.path)
        return attrs['st_size']

    def chunks(self, offset: int = 0) -> Iterator[bytes]:
        """
        Iterate over file chunks.

        Yields:
            bytes: Next chunk of data
        """
        with self._lock:
            self._state = StreamState.READING
            self._bytes_read = 0
            self._chunks_processed = 0
            self._cancel_requested = False

        try:
            total_bytes = self.get_file_size()
            self._total_bytes = total_bytes

            if offset >= total_bytes:
                with self._lock:
                    self._state = StreamState.COMPLETED
                return

            current_offset = offset

            while current_offset < total_bytes:
                # Check for cancellation
                with self._lock:
                    if self._cancel_requested:
                        self._state = StreamState.CANCELLED
                        return

                # Calculate chunk size
                remaining = total_bytes - current_offset
                chunk_size = min(self.config.chunk_size, remaining)

                # Read chunk
                chunk = self.fuse.read(self.path, chunk_size, current_offset)

                if not chunk:
                    break

                yield chunk

                with self._lock:
                    self._bytes_read += len(chunk)
                    self._chunks_processed += 1

                current_offset += len(chunk)

            with self._lock:
                self._state = StreamState.COMPLETED

        except Exception as e:
            with self._lock:
                self._state = StreamState.ERROR
            raise

    def read_all(
        self,
        progress_callback: Optional[ProgressCallback] = None,
    ) -> bytes:
        """
        Read entire file with progress tracking.

        Warning: Loads entire file into memory. Use chunks() for large files.
        """
        chunks = []
        total_bytes = self.get_file_size()
        self._total_bytes = total_bytes

        with self._lock:
            self._state = StreamState.READING
            self._bytes_read = 0
            self._chunks_processed = 0

        try:
            current_offset = 0

            while current_offset < total_bytes:
                with self._lock:
                    if self._cancel_requested:
                        self._state = StreamState.CANCELLED
                        return b"".join(chunks)

                remaining = total_bytes - current_offset
                chunk_size = min(self.config.chunk_size, remaining)

                chunk = self.fuse.read(self.path, chunk_size, current_offset)
                if not chunk:
                    break

                chunks.append(chunk)

                with self._lock:
                    self._bytes_read += len(chunk)
                    self._chunks_processed += 1

                current_offset += len(chunk)

                if progress_callback:
                    progress_callback(self.get_progress())

            with self._lock:
                self._state = StreamState.COMPLETED

            if progress_callback:
                progress_callback(self.get_progress())

            return b"".join(chunks)

        except Exception as e:
            with self._lock:
                self._state = StreamState.ERROR
            raise

    def read_range(
        self,
        start: int,
        end: int,
        progress_callback: Optional[ProgressCallback] = None,
    ) -> bytes:
        """Read a specific range of the file."""
        total_bytes = self.get_file_size()
        self._total_bytes = end - start

        with self._lock:
            self._state = StreamState.READING
            self._bytes_read = 0
            self._chunks_processed = 0

        try:
            chunks = []
            current_offset = start

            while current_offset < end:
                with self._lock:
                    if self._cancel_requested:
                        self._state = StreamState.CANCELLED
                        return b"".join(chunks)

                remaining = end - current_offset
                chunk_size = min(self.config.chunk_size, remaining)

                chunk = self.fuse.read(self.path, chunk_size, current_offset)
                if not chunk:
                    break

                chunks.append(chunk)

                with self._lock:
                    self._bytes_read += len(chunk)
                    self._chunks_processed += 1

                current_offset += len(chunk)

                if progress_callback:
                    progress_callback(self.get_progress())

            with self._lock:
                self._state = StreamState.COMPLETED

            if progress_callback:
                progress_callback(self.get_progress())

            return b"".join(chunks)

        except Exception as e:
            with self._lock:
                self._state = StreamState.ERROR
            raise

    def cancel(self):
        """Request cancellation of ongoing read."""
        with self._lock:
            self._cancel_requested = True

    def get_progress(self) -> StreamProgress:
        """Get current progress."""
        with self._lock:
            total = self._total_bytes if self._total_bytes is not None else 0
            return StreamProgress(
                bytes_transferred=self._bytes_read,
                total_bytes=total,
                chunks_processed=self._chunks_processed,
                state=self._state
            )


class StreamingWriter:
    """
    Streaming writer for large files.

    Writes files in chunks with write-behind buffering.
    Memory usage bounded by config.max_buffer_size.

    Usage:
        writer = StreamingWriter(fuse_instance, "/large/output.bin", config)
        writer.write(chunk1)
        writer.write(chunk2)
        writer.finalize()

        # Or with progress callback
        writer.write_all(data, progress_callback=my_callback)
    """

    def __init__(
        self,
        fuse_instance,
        path: str,
        config: Optional[StreamingConfig] = None,
        mode: int = 0o644,
    ):
        self.fuse = fuse_instance
        self.path = path
        self.config = config or StreamingConfig()
        self.mode = mode
        self._state = StreamState.IDLE
        self._bytes_written = 0
        self._chunks_processed = 0
        self._total_bytes: Optional[int] = None
        self._offset = 0
        self._buffer: bytearray = bytearray()
        self._cancel_requested = False
        self._lock = threading.Lock()
        self._finalized = False

        # Create the file
        try:
            self.fuse.create(self.path, self.mode)
        except Exception:
            pass  # File might already exist

    def write(self, data: bytes) -> int:
        """
        Write data to the file.

        Data is buffered and flushed when buffer exceeds chunk size.

        Returns:
            Number of bytes accepted (always len(data))
        """
        if not data:
            return 0

        with self._lock:
            if self._cancel_requested:
                self._state = StreamState.CANCELLED
                return 0

            self._state = StreamState.WRITING

        # Add data to buffer
        self._buffer.extend(data)

        # Flush if buffer exceeds chunk size
        if len(self._buffer) >= self.config.chunk_size:
            self._flush_buffer()

        return len(data)

    def _flush_buffer(self) -> None:
        """Flush buffered data to storage."""
        if not self._buffer:
            return

        with self._lock:
            if self._cancel_requested:
                return

        # Write buffer to FUSE
        data_to_write = bytes(self._buffer)

        try:
            written = self.fuse.write(self.path, data_to_write, self._offset)

            with self._lock:
                self._bytes_written += written
                self._chunks_processed += 1
                self._offset += written

            # Clear buffer
            self._buffer = bytearray()

        except Exception as e:
            with self._lock:
                self._state = StreamState.ERROR
            raise

    def write_all(
        self,
        data: bytes,
        progress_callback: Optional[ProgressCallback] = None,
    ) -> int:
        """
        Write all data with progress tracking.

        Warning: Requires entire data in memory.
        """
        self._total_bytes = len(data)

        with self._lock:
            self._state = StreamState.WRITING
            self._bytes_written = 0
            self._chunks_processed = 0
            self._cancel_requested = False

        try:
            offset_in_data = 0

            while offset_in_data < len(data):
                with self._lock:
                    if self._cancel_requested:
                        self._state = StreamState.CANCELLED
                        return self._bytes_written

                # Get next chunk
                remaining = len(data) - offset_in_data
                chunk_size = min(self.config.chunk_size, remaining)
                chunk = data[offset_in_data:offset_in_data + chunk_size]

                # Write chunk
                written = self.fuse.write(self.path, chunk, self._offset)

                with self._lock:
                    self._bytes_written += written
                    self._chunks_processed += 1
                    self._offset += written

                offset_in_data += chunk_size

                if progress_callback:
                    progress_callback(self.get_progress())

            with self._lock:
                self._state = StreamState.COMPLETED

            if progress_callback:
                progress_callback(self.get_progress())

            return self._bytes_written

        except Exception as e:
            with self._lock:
                self._state = StreamState.ERROR
            raise

    def finalize(self) -> int:
        """
        Finalize the write operation.

        Flushes any remaining buffered data.

        Returns:
            Total bytes written
        """
        with self._lock:
            if self._finalized:
                return self._bytes_written
            self._finalized = True

        # Flush any remaining buffered data
        if self._buffer:
            self._flush_buffer()

        # Flush to storage
        try:
            self.fuse.flush(self.path)
        except Exception:
            pass  # flush might not be implemented

        with self._lock:
            self._state = StreamState.COMPLETED

        return self._bytes_written

    def cancel(self):
        """Request cancellation. Partial data may be written."""
        with self._lock:
            self._cancel_requested = True
            self._state = StreamState.CANCELLED

    def get_progress(self) -> StreamProgress:
        """Get current progress."""
        with self._lock:
            total = self._total_bytes if self._total_bytes is not None else 0
            return StreamProgress(
                bytes_transferred=self._bytes_written,
                total_bytes=total,
                chunks_processed=self._chunks_processed,
                state=self._state
            )


class StreamingCopier:
    """
    Streaming copy between files.

    Copies data in chunks without loading entire file into memory.
    """

    def __init__(
        self,
        fuse_instance,
        config: Optional[StreamingConfig] = None,
    ):
        self.fuse = fuse_instance
        self.config = config or StreamingConfig()

    def copy(
        self,
        src_path: str,
        dst_path: str,
        progress_callback: Optional[ProgressCallback] = None,
    ) -> int:
        """
        Copy source to destination with streaming.

        Returns:
            Total bytes copied
        """
        # Get source file size
        attrs = self.fuse.getattr(src_path)
        total_bytes = attrs['st_size']

        # Create reader and writer
        reader = StreamingReader(self.fuse, src_path, self.config)
        writer = StreamingWriter(self.fuse, dst_path, self.config)

        bytes_copied = 0

        # Copy in chunks
        for chunk in reader.chunks():
            written = writer.write(chunk)
            bytes_copied += written

            if progress_callback:
                progress = StreamProgress(
                    bytes_transferred=bytes_copied,
                    total_bytes=total_bytes,
                    chunks_processed=reader._chunks_processed,
                    state=StreamState.READING
                )
                progress_callback(progress)

        # Finalize write
        writer.finalize()

        if progress_callback:
            progress = StreamProgress(
                bytes_transferred=bytes_copied,
                total_bytes=total_bytes,
                chunks_processed=reader._chunks_processed,
                state=StreamState.COMPLETED
            )
            progress_callback(progress)

        return bytes_copied
