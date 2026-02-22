"""
Mount Helper for PixelRTS FUSE Filesystem

Provides safe FUSE mount lifecycle management with automatic cleanup
on errors or signals. This is the foundation layer that BootBridge uses.

Key Features:
    - Context manager support for safe mount/unmount
    - atexit handler registration for crash cleanup
    - Signal handlers for SIGTERM, SIGINT
    - Lazy unmount for stuck mounts
    - Boot file discovery from metadata
"""

import os
import signal
import atexit
import tempfile
import threading
import subprocess
from pathlib import Path
from typing import Optional, Tuple, Dict, Any, List

# Import existing FUSE filesystem
try:
    from systems.rts_fuse.filesystem import RTSFilesystem, FUSE_AVAILABLE, FUSE
except ImportError:
    try:
        from rts_fuse.filesystem import RTSFilesystem, FUSE_AVAILABLE, FUSE
    except ImportError:
        FUSE_AVAILABLE = False
        RTSFilesystem = None
        FUSE = None

# Import PixelRTS decoder for metadata parsing
try:
    from systems.pixel_compiler.pixelrts_v2_core import PixelRTSDecoder, PixelRTSMetadata
except ImportError:
    try:
        from pixelrts_v2_core import PixelRTSDecoder, PixelRTSMetadata
    except ImportError:
        PixelRTSDecoder = None
        PixelRTSMetadata = None


class MountError(Exception):
    """
    Exception raised for FUSE mount errors.

    Attributes:
        message: Error description
        mountpoint: Path where mount was attempted
        original_error: Underlying exception if any
    """

    def __init__(self, message: str, mountpoint: Optional[str] = None, original_error: Optional[Exception] = None):
        self.message = message
        self.mountpoint = mountpoint
        self.original_error = original_error
        super().__init__(self.message)

    def __str__(self) -> str:
        result = self.message
        if self.mountpoint:
            result += f" (mountpoint: {self.mountpoint})"
        if self.original_error:
            result += f" - {self.original_error}"
        return result


