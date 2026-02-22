"""
Disk Writer for PixelRTS Install Operations

Provides chunked disk write operations with progress callbacks and cancellation support.
Writes to a temporary file first, then atomically renames to final destination.

INSTALL-02: Chunked writes with progress callbacks and cancellation

Key Features:
    - WriteResult dataclass for operation results
    - DiskWriter class with chunked writes
    - Progress callback support
    - Cancellation during write operations
    - Atomic rename for complete writes or nothing
    - Context manager support

Usage:
    from systems.pixel_compiler.install import DiskWriter, WriteResult

    with DiskWriter(chunk_size=1024*1024) as writer:
        result = writer.write(
            src_reader=open('source.bin', 'rb'),
            dst_path=Path('/target/file.bin'),
            total_size=1024*1024*100,
            progress_callback=lambda p, m: print(f"{p*100:.0f}% - {m}")
        )
        if result.success:
            print(f"Wrote {result.bytes_written} bytes")
"""

import os
from dataclasses import dataclass
from pathlib import Path
from typing import Callable, Optional, IO


@dataclass
class WriteResult:
    """Result of a disk write operation."""
    success: bool
    bytes_written: int
    target_path: Path
    error_message: Optional[str]
    cancelled: bool


class DiskWriter:
    """
    Chunked disk writer with progress callbacks and cancellation support.

    Writes data in chunks to a temporary file, then atomically renames to
    the final destination. Supports cancellation during write operations
    and provides progress callbacks for visual feedback.

    Example:
        writer = DiskWriter(chunk_size=1024*1024)  # 1MB chunks

        def on_progress(progress: float, message: str):
            print(f"{progress*100:.0f}% - {message}")

        with open('source.img', 'rb') as src:
            result = writer.write(
                src_reader=src,
                dst_path=Path('/dev/sdX'),
                total_size=os.path.getsize('source.img'),
                progress_callback=on_progress
            )

        if result.cancelled:
            print("Write was cancelled")
        elif result.success:
            print("Write completed successfully")
    """

    def __init__(self, chunk_size: int = 1024 * 1024):
        """
        Initialize DiskWriter.

        Args:
            chunk_size: Size of each write chunk in bytes (default: 1MB)
        """
        self.chunk_size = chunk_size
        self._cancelled = False

    def write(
        self,
        src_reader: IO[bytes],
        dst_path: Path,
        total_size: int,
        progress_callback: Callable[[float, str], None]
    ) -> WriteResult:
        """
        Write data from source reader to destination path in chunks.

        Writes to a temporary file first, then atomically renames to final path.
        Supports cancellation during write operations.

        Args:
            src_reader: File-like object to read from
            dst_path: Destination file path
            total_size: Total size of the data to write in bytes
            progress_callback: Callback function(progress_ratio, message)

        Returns:
            WriteResult with success status, bytes written, and any error
        """
        self._cancelled = False
        bytes_written = 0
        temp_path = Path(str(dst_path) + '.tmp')

        try:
            # Ensure parent directory exists
            dst_path.parent.mkdir(parents=True, exist_ok=True)

            # Open temp file for writing
            with open(temp_path, 'wb') as dst_file:
                progress_callback(0.0, "Starting write operation...")

                while bytes_written < total_size:
                    # Check for cancellation
                    if self._cancelled:
                        # Clean up temp file
                        dst_file.close()
                        if temp_path.exists():
                            temp_path.unlink()
                        return WriteResult(
                            success=False,
                            bytes_written=bytes_written,
                            target_path=dst_path,
                            error_message="Write operation cancelled",
                            cancelled=True
                        )

                    # Read chunk from source
                    chunk = src_reader.read(self.chunk_size)
                    if not chunk:
                        break

                    # Write chunk to temp file
                    dst_file.write(chunk)
                    bytes_written += len(chunk)

                    # Report progress
                    progress = min(bytes_written / total_size, 1.0)
                    message = f"Writing... {bytes_written / (1024*1024):.1f}MB / {total_size / (1024*1024):.1f}MB"
                    progress_callback(progress, message)

                # Ensure all data is flushed to disk
                dst_file.flush()
                os.fsync(dst_file.fileno())

            # Atomic rename from temp to final path
            os.replace(temp_path, dst_path)

            progress_callback(1.0, f"Write complete: {bytes_written} bytes")

            return WriteResult(
                success=True,
                bytes_written=bytes_written,
                target_path=dst_path,
                error_message=None,
                cancelled=False
            )

        except FileNotFoundError as e:
            # Clean up temp file if it exists
            if temp_path.exists():
                temp_path.unlink()
            return WriteResult(
                success=False,
                bytes_written=bytes_written,
                target_path=dst_path,
                error_message=f"File not found: {e}",
                cancelled=False
            )

        except PermissionError as e:
            # Clean up temp file if it exists
            if temp_path.exists():
                temp_path.unlink()
            return WriteResult(
                success=False,
                bytes_written=bytes_written,
                target_path=dst_path,
                error_message=f"Permission denied: {e}",
                cancelled=False
            )

        except OSError as e:
            # Clean up temp file if it exists
            if temp_path.exists():
                temp_path.unlink()
            return WriteResult(
                success=False,
                bytes_written=bytes_written,
                target_path=dst_path,
                error_message=f"OS error: {e}",
                cancelled=False
            )

        except Exception as e:
            # Clean up temp file if it exists
            if temp_path.exists():
                temp_path.unlink()
            return WriteResult(
                success=False,
                bytes_written=bytes_written,
                target_path=dst_path,
                error_message=f"Unexpected error: {e}",
                cancelled=False
            )

    def cancel(self) -> None:
        """
        Request cancellation of the current write operation.

        The write operation will stop at the next chunk boundary and
        clean up the temporary file.
        """
        self._cancelled = True

    def __enter__(self) -> 'DiskWriter':
        """Enter context manager."""
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Exit context manager."""
        # Ensure cancellation flag is reset
        self._cancelled = False
