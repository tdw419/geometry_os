"""
Multi-Boot Manager for PixelRTS

Provides concurrent boot orchestration for multiple containers,
enabling users to boot multiple .rts.png files simultaneously
with a single call.

Key Features:
    - Concurrent boot of multiple containers with asyncio.gather
    - Per-container resource allocation (unique VNC ports, sockets)
    - Container lifecycle tracking (state, status)
    - List running containers with list_containers()
    - Stop all containers with stop_all()

Usage:
    manager = MultiBootManager()

    # Boot multiple containers
    result = await manager.boot_all(["alpine.rts.png", "ubuntu.rts.png"])

    # List running containers
    containers = manager.list_containers()

    # Stop all containers
    manager.stop_all()

Architecture:
    - Composition pattern: wraps BootBridge instances
    - Uses ResourceAllocator for per-container resource allocation
    - asyncio.gather for concurrent boot operations
"""

import asyncio
import logging
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional, Dict, List, Union, Any

from .boot_bridge import BootBridge, BootResult
from .resource_allocator import (
    ResourceAllocator,
    AllocatedResources,
    ResourceExhaustedError,
    InvalidNameError,
)

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ContainerState(Enum):
    """
    Lifecycle state of a container.

    States:
        IDLE: Container not yet booted
        BOOTING: Boot operation in progress
        RUNNING: Container is running (QEMU process active)
        STOPPED: Container was stopped
        ERROR: Boot failed or error occurred
    """
    IDLE = "idle"
    BOOTING = "booting"
    RUNNING = "running"
    STOPPED = "stopped"
    ERROR = "error"


@dataclass
class ContainerInfo:
    """
    Information about a booted container.

    Attributes:
        name: Container name (derived from .rts.png filename)
        path: Path to the .rts.png file
        state: Current lifecycle state
        resources: Allocated resources (VNC port, sockets)
        boot_result: BootResult from BootBridge (if booted)
        error_message: Error description if state is ERROR
    """
    name: str
    path: Path
    state: ContainerState = ContainerState.IDLE
    resources: Optional[AllocatedResources] = None
    boot_result: Optional[BootResult] = None
    error_message: Optional[str] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "name": self.name,
            "path": str(self.path),
            "state": self.state.value,
            "vnc_port": self.resources.vnc_port if self.resources else None,
            "container_id": self.resources.container_id if self.resources else None,
            "serial_socket": str(self.resources.serial_socket) if self.resources else None,
            "monitor_socket": str(self.resources.monitor_socket) if self.resources else None,
            "pid": self.boot_result.pid if self.boot_result else None,
            "error_message": self.error_message,
        }


@dataclass
class MultiBootResult:
    """
    Result of a multi-boot operation (boot_all).

    Attributes:
        success: Whether all containers booted successfully
        containers: List of ContainerInfo for all containers
        success_count: Number of successfully booted containers
        failure_count: Number of failed containers
        error_messages: List of error messages for failed containers
    """
    success: bool
    containers: List[ContainerInfo] = field(default_factory=list)
    success_count: int = 0
    failure_count: int = 0
    error_messages: List[str] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "success": self.success,
            "success_count": self.success_count,
            "failure_count": self.failure_count,
            "containers": [c.to_dict() for c in self.containers],
            "error_messages": self.error_messages,
        }