class MountHelper:
    """
    Manages FUSE mount lifecycle for PixelRTS containers.

    Provides safe mount/unmount operations with automatic cleanup:
    - Context manager support for RAII-style cleanup
    - atexit handler for crash recovery
    - Signal handlers for graceful termination
    - Lazy unmount for stuck mounts

    Usage:
        # Context manager (recommended)
        with MountHelper("container.rts.png") as mountpoint:
            kernel, initrd = discover_boot_files(mountpoint)
            # ... use mountpoint ...

        # Manual mount/unmount
        helper = MountHelper("container.rts.png")
        mountpoint = helper.mount()
        try:
            # ... use mountpoint ...
        finally:
            helper.unmount()
    """

    # Common kernel filename patterns to search for
    KERNEL_PATTERNS = [
        "kernel",
        "vmlinuz",
        "vmlinux",
        "bzImage",
        "vmlinuz-linux",
        "kernel.bin",
    ]

    # Common initrd filename patterns to search for
    INITRD_PATTERNS = [
        "initrd",
        "initramfs",
        "initrd.img",
        "initramfs-linux.img",
        "initrd.gz",
        "initramfs.cpio.gz",
    ]

    # Track all active mounts for cleanup
    _active_mounts: Dict[str, 'MountHelper'] = {}
    _cleanup_registered = False

    def __init__(self, rts_png_path: str, mountpoint: Optional[str] = None):
        """
        Initialize MountHelper.

        Args:
            rts_png_path: Path to the PixelRTS container (.rts.png file)
            mountpoint: Optional mountpoint path. If None, creates temp directory.
        """
        self.rts_png_path = Path(rts_png_path).resolve()
        self._mountpoint = Path(mountpoint) if mountpoint else None
        self._mounted = False
        self._fuse_thread: Optional[threading.Thread] = None
        self._filesystem: Optional[RTSFilesystem] = None
        self._metadata: Optional[Dict[str, Any]] = None
        self._original_sigterm_handler = None
        self._original_sigint_handler = None

        # Validate RTS file exists
        if not self.rts_png_path.exists():
            raise MountError(f"RTS container not found: {rts_png_path}")

        # Load metadata for boot file discovery
        self._load_metadata()

        # Register global cleanup handlers if not already done
        self._register_cleanup_handlers()

    def _load_metadata(self):
        """Load metadata from RTS container for boot file discovery."""
        if PixelRTSDecoder is None:
            # Decoder not available, skip metadata loading
            self._metadata = {}
            return

        try:
            decoder = PixelRTSDecoder()

            # Try loading metadata from sidecar file
            meta_path = self.rts_png_path.with_suffix('.meta.json')
            if meta_path.exists():
                import json
                with open(meta_path, 'r') as f:
                    self._metadata = json.load(f)
            else:
                # Try loading from PNG
                with open(self.rts_png_path, 'rb') as f:
                    png_data = f.read()
                decoder.decode(png_data)
                self._metadata = decoder.get_metadata() or {}

        except Exception as e:
            # Metadata loading failed, continue with empty metadata
            self._metadata = {}

    def _register_cleanup_handlers(self):
        """Register global cleanup handlers for crash recovery."""
        if not MountHelper._cleanup_registered:
            # Register atexit handler
            atexit.register(MountHelper._cleanup_all_mounts)

            # Register signal handlers
            MountHelper._original_sigterm_handler = signal.getsignal(signal.SIGTERM)
            MountHelper._original_sigint_handler = signal.getsignal(signal.SIGINT)

            signal.signal(signal.SIGTERM, MountHelper._signal_handler)
            signal.signal(signal.SIGINT, MountHelper._signal_handler)

            MountHelper._cleanup_registered = True

    @classmethod
    def _signal_handler(cls, signum, frame):
        """Handle termination signals by cleaning up all mounts."""
        cls._cleanup_all_mounts()

        # Call original handler if it exists
        if signum == signal.SIGTERM and cls._original_sigterm_handler:
            if callable(cls._original_sigterm_handler):
                cls._original_sigterm_handler(signum, frame)
        elif signum == signal.SIGINT and cls._original_sigint_handler:
            if callable(cls._original_sigint_handler):
                cls._original_sigint_handler(signum, frame)

    @classmethod
    def _cleanup_all_mounts(cls):
        """Clean up all active mounts on exit or signal."""
        for mountpoint, helper in list(cls._active_mounts.items()):
            try:
                helper._force_cleanup()
            except Exception:
                pass  # Ignore errors during cleanup

    def mount(self) -> Path:
        """
        Mount the FUSE filesystem.

        Returns:
            Path to the mountpoint

        Raises:
            MountError: If mount fails or FUSE is not available
        """
        if self._mounted:
            return self._mountpoint

        if not FUSE_AVAILABLE:
            raise MountError(
                "FUSE not available. Install fusepy: pip install fusepy",
                mountpoint=str(self._mountpoint) if self._mountpoint else None
            )

        # Create mountpoint if not provided
        if self._mountpoint is None:
            self._mountpoint = Path(tempfile.mkdtemp(prefix="pixelrts_boot_"))

        # Ensure mountpoint exists
        self._mountpoint.mkdir(parents=True, exist_ok=True)

        try:
            # Create filesystem instance
            self._filesystem = RTSFilesystem(
                str(self.rts_png_path),
                max_workers=2,
                enable_writes=False
            )

            # Run FUSE in a background thread
            def run_fuse():
                try:
                    FUSE(
                        self._filesystem,
                        str(self._mountpoint),
                        foreground=False,  # Background mode
                        ro=True,  # Read-only
                        allow_other=False,  # Only current user
                        nothreads=False  # Multi-threaded
                    )
                except Exception as e:
                    # Store error for main thread
                    self._fuse_error = e

            self._fuse_error = None
            self._fuse_thread = threading.Thread(target=run_fuse, daemon=True)
            self._fuse_thread.start()

            # Wait briefly for mount to initialize
            import time
            max_wait = 2.0  # Maximum wait time
            start = time.time()

            while time.time() - start < max_wait:
                # Check if mountpoint is accessible
                if self._mountpoint.exists() and os.path.ismount(str(self._mountpoint)):
                    self._mounted = True
                    # Track this mount for cleanup
                    MountHelper._active_mounts[str(self._mountpoint)] = self
                    return self._mountpoint

                # Check for FUSE thread errors
                if self._fuse_error:
                    raise MountError(
                        "FUSE mount failed",
                        mountpoint=str(self._mountpoint),
                        original_error=self._fuse_error
                    )

                time.sleep(0.1)

            # Timeout - mount didn't appear
            raise MountError(
                "FUSE mount timeout - mountpoint not accessible",
                mountpoint=str(self._mountpoint)
            )

        except MountError:
            raise
        except Exception as e:
            raise MountError(
                f"Failed to mount FUSE filesystem: {e}",
                mountpoint=str(self._mountpoint),
                original_error=e
            )

    def unmount(self) -> None:
        """
        Unmount the FUSE filesystem.

        Uses lazy unmount (fusermount -uz) to handle stuck mounts.
        Safe to call multiple times.

        Raises:
            MountError: If unmount fails
        """
        if not self._mounted:
            return

        self._force_cleanup()

    def _force_cleanup(self) -> None:
        """
        Force cleanup of mount using lazy unmount.

        This method handles stuck mounts by using fusermount -uz
        which detaches the mount even if it's busy.
        """
        if not self._mounted or self._mountpoint is None:
            return

        mountpoint_str = str(self._mountpoint)

        try:
            # Use lazy unmount to handle stuck mounts
            subprocess.run(
                ["fusermount", "-uz", mountpoint_str],
                capture_output=True,
                timeout=5
            )
        except subprocess.TimeoutExpired:
            # Lazy unmount timeout, try force unmount
            try:
                subprocess.run(
                    ["fusermount", "-z", mountpoint_str],
                    capture_output=True,
                    timeout=5
                )
            except Exception:
                pass
        except FileNotFoundError:
            # fusermount not found, try umount
            try:
                subprocess.run(
                    ["umount", "-l", mountpoint_str],
                    capture_output=True,
                    timeout=5
                )
            except Exception:
                pass
        except Exception:
            pass  # Ignore errors during unmount

        # Remove from active mounts tracking
        if mountpoint_str in MountHelper._active_mounts:
            del MountHelper._active_mounts[mountpoint_str]

        # Clean up mountpoint directory if we created it
        try:
            if self._mountpoint.exists():
                self._mountpoint.rmdir()
        except Exception:
            pass  # Directory might not be empty or still mounted

        self._mounted = False
        self._filesystem = None
        self._fuse_thread = None

    def discover_boot_files(self) -> Tuple[Optional[str], Optional[str]]:
        """
        Discover kernel and initrd files from the mounted filesystem.

        First checks metadata for explicit file references, then searches
        for common kernel/initrd filename patterns.

        Returns:
            Tuple of (kernel_path, initrd_path). Either may be None if not found.
        """
        if not self._mounted:
            raise MountError("Cannot discover files - filesystem not mounted")

        kernel_path = None
        initrd_path = None

        # First check metadata for explicit references
        if self._metadata:
            offsets = self._metadata.get("offsets", {})
            segments = self._metadata.get("segments", {})

            # Check for explicit kernel reference
            for key in ["kernel", "vmlinuz", "vmlinux", "bzImage"]:
                if key in offsets or key in segments:
                    kernel_path = str(self._mountpoint / key)
                    break

            # Check for explicit initrd reference
            for key in ["initrd", "initramfs", "initrd.img"]:
                if key in offsets or key in segments:
                    initrd_path = str(self._mountpoint / key)
                    break

        # If not found in metadata, search filesystem
        if kernel_path is None or initrd_path is None:
            try:
                files = list(self._mountpoint.iterdir())

                # Search for kernel
                if kernel_path is None:
                    for pattern in self.KERNEL_PATTERNS:
                        for f in files:
                            if pattern in f.name.lower():
                                kernel_path = str(f)
                                break
                        if kernel_path:
                            break

                # Search for initrd
                if initrd_path is None:
                    for pattern in self.INITRD_PATTERNS:
                        for f in files:
                            if pattern in f.name.lower():
                                initrd_path = str(f)
                                break
                        if initrd_path:
                            break

            except Exception:
                pass  # Ignore errors during filesystem scan

        return kernel_path, initrd_path

    def is_mounted(self) -> bool:
        """Check if filesystem is currently mounted."""
        return self._mounted

    def get_mountpoint(self) -> Optional[Path]:
        """Get current mountpoint path, or None if not mounted."""
        return self._mountpoint if self._mounted else None

    def get_metadata(self) -> Optional[Dict[str, Any]]:
        """Get loaded metadata from RTS container."""
        return self._metadata

    def __enter__(self) -> 'MountHelper':
        """Context manager entry - mount filesystem."""
        self.mount()
        return self

    def __exit__(self, exc_type, exc_val, exc_tb) -> None:
        """Context manager exit - unmount filesystem."""
        self.unmount()
        return None  # Don't suppress exceptions

    def __repr__(self) -> str:
        """String representation."""
        status = "mounted" if self._mounted else "unmounted"
        return f"MountHelper(path={self.rts_png_path}, mountpoint={self._mountpoint}, status={status})"
