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
import json
import logging
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional, Dict, List, Union, Any

from .boot_bridge import BootBridge, BootResult
from .ephemeral_boot import EphemeralBooter
from .resource_allocator import (
    ResourceAllocator,
    AllocatedResources,
    ResourceExhaustedError,
    InvalidNameError,
)
from .virtual_network import (
    VirtualNetwork,
    VirtualNetworkConfig,
    NetworkSetupError,
)
from .vm_snapshot import VMSnapshotManager, VMSnapshotMetadata, SnapshotResult, SnapshotInfo, SnapshotError, RestoreProgress
from .snapshot_storage import SnapshotStorage, SnapshotMetadata
from systems.pixel_compiler.integration.qemu_boot import NetworkMode

# Default state file path
DEFAULT_STATE_FILE = Path("/tmp/pixelrts/containers.json")

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


class ContainerRole(Enum):
    """
    Role of a container in multi-boot operations.

    Roles:
        PRIMARY: Primary container (starts first, stops last)
        HELPER: Helper container (starts after primary, stops before primary)
    """
    PRIMARY = "primary"
    HELPER = "helper"


@dataclass
class ContainerInfo:
    """
    Information about a booted container.

    Attributes:
        name: Container name (derived from .rts.png filename)
        path: Path to the .rts.png file
        state: Current lifecycle state
        role: Container role (PRIMARY or HELPER)
        resources: Allocated resources (VNC port, sockets)
        boot_result: BootResult from BootBridge (if booted)
        error_message: Error description if state is ERROR
        network_fallback: True if virtual network failed and fell back to USER mode
        snapshots: List of snapshot metadata for this container
    """
    name: str
    path: Path
    state: ContainerState = ContainerState.IDLE
    role: 'ContainerRole' = None
    resources: Optional[AllocatedResources] = None
    boot_result: Optional[BootResult] = None
    error_message: Optional[str] = None
    network_fallback: bool = False
    snapshots: List[VMSnapshotMetadata] = field(default_factory=list)
    is_ephemeral: bool = False  # True if booted with --ephemeral flag

    def __post_init__(self):
        """Set default role after initialization."""
        if self.role is None:
            self.role = ContainerRole.HELPER

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "name": self.name,
            "path": str(self.path),
            "state": self.state.value,
            "role": self.role.value,
            "vnc_port": self.resources.vnc_port if self.resources else None,
            "container_id": self.resources.container_id if self.resources else None,
            "serial_socket": str(self.resources.serial_socket) if self.resources else None,
            "monitor_socket": str(self.resources.monitor_socket) if self.resources else None,
            "pid": self.boot_result.pid if self.boot_result else None,
            "error_message": self.error_message,
            "network_fallback": self.network_fallback,
            "snapshots": [s.to_dict() for s in self.snapshots],
            "is_ephemeral": self.is_ephemeral,
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
        cleanup_performed: Whether cleanup was performed on partial failure
    """
    success: bool
    containers: List[ContainerInfo] = field(default_factory=list)
    success_count: int = 0
    failure_count: int = 0
    error_messages: List[str] = field(default_factory=list)
    cleanup_performed: bool = False

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "success": self.success,
            "success_count": self.success_count,
            "failure_count": self.failure_count,
            "containers": [c.to_dict() for c in self.containers],
            "error_messages": self.error_messages,
            "cleanup_performed": self.cleanup_performed,
        }


@dataclass
class RestoreResult:
    """
    Result of a container restore operation.

    Attributes:
        success: Whether the restore succeeded
        container_name: Name of the container
        snapshot_tag: Tag of the restored snapshot
        identity_preserved: Whether container identity (name, ports) was preserved
        network_reconnected: Whether network was re-established (None if not applicable)
        pre_restore_state: Container state before restore
        post_restore_state: Container state after restore
        error_message: Error description if restore failed
        restore_progress: Detailed progress from VMSnapshotManager
    """
    success: bool
    container_name: str
    snapshot_tag: str
    identity_preserved: bool = True
    network_reconnected: Optional[bool] = None
    pre_restore_state: Optional[ContainerState] = None
    post_restore_state: Optional[ContainerState] = None
    error_message: Optional[str] = None
    restore_progress: Optional[Any] = None  # RestoreProgress from vm_snapshot

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary for serialization."""
        return {
            "success": self.success,
            "container_name": self.container_name,
            "snapshot_tag": self.snapshot_tag,
            "identity_preserved": self.identity_preserved,
            "network_reconnected": self.network_reconnected,
            "pre_restore_state": self.pre_restore_state.value if self.pre_restore_state else None,
            "post_restore_state": self.post_restore_state.value if self.post_restore_state else None,
            "error_message": self.error_message,
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

    def __init__(
        self,
        resource_allocator: Optional[ResourceAllocator] = None,
        state_file: Optional[Union[str, Path]] = None,
    ):
        """
        Initialize MultiBootManager.

        Args:
            resource_allocator: Optional custom ResourceAllocator instance.
                               If not provided, a new one is created.
            state_file: Optional path to state file for persistence.
                       If not provided, uses /tmp/pixelrts/containers.json.
        """
        self._allocator = resource_allocator or ResourceAllocator()
        self._containers: Dict[str, ContainerInfo] = {}
        self._bridges: Dict[str, BootBridge] = {}
        self._lock = asyncio.Lock()
        self._state_file = Path(state_file) if state_file else DEFAULT_STATE_FILE
        self._snapshot_storage = SnapshotStorage()

        # Load existing state from file
        self._load_state()

    def _load_state(self) -> None:
        """
        Load container state from state file.

        Reads container information from the state file and populates
        the _containers dict. This allows CLI commands to query
        containers booted by other processes.
        """
        if not self._state_file.exists():
            logger.debug(f"State file {self._state_file} does not exist, starting fresh")
            return

        try:
            with open(self._state_file, 'r') as f:
                containers_data = json.load(f)

            for data in containers_data:
                name = data.get('name')
                if not name:
                    continue

                # Create ContainerInfo from dict
                info = ContainerInfo(
                    name=name,
                    path=Path(data.get('path', '')),
                    state=ContainerState(data.get('state', 'idle')),
                    role=ContainerRole(data.get('role')) if data.get('role') else None,
                    error_message=data.get('error_message'),
                    network_fallback=data.get('network_fallback', False),
                    is_ephemeral=data.get('is_ephemeral', False),
                )

                # Reconstruct resources if present
                if data.get('vnc_port'):
                    info.resources = AllocatedResources(
                        vnc_port=data['vnc_port'],
                        container_id=data.get('container_id', name),
                        serial_socket=Path(data['serial_socket']) if data.get('serial_socket') else None,
                        monitor_socket=Path(data['monitor_socket']) if data.get('monitor_socket') else None,
                    )

                # Load snapshots if present
                if data.get('snapshots'):
                    from .vm_snapshot import VMSnapshotMetadata
                    for snap_data in data['snapshots']:
                        try:
                            info.snapshots.append(VMSnapshotMetadata.from_dict(snap_data))
                        except Exception as e:
                            logger.warning(f"Failed to load snapshot metadata: {e}")

                self._containers[name] = info

            logger.debug(f"Loaded state for {len(self._containers)} containers from {self._state_file}")
        except Exception as e:
            logger.warning(f"Failed to load state file: {e}")

    def _save_state(self) -> None:
        """
        Save container state to state file.

        Writes all container information to the state file as JSON,
        enabling external tools like `pixelrts ps` to query container state.
        """
        try:
            # Ensure parent directory exists
            self._state_file.parent.mkdir(parents=True, exist_ok=True)

            # Convert containers to list of dicts
            containers_data = [c.to_dict() for c in self._containers.values()]

            # Write to file
            with open(self._state_file, 'w') as f:
                json.dump(containers_data, f, indent=2)

            logger.debug(f"Saved state for {len(containers_data)} containers to {self._state_file}")
        except Exception as e:
            logger.warning(f"Failed to save state file: {e}")

    @property
    def snapshot_storage(self) -> SnapshotStorage:
        """Get the snapshot storage instance."""
        return self._snapshot_storage

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
        is_primary: bool = False,
        network_mode: str = "user",
        socket_config: Optional[VirtualNetworkConfig] = None,
        ephemeral: bool = False,
    ) -> ContainerInfo:
        """
        Boot a single container.

        This is an internal async method used by boot_all.

        Args:
            path: Path to .rts.png file
            cmdline: Optional kernel command line
            memory: Memory allocation (default: "2G")
            cpus: Number of CPUs (default: 2)
            is_primary: Whether this container is the primary (default: False)
            network_mode: Network mode - "user" (isolated) or "socket_mcast" (mesh)
            socket_config: Optional VirtualNetworkConfig for socket networking
            ephemeral: Boot in ephemeral mode - changes discarded on stop (default: False)

        Returns:
            ContainerInfo with boot result
        """
        path = Path(path).resolve()
        name = self._get_container_name(path)

        async with self._lock:
            # Check if already exists
            if name in self._containers:
                return self._containers[name]

            # Create container info with role
            info = ContainerInfo(
                name=name,
                path=path,
                state=ContainerState.BOOTING,
                role=ContainerRole.PRIMARY if is_primary else ContainerRole.HELPER,
                is_ephemeral=ephemeral,
            )
            self._containers[name] = info

        try:
            # Allocate resources
            resources = self._allocator.allocate(name)
            info.resources = resources

            logger.info(f"Booting {name} with VNC port {resources.vnc_port}")

            # Determine network mode with graceful fallback
            bridge_network_mode = NetworkMode.USER  # Default to isolated USER mode
            bridge_socket_config = None

            if network_mode == "socket_mcast":
                try:
                    vn = VirtualNetwork(config=socket_config)
                    if vn.is_available():
                        bridge_network_mode = NetworkMode.SOCKET_MCAST
                        bridge_socket_config = socket_config or VirtualNetworkConfig()
                        logger.info(f"Virtual network enabled for {name} (SOCKET_MCAST)")
                    else:
                        logger.warning(f"Virtual network unavailable for {name}, falling back to USER mode")
                        info.network_fallback = True
                except NetworkSetupError as e:
                    logger.warning(f"Virtual network setup failed for {name}: {e}, falling back to USER mode")
                    info.network_fallback = True
                except Exception as e:
                    logger.warning(f"Unexpected error setting up virtual network for {name}: {e}, falling back to USER mode")
                    info.network_fallback = True

            # Create BootBridge with allocated VNC display
            # VNC display = port - 5900
            vnc_display = resources.vnc_port - 5900

            if ephemeral:
                # Use EphemeralBooter for ephemeral mode
                bridge = EphemeralBooter(
                    rts_png_path=path,
                    memory=memory,
                    cpus=cpus,
                    vnc_display=vnc_display,
                    verbose=False,
                    network_mode=bridge_network_mode,
                    socket_config=bridge_socket_config,
                )
                logger.info(f"Booting {name} in ephemeral mode")
            else:
                bridge = BootBridge(
                    rts_png_path=path,
                    memory=memory,
                    cpus=cpus,
                    vnc_display=vnc_display,
                    verbose=False,
                    network_mode=bridge_network_mode,
                    socket_config=bridge_socket_config,
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
                    # Release resources on boot failure
                    if info.resources:
                        self._allocator.release(info.resources)
                        info.resources = None

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
                # Release resources on unexpected error
                if info.resources:
                    self._allocator.release(info.resources)
                    info.resources = None
            logger.error(f"Unexpected error booting {name}: {e}")
            return info

    async def _wait_for_running(
        self,
        container_info: ContainerInfo,
        timeout: float = 30.0,
        poll_interval: float = 0.5,
    ) -> bool:
        """
        Wait for container to reach RUNNING state.

        Args:
            container_info: ContainerInfo to monitor
            timeout: Maximum time to wait in seconds (default: 30.0)
            poll_interval: Time between state checks in seconds (default: 0.5)

        Returns:
            True if container reached RUNNING, False on timeout or ERROR
        """
        start_time = asyncio.get_event_loop().time()
        while container_info.state != ContainerState.RUNNING:
            elapsed = asyncio.get_event_loop().time() - start_time
            if elapsed >= timeout:
                logger.warning(f"Timeout waiting for {container_info.name} to reach RUNNING")
                return False
            if container_info.state == ContainerState.ERROR:
                logger.error(f"Container {container_info.name} entered ERROR state")
                return False
            await asyncio.sleep(poll_interval)
        return True

    async def _boot_ordered(
        self,
        paths: List[Path],
        primary_name: str,
        cmdline: Optional[str],
        memory: str,
        cpus: int,
        primary_timeout: float = 30.0,
        progress_callback: Optional[callable] = None,
        network_mode: str = "user",
        socket_config: Optional[VirtualNetworkConfig] = None,
        ephemeral: bool = False,
    ) -> List[ContainerInfo]:
        """
        Boot containers in order: primary first, then helpers.

        This method ensures the primary container (e.g., database, service mesh)
        is fully running before helper containers start.

        Args:
            paths: List of paths to .rts.png files
            primary_name: Name of the primary container
            cmdline: Optional kernel command line
            memory: Memory allocation per container
            cpus: Number of CPUs per container
            primary_timeout: Timeout for primary to reach RUNNING (default: 30.0)
            progress_callback: Optional callback for progress updates.
                              Signature: callback(event_type: str, data: Any) -> None
                              Events: "primary_start", "primary_ready", "helpers_start", "helper_ready"
            network_mode: Network mode - "user" (isolated) or "socket_mcast" (mesh)
            socket_config: Optional VirtualNetworkConfig for socket networking
            ephemeral: Boot in ephemeral mode - changes discarded on stop (default: False)

        Returns:
            List of ContainerInfo for all containers
        """
        container_infos = []

        # Separate primary and helpers
        primary_path = None
        helper_paths = []

        for path in paths:
            name = self._get_container_name(path)
            if name == primary_name:
                primary_path = path
            else:
                helper_paths.append(path)

        # Boot primary first
        if primary_path:
            logger.info(f"Booting primary container: {primary_name}")
            if progress_callback:
                progress_callback("primary_start", primary_name)
            primary_info = await self._boot_single(
                primary_path, cmdline, memory, cpus, is_primary=True,
                network_mode=network_mode, socket_config=socket_config,
                ephemeral=ephemeral,
            )
            container_infos.append(primary_info)

            # Check if primary failed to boot
            if primary_info.state == ContainerState.ERROR:
                logger.error(f"Primary {primary_name} failed to boot, aborting helper boot")
                return container_infos

            # Wait for primary to be running
            logger.info(f"Waiting for primary {primary_name} to reach RUNNING state...")
            primary_ready = await self._wait_for_running(primary_info, timeout=primary_timeout)

            if not primary_ready:
                logger.error(f"Primary {primary_name} failed to start, aborting helper boot")
                return container_infos

            if progress_callback:
                progress_callback("primary_ready", primary_name)

        # Boot helpers concurrently
        if helper_paths:
            logger.info(f"Booting {len(helper_paths)} helper containers...")
            if progress_callback:
                progress_callback("helpers_start", [self._get_container_name(p) for p in helper_paths])
            helper_tasks = [
                self._boot_single(
                    path, cmdline, memory, cpus, is_primary=False,
                    network_mode=network_mode, socket_config=socket_config,
                    ephemeral=ephemeral,
                )
                for path in helper_paths
            ]
            helper_infos = await asyncio.gather(*helper_tasks)
            container_infos.extend(helper_infos)

            # Report each helper that completed
            if progress_callback:
                for info in helper_infos:
                    if info.state == ContainerState.RUNNING:
                        progress_callback("helper_ready", info.name)

        return container_infos

    def boot_all(
        self,
        paths: List[Union[str, Path]],
        cmdline: Optional[str] = None,
        memory: str = "2G",
        cpus: int = 2,
        cleanup_on_failure: bool = True,
        primary: Optional[str] = None,
        progress_callback: Optional[callable] = None,
        network_mode: str = "user",
        socket_config: Optional[VirtualNetworkConfig] = None,
        ephemeral: bool = False,
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
            cleanup_on_failure: Stop successful containers if any boot fails (default: True)
            primary: Name of the primary container (starts first, stops last)
            progress_callback: Optional callback for progress updates (only for ordered boot).
                              Signature: callback(event_type: str, data: Any) -> None
                              Events: "primary_start", "primary_ready", "helpers_start", "helper_ready"
            network_mode: Network mode - "user" (isolated) or "socket_mcast" (mesh, default: "user")
            socket_config: Optional VirtualNetworkConfig for socket networking
            ephemeral: Boot in ephemeral mode - changes discarded on stop (default: False)

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
            if primary:
                # Ordered Boot: primary first, then helpers
                return await self._boot_ordered(
                    paths=validated_paths,
                    primary_name=primary,
                    cmdline=cmdline,
                    memory=memory,
                    cpus=cpus,
                    progress_callback=progress_callback,
                    network_mode=network_mode,
                    socket_config=socket_config,
                    ephemeral=ephemeral,
                )
            else:
                # Concurrent Boot (existing behavior)
                tasks = [
                    self._boot_single(
                        path, cmdline, memory, cpus,
                        is_primary=False,
                        network_mode=network_mode,
                        socket_config=socket_config,
                        ephemeral=ephemeral,
                    )
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

        # Cleanup on partial failure (compensating transaction)
        cleanup_performed = False
        if failure_count > 0 and cleanup_on_failure and success_count > 0:
            logger.info(f"Partial failure detected, cleaning up {success_count} successful containers")
            cleaned = self._cleanup_successful_containers(container_infos)
            cleanup_performed = True
            logger.info(f"Cleaned up {cleaned} containers")
            # Recalculate success_count after cleanup
            success_count = sum(1 for c in container_infos if c.state == ContainerState.RUNNING)

        result = MultiBootResult(
            success=(failure_count == 0 and success_count > 0),
            containers=container_infos,
            success_count=success_count,
            failure_count=failure_count,
            error_messages=error_messages,
            cleanup_performed=cleanup_performed,
        )

        logger.info(
            f"Boot complete: {success_count} succeeded, {failure_count} failed"
        )

        # Save state to file
        self._save_state()

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

    def _get_snapshot_manager(self, name: str) -> Optional[VMSnapshotManager]:
        """
        Get VMSnapshotManager for a container.

        Args:
            name: Container name

        Returns:
            VMSnapshotManager if container has a running bridge, None otherwise
        """
        bridge = self._bridges.get(name)
        if not bridge:
            return None

        # Get the QemuBoot instance from the bridge (BootBridge stores it as _qemu)
        qemu_boot = getattr(bridge, '_qemu', None)
        if not qemu_boot:
            return None

        try:
            return VMSnapshotManager(qemu_boot, name)
        except ValueError:
            return None

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

                # Save state after successful stop
                self._save_state()
                return True

            except Exception as e:
                logger.error(f"Error stopping {name}: {e}")
                info.error_message = str(e)
                return False
        else:
            info.state = ContainerState.STOPPED
            # Save state even for already-stopped containers
            self._save_state()
            return True

    def _cleanup_successful_containers(self, container_infos: List[ContainerInfo]) -> int:
        """
        Stop and cleanup containers that booted successfully during a partial failure.

        This implements a compensating transaction pattern - when boot_all fails
        partway through, we need to clean up any containers that did start
        to avoid orphaned processes.

        Args:
            container_infos: List of ContainerInfo from the boot operation

        Returns:
            Number of containers that were successfully cleaned up
        """
        cleaned = 0
        for info in container_infos:
            if info.state == ContainerState.RUNNING:
                logger.info(f"Cleaning up container {info.name} due to partial boot failure")
                if self.stop(info.name):
                    cleaned += 1
                else:
                    logger.error(f"Failed to cleanup container {info.name}")
        return cleaned

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

    def stop_all_ordered(self) -> Dict[str, bool]:
        """
        Stop all containers in reverse boot order (helpers first, primary last).

        This ensures the primary container remains available until all
        helper containers have shut down cleanly.

        Returns:
            Dict mapping container names to stop success status

        Example:
            >>> results = manager.stop_all_ordered()
            >>> for name, success in results.items():
            ...     print(f"{name}: {'stopped' if success else 'failed'}")
        """
        logger.info(f"Stopping all containers in order ({len(self._bridges)} running)")

        # Separate primary and helpers
        primary_name = None
        helper_names = []

        for name, info in self._containers.items():
            if info.role == ContainerRole.PRIMARY and info.state == ContainerState.RUNNING:
                primary_name = name
            elif info.state == ContainerState.RUNNING:
                helper_names.append(name)

        results = {}

        # Stop helpers first (concurrently is fine)
        if helper_names:
            logger.info(f"Stopping {len(helper_names)} helper containers...")
            for name in helper_names:
                results[name] = self.stop(name)

        # Stop primary last
        if primary_name:
            logger.info(f"Stopping primary container: {primary_name}")
            results[primary_name] = self.stop(primary_name)

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
            # Save state after clearing
            self._save_state()

        return len(stopped_names)

    # ========================================
    # Snapshot Methods
    # ========================================

    def create_snapshot(
        self,
        name: str,
        tag: str,
        description: str = ""
    ) -> SnapshotResult:
        """
        Create a snapshot of a running container.

        Args:
            name: Container name
            tag: Snapshot tag (alphanumeric, dash, underscore only)
            description: Optional snapshot description

        Returns:
            SnapshotResult with success status and metadata

        Raises:
            ValueError: If container doesn't exist or isn't running
        """
        info = self._containers.get(name)
        if not info:
            raise ValueError(f"Container '{name}' does not exist")

        if info.state != ContainerState.RUNNING:
            raise ValueError(
                f"Container '{name}' is not running (state: {info.state.value})"
            )

        snapshot_manager = self._get_snapshot_manager(name)
        if not snapshot_manager:
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message="Could not get snapshot manager for container"
            )

        result = snapshot_manager.create_snapshot(tag, description=description)

        # Track successful snapshots
        if result.success and result.metadata:
            info.snapshots.append(result.metadata)
            self._save_state()

            # Persist metadata to storage
            try:
                stored_metadata = SnapshotMetadata.from_snapshot_info(
                    result.metadata, name, description
                )
                self._snapshot_storage.save_metadata(name, stored_metadata)
            except Exception as e:
                logger.warning(f"Failed to persist snapshot metadata: {e}")

        return result

    def list_container_snapshots(self, name: str) -> List[SnapshotInfo]:
        """
        List snapshots for a container.

        If the VM is running, returns live snapshots from VMSnapshotManager
        and updates stored metadata with live info.

        If the VM is not running, returns stored metadata from SnapshotStorage
        converted to SnapshotInfo-compatible format.

        Args:
            name: Container name

        Returns:
            List of SnapshotInfo objects (or compatible objects from storage)

        Raises:
            ValueError: If container doesn't exist
        """
        info = self._containers.get(name)
        if not info:
            raise ValueError(f"Container '{name}' does not exist")

        # If VM is running, get live snapshots and update storage
        if info.state == ContainerState.RUNNING:
            snapshot_manager = self._get_snapshot_manager(name)
            if not snapshot_manager:
                return []

            live_snapshots = snapshot_manager.list_snapshots()

            # Update stored metadata with live info
            for snap in live_snapshots:
                try:
                    stored_metadata = SnapshotMetadata.from_snapshot_info(snap, name)
                    self._snapshot_storage.save_metadata(name, stored_metadata)
                except Exception as e:
                    logger.warning(f"Failed to update stored metadata: {e}")

            return live_snapshots

        # VM is not running - return stored metadata
        stored_snapshots = self._snapshot_storage.list_snapshots(name)

        # Convert SnapshotMetadata to SnapshotInfo-compatible objects
        # We create simple objects with matching attributes
        converted = []
        for i, metadata in enumerate(stored_snapshots):
            # Create a SnapshotInfo-like object from metadata
            snap_info = SnapshotInfo(
                id=i,  # Use index as ID for stored snapshots
                tag=metadata.tag,
                date=metadata.created_at,
                size=metadata.size,
                vm_clock=metadata.vm_clock or "0"
            )
            converted.append(snap_info)

        return converted

    def restore_snapshot(self, name: str, tag: str) -> RestoreResult:
        """
        Restore a container to a snapshot with identity preservation.

        Args:
            name: Container name
            tag: Snapshot tag to restore

        Returns:
            RestoreResult with success status, identity preservation status,
            and network reconnection tracking

        Raises:
            ValueError: If container doesn't exist or isn't running
        """
        info = self._containers.get(name)
        if not info:
            raise ValueError(f"Container '{name}' does not exist")

        if info.state != ContainerState.RUNNING:
            raise ValueError(
                f"Container '{name}' is not running (state: {info.state.value})"
            )

        # Store pre-restore state for identity verification
        pre_restore_state = info.state
        pre_restore_name = info.name
        pre_restore_vnc_port = info.resources.vnc_port if info.resources else None

        snapshot_manager = self._get_snapshot_manager(name)
        if not snapshot_manager:
            return RestoreResult(
                success=False,
                container_name=name,
                snapshot_tag=tag,
                identity_preserved=False,
                pre_restore_state=pre_restore_state,
                post_restore_state=info.state,
                error_message="Could not get snapshot manager for container"
            )

        # Perform restore via VMSnapshotManager
        result = snapshot_manager.restore_snapshot(tag)

        # Determine identity preservation (name and VNC port unchanged)
        post_restore_name = info.name
        post_restore_vnc_port = info.resources.vnc_port if info.resources else None

        identity_preserved = (
            post_restore_name == pre_restore_name and
            post_restore_vnc_port == pre_restore_vnc_port
        )

        # Determine network reconnection status
        # None if using fallback, True/False if using virtual network
        if info.network_fallback:
            network_reconnected = None
        else:
            network_reconnected = result.success

        # Post-restore state is still RUNNING (QEMU process is alive even on restore failure)
        post_restore_state = ContainerState.RUNNING

        return RestoreResult(
            success=result.success,
            container_name=name,
            snapshot_tag=tag,
            identity_preserved=identity_preserved,
            network_reconnected=network_reconnected,
            pre_restore_state=pre_restore_state,
            post_restore_state=post_restore_state,
            error_message=result.error_message,
            restore_progress=result.restore_progress
        )

    def delete_snapshot(self, name: str, tag: str) -> SnapshotResult:
        """
        Delete a snapshot from a container.

        Tries to delete from VM if running, and always deletes from storage.
        Considers success if either VM deletion or storage deletion succeeded.

        Args:
            name: Container name
            tag: Snapshot tag to delete

        Returns:
            SnapshotResult with success status

        Raises:
            ValueError: If container doesn't exist
        """
        info = self._containers.get(name)
        if not info:
            raise ValueError(f"Container '{name}' does not exist")

        vm_delete_success = False
        vm_error_message = None

        # Try to delete from VM if running
        if info.state == ContainerState.RUNNING:
            snapshot_manager = self._get_snapshot_manager(name)
            if snapshot_manager:
                vm_result = snapshot_manager.delete_snapshot(tag)
                vm_delete_success = vm_result.success
                vm_error_message = vm_result.error_message

        # Always delete from storage
        storage_delete_success = self._snapshot_storage.delete_metadata(name, tag)

        # Update ContainerInfo.snapshots list
        if storage_delete_success:
            info.snapshots = [s for s in info.snapshots if s.tag != tag]
            self._save_state()

        # Success if either VM or storage deletion succeeded
        overall_success = vm_delete_success or storage_delete_success

        if overall_success:
            return SnapshotResult(success=True, tag=tag)
        else:
            return SnapshotResult(
                success=False,
                tag=tag,
                error_message=vm_error_message or f"Snapshot '{tag}' not found in storage"
            )

    def __repr__(self) -> str:
        """String representation."""
        running = self.get_running_count()
        total = len(self._containers)
        return f"MultiBootManager(running={running}, total={total})"