class MultiBootManager:
    """
    Orchestrates concurrent boot of multiple PixelRTS containers.

    This manager provides:
    1. boot_all(): Boot multiple containers concurrently with asyncio
    2. list_containers(): Get list of all managed containers with state
    3. stop_all(): Stop all running containers

    Each container gets unique allocated resources (VNC port, sockets)
    via ResourceAllocator to prevent conflicts.

    Example:
        >>> manager = MultiBootManager()
        >>> result = manager.boot_all(["alpine.rts.png", "ubuntu.rts.png"])
        >>> print(f"Booted {result.success_count} containers")
        >>> for info in manager.list_containers():
        ...     print(f"{info.name}: {info.state.value} on VNC :{info.resources.vnc_port}")
        >>> manager.stop_all()
    """

    def __init__(self, resource_allocator: Optional[ResourceAllocator] = None):
        """
        Initialize MultiBootManager.

        Args:
            resource_allocator: Optional custom ResourceAllocator instance.
                               If not provided, a new one is created.
        """
        self._allocator = resource_allocator or ResourceAllocator()
        self._containers: Dict[str, ContainerInfo] = {}
        self._bridges: Dict[str, BootBridge] = {}
        self._lock = asyncio.Lock()

    def _get_container_name(self, path: Union[str, Path]) -> str:
        """
        Derive container name from path.

        Args:
            path: Path to .rts.png file

        Returns:
            Container name (filename without extension)
        """
        return Path(path).stem

    async def _boot_single(
        self,
        path: Union[str, Path],
        cmdline: Optional[str] = None,
        memory: str = "2G",
        cpus: int = 2,
    ) -> ContainerInfo:
        """
        Boot a single container.

        This is an internal async method used by boot_all.

        Args:
            path: Path to .rts.png file
            cmdline: Optional kernel command line
            memory: Memory allocation (default: "2G")
            cpus: Number of CPUs (default: 2)

        Returns:
            ContainerInfo with boot result
        """
        path = Path(path).resolve()
        name = self._get_container_name(path)

        async with self._lock:
            # Check if already exists
            if name in self._containers:
                return self._containers[name]

            # Create container info
            info = ContainerInfo(
                name=name,
                path=path,
                state=ContainerState.BOOTING,
            )
            self._containers[name] = info

        try:
            # Allocate resources
            resources = self._allocator.allocate(name)
            info.resources = resources

            logger.info(f"Booting {name} with VNC port {resources.vnc_port}")

            # Create BootBridge with allocated VNC display
            # VNC display = port - 5900
            vnc_display = resources.vnc_port - 5900

            bridge = BootBridge(
                rts_png_path=path,
                memory=memory,
                cpus=cpus,
                vnc_display=vnc_display,
                verbose=False,
            )

            # Run synchronous boot in executor for async compatibility
            loop = asyncio.get_event_loop()
            boot_result = await loop.run_in_executor(
                None,
                lambda: bridge.boot(cmdline=cmdline)
            )

            async with self._lock:
                self._bridges[name] = bridge
                info.boot_result = boot_result

                if boot_result.success:
                    info.state = ContainerState.RUNNING
                    logger.info(f"Container {name} booted successfully (PID: {boot_result.pid})")
                else:
                    info.state = ContainerState.ERROR
                    info.error_message = boot_result.error_message
                    logger.error(f"Container {name} boot failed: {boot_result.error_message}")

            return info

        except ResourceExhaustedError as e:
            async with self._lock:
                info.state = ContainerState.ERROR
                info.error_message = f"Resource allocation failed: {e}"
            logger.error(f"Resource exhausted for {name}: {e}")
            return info

        except InvalidNameError as e:
            async with self._lock:
                info.state = ContainerState.ERROR
                info.error_message = f"Invalid container name: {e}"
            logger.error(f"Invalid name for {name}: {e}")
            return info

        except Exception as e:
            async with self._lock:
                info.state = ContainerState.ERROR
                info.error_message = str(e)
            logger.error(f"Unexpected error booting {name}: {e}")
            return info

    def boot_all(
        self,
        paths: List[Union[str, Path]],
        cmdline: Optional[str] = None,
        memory: str = "2G",
        cpus: int = 2,
    ) -> MultiBootResult:
        """
        Boot multiple containers concurrently.

        Uses asyncio.gather to boot all containers in parallel,
        with each container getting unique allocated resources.

        Args:
            paths: List of paths to .rts.png files
            cmdline: Optional kernel command line (applied to all)
            memory: Memory allocation per container (default: "2G")
            cpus: Number of CPUs per container (default: 2)

        Returns:
            MultiBootResult with success status and container info

        Example:
            >>> manager = MultiBootManager()
            >>> result = manager.boot_all(["alpine.rts.png", "ubuntu.rts.png"])
            >>> if result.success:
            ...     print(f"All {result.success_count} containers booted")
            >>> else:
            ...     print(f"{result.failure_count} containers failed")
        """
        logger.info(f"Starting concurrent boot of {len(paths)} containers")

        # Validate paths exist
        validated_paths = []
        for p in paths:
            path = Path(p)
            if not path.exists():
                logger.warning(f"Path does not exist: {p}")
            validated_paths.append(path)

        # Create async tasks for concurrent boot
        async def _boot_all_async():
            tasks = [
                self._boot_single(path, cmdline, memory, cpus)
                for path in validated_paths
            ]
            return await asyncio.gather(*tasks)

        # Run the async boot operations
        try:
            # Try running in existing event loop context
            try:
                loop = asyncio.get_running_loop()
                # Already in async context, run in thread
                import concurrent.futures
                with concurrent.futures.ThreadPoolExecutor() as executor:
                    future = executor.submit(
                        asyncio.run,
                        _boot_all_async()
                    )
                    container_infos = future.result()
            except RuntimeError:
                # No running loop, safe to use asyncio.run
                container_infos = asyncio.run(_boot_all_async())
        except RuntimeError:
            # No event loop, create new one
            container_infos = asyncio.run(_boot_all_async())

        # Calculate result statistics
        success_count = sum(1 for c in container_infos if c.state == ContainerState.RUNNING)
        failure_count = len(container_infos) - success_count
        error_messages = [
            f"{c.name}: {c.error_message}"
            for c in container_infos
            if c.error_message
        ]

        result = MultiBootResult(
            success=(failure_count == 0 and success_count > 0),
            containers=container_infos,
            success_count=success_count,
            failure_count=failure_count,
            error_messages=error_messages,
        )

        logger.info(
            f"Boot complete: {success_count} succeeded, {failure_count} failed"
        )

        return result

    def list_containers(self) -> List[ContainerInfo]:
        """
        List all managed containers with their current state.

        Returns:
            List of ContainerInfo for all containers

        Example:
            >>> for info in manager.list_containers():
            ...     print(f"{info.name}: {info.state.value}")
            ...     if info.resources:
            ...         print(f"  VNC: :{info.resources.vnc_port - 5900}")
        """
        return list(self._containers.values())

    def get_container(self, name: str) -> Optional[ContainerInfo]:
        """
        Get information about a specific container.

        Args:
            name: Container name

        Returns:
            ContainerInfo if found, None otherwise
        """
        return self._containers.get(name)

    def stop(self, name: str) -> bool:
        """
        Stop a specific container.

        Args:
            name: Container name

        Returns:
            True if stopped successfully, False if not found or error
        """
        info = self._containers.get(name)
        if not info:
            logger.warning(f"Container not found: {name}")
            return False

        bridge = self._bridges.get(name)
        if bridge:
            try:
                logger.info(f"Stopping container: {name}")
                bridge.stop()

                # Release resources
                if info.resources:
                    self._allocator.release(info.resources)

                info.state = ContainerState.STOPPED
                del self._bridges[name]
                logger.info(f"Container {name} stopped")
                return True

            except Exception as e:
                logger.error(f"Error stopping {name}: {e}")
                info.error_message = str(e)
                return False
        else:
            info.state = ContainerState.STOPPED
            return True

    def stop_all(self) -> Dict[str, bool]:
        """
        Stop all running containers.

        Returns:
            Dict mapping container names to stop success status

        Example:
            >>> results = manager.stop_all()
            >>> for name, success in results.items():
            ...     status = "stopped" if success else "failed"
            ...     print(f"{name}: {status}")
        """
        logger.info(f"Stopping all containers ({len(self._bridges)} running)")
        results = {}

        for name in list(self._bridges.keys()):
            results[name] = self.stop(name)

        return results

    def get_running_count(self) -> int:
        """
        Get the number of currently running containers.

        Returns:
            Number of containers in RUNNING state
        """
        return sum(
            1 for c in self._containers.values()
            if c.state == ContainerState.RUNNING
        )

    def clear_stopped(self) -> int:
        """
        Remove stopped containers from tracking.

        Returns:
            Number of containers removed
        """
        stopped_names = [
            name for name, info in self._containers.items()
            if info.state == ContainerState.STOPPED
        ]

        for name in stopped_names:
            del self._containers[name]

        if stopped_names:
            logger.info(f"Cleared {len(stopped_names)} stopped containers")

        return len(stopped_names)

    def __repr__(self) -> str:
        """String representation."""
        running = self.get_running_count()
        total = len(self._containers)
        return f"MultiBootManager(running={running}, total={total})"
