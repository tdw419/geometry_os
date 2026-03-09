#!/usr/bin/env python3
"""
QemuImgWrapper for qemu-img operations.

Provides a clean Python API for qemu-img operations, specifically the
`convert -l` command that extracts internal QEMU snapshots (created by savevm)
into standalone qcow2 files that can be encoded to PixelRTS format.

Key Components:
- QemuImgError: Custom exception for qemu-img operation failures
- SnapshotExtractResult: Result of a snapshot extraction operation
- QemuImgWrapper: Wrapper class for qemu-img CLI operations

Usage:
    from systems.pixel_compiler.boot.qemu_img_wrapper import QemuImgWrapper

    wrapper = QemuImgWrapper()

    # Check availability
    if wrapper.is_available():
        # Get version
        version = wrapper.get_version()

        # List snapshots in a qcow2 file
        snapshots = wrapper.list_snapshots(Path("disk.qcow2"))

        # Extract a snapshot to standalone file
        result = wrapper.extract_snapshot(
            source_qcow2=Path("disk.qcow2"),
            snapshot_tag="snapshot-1",
            output_path=Path("extracted.qcow2")
        )
"""

import re
import shutil
import subprocess
import logging
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Optional

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class QemuImgError(Exception):
    """Exception raised for qemu-img operation failures."""
    pass


@dataclass
class SnapshotExtractResult:
    """Result of a snapshot extraction operation."""
    success: bool
    snapshot_tag: str
    source_path: Path
    output_path: Path
    size_bytes: int = 0
    error_message: Optional[str] = None

    def to_dict(self) -> dict:
        """Convert to dictionary for serialization."""
        return {
            "success": self.success,
            "snapshot_tag": self.snapshot_tag,
            "source_path": str(self.source_path),
            "output_path": str(self.output_path),
            "size_bytes": self.size_bytes,
            "error_message": self.error_message
        }


