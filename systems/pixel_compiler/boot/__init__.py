"""
Boot Package for PixelRTS

Provides FUSE mount lifecycle management and boot bridge functionality
for booting operating systems from PixelRTS containers.

Key Classes:
    - MountHelper: Safe FUSE mount/unmount with automatic cleanup
    - BootBridge: Unified FUSE mount + QEMU boot orchestration
    - BootResult: Data class for boot operation results
    - BootProgress: Visual progress display for boot operations
    - ProgressStage: Enum for boot progress stages
    - ResourceAllocator: VNC port and socket path allocation for multi-boot
    - AllocatedResources: Container for allocated boot resources
    - MultiBootManager: Concurrent boot orchestration for multiple containers
    - ContainerInfo: Information about a booted container
    - ContainerState: Lifecycle state enum for containers
    - MultiBootResult: Result of a multi-boot operation
"""

from .mount_helper import MountHelper, MountError
from .boot_bridge import BootBridge, BootResult
from .boot_progress import BootProgress, ProgressStage
from .resource_allocator import ResourceAllocator, AllocatedResources, ResourceExhaustedError, InvalidNameError
from .multi_boot_manager import (
    MultiBootManager,
    ContainerInfo,
    ContainerState,
    MultiBootResult,
)

__all__ = [
    "MountHelper",
    "MountError",
    "BootBridge",
    "BootResult",
    "BootProgress",
    "ProgressStage",
    "ResourceAllocator",
    "AllocatedResources",
    "ResourceExhaustedError",
    "InvalidNameError",
    "MultiBootManager",
    "ContainerInfo",
    "ContainerState",
    "MultiBootResult",
]
