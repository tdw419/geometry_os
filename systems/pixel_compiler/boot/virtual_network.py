"""
VirtualNetwork - QEMU socket netdev configuration for inter-container communication.

This module provides networking configuration for QEMU containers using socket
networking with multicast, which works without root privileges or CAP_NET_ADMIN.

Key advantage: Multiple containers can communicate via multicast without any
special permissions - unlike TAP or bridge networking which require root.
"""

from dataclasses import dataclass, asdict
from typing import Optional, Dict, Any, List


@dataclass
class VirtualNetworkConfig:
    """Configuration for virtual networking via QEMU socket netdev."""

    mcast_addr: str = "230.0.0.1"
    """Multicast group address for container communication."""

    mcast_port: int = 1234
    """UDP port for multicast communication."""

    enabled: bool = True
    """Whether virtual networking is enabled."""


class NetworkSetupError(Exception):
    """Raised when network setup fails."""
    pass


class VirtualNetwork:
    """
    Manages QEMU socket netdev configuration for inter-container communication.

    Uses QEMU socket networking with multicast to enable containers to communicate
    without requiring root privileges or CAP_NET_ADMIN.

    Example:
        >>> config = VirtualNetworkConfig(mcast_addr="230.0.0.1", mcast_port=1234)
        >>> vn = VirtualNetwork(config)
        >>> args = vn.build_netdev_args("net0")
        >>> # args = ["-netdev", "socket,id=net0,mcast=230.0.0.1:1234",
        >>> #         "-device", "virtio-net-pci,netdev=net0"]
    """

    def __init__(self, config: Optional[VirtualNetworkConfig] = None):
        """
        Initialize VirtualNetwork with optional configuration.

        Args:
            config: Network configuration. Uses defaults if not provided.
        """
        self.config = config or VirtualNetworkConfig()

    def build_netdev_args(self, device_id: str = "net0") -> List[str]:
        """
        Build QEMU arguments for socket netdev with multicast.

        Args:
            device_id: Unique identifier for the network device.

        Returns:
            List of QEMU command-line arguments for socket networking.
            Returns empty list if networking is disabled.

        Example:
            >>> vn = VirtualNetwork()
            >>> vn.build_netdev_args("net0")
            ['-netdev', 'socket,id=net0,mcast=230.0.0.1:1234',
             '-device', 'virtio-net-pci,netdev=net0']
        """
        if not self.config.enabled:
            return []

        mcast_spec = f"{self.config.mcast_addr}:{self.config.mcast_port}"

        return [
            "-netdev", f"socket,id={device_id},mcast={mcast_spec}",
            "-device", f"virtio-net-pci,netdev={device_id}"
        ]

    def is_available(self) -> bool:
        """
        Check if socket networking is available.

        Socket networking is always available without root privileges,
        unlike TAP or bridge networking which require CAP_NET_ADMIN.

        Returns:
            Always True for socket networking.
        """
        return True

    def get_network_info(self) -> Dict[str, Any]:
        """
        Get network configuration as a dictionary.

        Returns:
            Dictionary containing network configuration for status display.
        """
        return asdict(self.config)
