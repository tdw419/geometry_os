"""
Resource Allocator for Multi-Boot Infrastructure

Provides unique VNC port and socket path allocation for multiple containers
booting simultaneously. Ensures no resource conflicts when running multiple
PixelRTS containers in parallel.

Key Features:
    - VNC port allocation from range 5900-5999 (100 ports)
    - Unique socket path generation for serial and monitor
    - Thread-safe allocation with lock protection
    - Deterministic allocation based on container name
    - Resource release and reuse tracking

Usage:
    allocator = ResourceAllocator()

    # Allocate resources for a container
    resources = allocator.allocate("alpine.rts.png")
    print(f"VNC port: {resources.vnc_port}")
    print(f"Serial socket: {resources.serial_socket}")

    # Release when done
    allocator.release(resources)

Thread Safety:
    All allocation operations are protected by threading.Lock for
    safe concurrent access from multiple threads.
"""

import threading
import uuid
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional, Dict, Set


class ResourceExhaustedError(Exception):
    """Raised when no more VNC ports are available in the range."""
    pass


class InvalidNameError(Exception):
    """Raised when an invalid container name is provided."""
    pass


@dataclass
class AllocatedResources:
    """
    Container for allocated boot resources.

    Attributes:
        vnc_port: VNC display port (5900-5999 range)
        serial_socket: Path to serial console socket
        monitor_socket: Path to QEMU monitor socket
        container_id: Unique identifier for the container
        container_name: Original name provided during allocation
    """
    vnc_port: int
    serial_socket: Path
    monitor_socket: Path
    container_id: str
    container_name: str

    def to_dict(self) -> dict:
        """Convert to dictionary for serialization."""
        return {
            "vnc_port": self.vnc_port,
            "serial_socket": str(self.serial_socket),
            "monitor_socket": str(self.monitor_socket),
            "container_id": self.container_id,
            "container_name": self.container_name,
        }