class QemuImgWrapper:
    """
    Wrapper for qemu-img CLI operations.

    Provides a clean Python API for qemu-img operations, including:
    - Checking qemu-img availability
    - Getting version information
    - Listing internal snapshots in qcow2 files
    - Extracting snapshots to standalone qcow2 files
    """

    # Regex pattern for parsing 'qemu-img snapshot -l' output
    # Format: ID  TAG               VM SIZE                DATE     VM CLOCK
    # Example: 1   snapshot-1        2.5 GB      2024-01-15 14:30:00   00:01:23.456
    SNAPSHOT_LINE_PATTERN = re.compile(
        r'^\s*(\d+)\s+(\S+)\s+([\d.]+\s+\w+)\s+(\d{4}-\d{2}-\d{2}\s+\d{2}:\d{2}:\d{2})\s+([\d:.]+)'
    )

    def __init__(self, qemu_img_path: str = "qemu-img"):
        """
        Initialize the QemuImgWrapper.

        Args:
            qemu_img_path: Path to qemu-img binary (default: "qemu-img" from PATH)
        """
        self.qemu_img_path = qemu_img_path

    def is_available(self) -> bool:
        """
        Check if qemu-img is available on the system.

        Returns:
            True if qemu-img is found in PATH, False otherwise
        """
        if shutil.which(self.qemu_img_path) is not None:
            return True

        # Also check if the path is an absolute path to an executable
        if Path(self.qemu_img_path).is_absolute():
            return Path(self.qemu_img_path).exists() and Path(self.qemu_img_path).is_file()

        return False

    def get_version(self) -> Optional[str]:
        """
        Get qemu-img version string.

        Returns:
            Version string (first line of qemu-img --version output) or None if not available
        """
        if not self.is_available():
            return None

        try:
            result = subprocess.run(
                [self.qemu_img_path, "--version"],
                capture_output=True,
                text=True,
                timeout=10
            )

            if result.returncode == 0:
                # Return first line which contains version
                return result.stdout.strip().split('\n')[0]

            logger.error(f"Failed to get qemu-img version: {result.stderr}")
            return None

        except subprocess.TimeoutExpired:
            logger.error("Timeout getting qemu-img version")
            return None
        except Exception as e:
            logger.error(f"Error getting qemu-img version: {e}")
            return None

    def list_snapshots(self, qcow2_path: Path) -> List[str]:
        """
        List internal snapshots in a qcow2 file.

        Args:
            qcow2_path: Path to the qcow2 file

        Returns:
            List of snapshot tags

        Raises:
            QemuImgError: If qemu-img is not available or file doesn't exist
        """
        # Validate qemu-img is available
        if not self.is_available():
            raise QemuImgError("qemu-img is not available on this system")

        # Validate source file exists
        if not qcow2_path.exists():
            raise QemuImgError(f"qcow2 file not found: {qcow2_path}")

        try:
            result = subprocess.run(
                [self.qemu_img_path, "snapshot", "-l", str(qcow2_path)],
                capture_output=True,
                text=True,
                timeout=30
            )

            if result.returncode != 0:
                logger.error(f"Failed to list snapshots: {result.stderr}")
                return []

            # Parse the output to extract snapshot tags
            return self._parse_snapshot_list(result.stdout)

        except subprocess.TimeoutExpired:
            logger.error("Timeout listing snapshots")
            return []
        except Exception as e:
            logger.error(f"Error listing snapshots: {e}")
            return []

    def _parse_snapshot_list(self, output: str) -> List[str]:
        """
        Parse 'qemu-img snapshot -l' output to extract snapshot tags.

        Args:
            output: Raw output from qemu-img snapshot -l command

        Returns:
            List of snapshot tags
        """
        tags = []

        for line in output.split('\n'):
            line = line.strip()

            # Skip empty lines and header lines
            if not line or line.startswith('ID') or line.startswith('--'):
                continue

            # Try to match snapshot line pattern
            match = self.SNAPSHOT_LINE_PATTERN.match(line)
            if match:
                tags.append(match.group(2))  # Group 2 is the tag

        return tags

    def extract_snapshot(
        self,
        source_qcow2: Path,
        snapshot_tag: str,
        output_path: Path,
        timeout: int = 300
    ) -> SnapshotExtractResult:
        """
        Extract an internal QEMU snapshot to a standalone qcow2 file.

        Uses 'qemu-img convert -l <tag> -O qcow2' to extract the snapshot.

        Args:
            source_qcow2: Path to the source qcow2 file containing the snapshot
            snapshot_tag: Tag name of the snapshot to extract
            output_path: Path for the output standalone qcow2 file
            timeout: Timeout in seconds (default: 300)

        Returns:
            SnapshotExtractResult with success status and details

        Raises:
            QemuImgError: If qemu-img is not available or source file doesn't exist
        """
        logger.info(f"Extracting snapshot '{snapshot_tag}' from {source_qcow2} to {output_path}")

        # Validate qemu-img is available
        if not self.is_available():
            raise QemuImgError("qemu-img is not available on this system")

        # Validate source file exists
        if not source_qcow2.exists():
            raise QemuImgError(f"Source qcow2 file not found: {source_qcow2}")

        # Create output directory if needed
        output_path.parent.mkdir(parents=True, exist_ok=True)

        try:
            # Run qemu-img convert with snapshot extraction
            # qemu-img convert -l <snapshot_tag> -O qcow2 <source> <output>
            result = subprocess.run(
                [
                    self.qemu_img_path,
                    "convert",
                    "-l", snapshot_tag,
                    "-O", "qcow2",
                    str(source_qcow2),
                    str(output_path)
                ],
                capture_output=True,
                text=True,
                timeout=timeout
            )

            if result.returncode != 0:
                error_msg = result.stderr.strip() if result.stderr else "Unknown qemu-img error"
                logger.error(f"Failed to extract snapshot: {error_msg}")
                return SnapshotExtractResult(
                    success=False,
                    snapshot_tag=snapshot_tag,
                    source_path=source_qcow2,
                    output_path=output_path,
                    error_message=error_msg
                )

            # Get output file size
            size_bytes = output_path.stat().st_size if output_path.exists() else 0

            logger.info(f"Successfully extracted snapshot '{snapshot_tag}' to {output_path} ({size_bytes} bytes)")
            return SnapshotExtractResult(
                success=True,
                snapshot_tag=snapshot_tag,
                source_path=source_qcow2,
                output_path=output_path,
                size_bytes=size_bytes
            )

        except subprocess.TimeoutExpired:
            error_msg = f"Snapshot extraction timed out after {timeout} seconds"
            logger.error(error_msg)
            return SnapshotExtractResult(
                success=False,
                snapshot_tag=snapshot_tag,
                source_path=source_qcow2,
                output_path=output_path,
                error_message=error_msg
            )
        except Exception as e:
            error_msg = f"Error extracting snapshot: {e}"
            logger.error(error_msg)
            return SnapshotExtractResult(
                success=False,
                snapshot_tag=snapshot_tag,
                source_path=source_qcow2,
                output_path=output_path,
                error_message=error_msg
            )