class ResourceAllocator:
    """
    Allocates unique VNC ports and socket paths for PixelRTS containers.

    Ensures that multiple containers can boot simultaneously without
    resource conflicts. Uses a simple counter-based allocation with
    release tracking for port reuse.

    VNC Port Allocation:
        - Range: 5900-5999 (100 ports, supporting up to 100 containers)
        - Allocation: First-come-first-served from available ports
        - Release: Ports return to pool for reuse

    Socket Path Allocation:
        - Pattern: /tmp/pixelrts-{container_id}.sock
        - Unique per container via UUID-based ID

    Example:
        >>> allocator = ResourceAllocator()
        >>> r1 = allocator.allocate("alpine.rts.png")
        >>> r2 = allocator.allocate("ubuntu.rts.png")
        >>> assert r1.vnc_port != r2.vnc_port
        >>> allocator.release(r1)
        >>> r3 = allocator.allocate("debian.rts.png")  # May reuse r1's port
    """

    # VNC port range: 5900-5999 (display :0 through :99)
    VNC_PORT_START = 5900
    VNC_PORT_END = 5999
    VNC_PORT_RANGE = VNC_PORT_END - VNC_PORT_START + 1  # 100 ports

    # Socket path prefix
    SOCKET_PREFIX = "/tmp/pixelrts"

    def __init__(self):
        """Initialize the resource allocator."""
        self._lock = threading.Lock()
        self._allocated_ports: Set[int] = set()
        self._released_ports: Set[int] = set()
        self._next_port = self.VNC_PORT_START
        self._name_to_resources: Dict[str, AllocatedResources] = {}

    def _validate_name(self, name: str) -> None:
        """
        Validate container name.

        Args:
            name: Container name to validate

        Raises:
            InvalidNameError: If name is invalid
        """
        if not name:
            raise InvalidNameError("Container name cannot be empty")

        if not isinstance(name, str):
            raise InvalidNameError(f"Container name must be a string, got {type(name)}")

        # Allow alphanumeric, dots, dashes, underscores
        if not re.match(r'^[\w\-.]+$', name):
            raise InvalidNameError(
                f"Invalid container name '{name}': "
                "must contain only alphanumeric, dots, dashes, underscores"
            )

    def _generate_container_id(self, name: str) -> str:
        """
        Generate a unique container ID from name.

        Uses UUID5 for deterministic ID generation from name.

        Args:
            name: Container name

        Returns:
            Unique container ID string
        """
        # Use UUID5 for deterministic ID based on name
        namespace = uuid.UUID('6ba7b810-9dad-11d1-80b4-00c04fd430c8')  # DNS namespace
        container_uuid = uuid.uuid5(namespace, name)
        return str(container_uuid)[:8]  # Short ID for readability

    def _allocate_port(self) -> int:
        """
        Allocate the next available VNC port.

        Returns:
            Available VNC port number

        Raises:
            ResourceExhaustedError: If no ports available
        """
        # Try to reuse released ports first
        if self._released_ports:
            port = self._released_ports.pop()
            self._allocated_ports.add(port)
            return port

        # Allocate from sequential range
        if self._next_port > self.VNC_PORT_END:
            raise ResourceExhaustedError(
                f"No VNC ports available (range {self.VNC_PORT_START}-{self.VNC_PORT_END} exhausted). "
                f"Currently allocated: {len(self._allocated_ports)} ports."
            )

        port = self._next_port
        self._next_port += 1
        self._allocated_ports.add(port)
        return port

    def allocate(self, name: str) -> AllocatedResources:
        """
        Allocate resources for a container.

        Args:
            name: Container name (e.g., "alpine.rts.png")

        Returns:
            AllocatedResources with unique VNC port and socket paths

        Raises:
            InvalidNameError: If name is invalid
            ResourceExhaustedError: If no ports available

        Example:
            >>> allocator = ResourceAllocator()
            >>> resources = allocator.allocate("mycontainer.rts.png")
            >>> print(resources.vnc_port)  # 5900+
        """
        self._validate_name(name)

        with self._lock:
            # Check if already allocated
            if name in self._name_to_resources:
                return self._name_to_resources[name]

            # Generate container ID
            container_id = self._generate_container_id(name)

            # Allocate VNC port
            vnc_port = self._allocate_port()

            # Create socket paths
            serial_socket = Path(f"{self.SOCKET_PREFIX}-{container_id}-serial.sock")
            monitor_socket = Path(f"{self.SOCKET_PREFIX}-{container_id}-monitor.sock")

            # Create resource object
            resources = AllocatedResources(
                vnc_port=vnc_port,
                serial_socket=serial_socket,
                monitor_socket=monitor_socket,
                container_id=container_id,
                container_name=name,
            )

            # Track allocation
            self._name_to_resources[name] = resources

            return resources

    def release(self, resources: AllocatedResources) -> None:
        """
        Release allocated resources for reuse.

        Args:
            resources: Previously allocated resources to release

        Example:
            >>> allocator = ResourceAllocator()
            >>> resources = allocator.allocate("test.rts.png")
            >>> allocator.release(resources)
            >>> # Port is now available for reuse
        """
        with self._lock:
            # Remove from tracking
            if resources.container_name in self._name_to_resources:
                del self._name_to_resources[resources.container_name]

            # Mark port as released
            if resources.vnc_port in self._allocated_ports:
                self._allocated_ports.remove(resources.vnc_port)
                self._released_ports.add(resources.vnc_port)

    def get_allocated_count(self) -> int:
        """
        Get the number of currently allocated ports.

        Returns:
            Number of allocated VNC ports
        """
        with self._lock:
            return len(self._allocated_ports)

    def get_available_count(self) -> int:
        """
        Get the number of available VNC ports.

        Returns:
            Number of available VNC ports in range
        """
        with self._lock:
            total_available = self.VNC_PORT_RANGE - len(self._allocated_ports)
            return max(0, total_available)

    def clear_all(self) -> None:
        """
        Clear all allocations and reset to initial state.

        Useful for testing or complete reset.
        """
        with self._lock:
            self._allocated_ports.clear()
            self._released_ports.clear()
            self._name_to_resources.clear()
            self._next_port = self.VNC_PORT_START
