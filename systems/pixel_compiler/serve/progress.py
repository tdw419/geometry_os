"""
Rich Progress Display for Network Boot

Provides real-time visual feedback for the PixelRTS network boot server,
showing server configuration, connected clients, and transfer progress.

Key Features:
    - Server configuration panel
    - Active clients table with boot stages
    - Transfer statistics
    - Log messages panel

Usage:
    progress = ServeProgress()
    progress.start_display()
    progress.update_config("eth0", "192.168.1.100", [4011, 69, 10809])
    progress.add_client("192.168.1.50", "aa:bb:cc:dd:ee:ff")
    progress.update_client_stage("192.168.1.50", "TFTP", 50)
    progress.stop_display()
"""

import asyncio
import logging
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Optional, Dict, List, Any
from pathlib import Path

logger = logging.getLogger(__name__)

# Rich availability check
try:
    from rich.console import Console
    from rich.table import Table
    from rich.panel import Panel
    from rich.progress import Progress, SpinnerColumn, TextColumn, BarColumn
    from rich.live import Live
    from rich.layout import Layout
    from rich.text import Text
    HAS_RICH = True
except ImportError:
    HAS_RICH = False
    logger.warning("Rich library not available. Progress display disabled.")


class BootStage(Enum):
    """Client boot stages."""
    DHCP = "DHCP"
    TFTP = "TFTP"
    NBD = "NBD"
    KERNEL = "KERNEL"
    COMPLETE = "COMPLETE"
    FAILED = "FAILED"


@dataclass
class ClientInfo:
    """Information about a connected client."""
    ip: str
    mac: str
    stage: BootStage = BootStage.DHCP
    progress: int = 0  # 0-100
    bytes_transferred: int = 0
    start_time: datetime = field(default_factory=datetime.now)
    last_update: datetime = field(default_factory=datetime.now)
    error: Optional[str] = None

    @property
    def status(self) -> str:
        """Get human-readable status."""
        if self.error:
            return f"Error: {self.error}"
        if self.stage == BootStage.COMPLETE:
            return "Boot complete"
        if self.stage == BootStage.FAILED:
            return "Boot failed"
        return f"{self.stage.value} ({self.progress}%)"


class ClientTracker:
    """
    Tracks connected clients and their boot progress.

    Example:
        tracker = ClientTracker()
        tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")
        tracker.update_stage("192.168.1.50", BootStage.TFTP, 25)
        tracker.update_stage("192.168.1.50", BootStage.COMPLETE, 100)
    """

    def __init__(self, max_history: int = 100):
        """
        Initialize client tracker.

        Args:
            max_history: Maximum number of completed clients to keep
        """
        self._clients: Dict[str, ClientInfo] = {}
        self._history: List[ClientInfo] = []
        self._max_history = max_history

    def add(self, ip: str, mac: str) -> ClientInfo:
        """
        Add a new client to the tracker.

        Args:
            ip: Client IP address
            mac: Client MAC address

        Returns:
            ClientInfo for the new client
        """
        client = ClientInfo(ip=ip, mac=mac)
        self._clients[ip] = client
        logger.info(f"New client: {ip} ({mac})")
        return client

    def update_stage(
        self,
        ip: str,
        stage: BootStage,
        progress: int = 0,
        bytes_transferred: int = 0
    ) -> Optional[ClientInfo]:
        """
        Update client boot stage.

        Args:
            ip: Client IP address
            stage: New boot stage
            progress: Progress percentage (0-100)
            bytes_transferred: Total bytes transferred

        Returns:
            Updated ClientInfo or None if client not found
        """
        client = self._clients.get(ip)
        if not client:
            logger.warning(f"Unknown client: {ip}")
            return None

        client.stage = stage
        client.progress = min(100, max(0, progress))
        client.bytes_transferred = bytes_transferred
        client.last_update = datetime.now()

        logger.debug(f"Client {ip}: {stage.value} ({progress}%)")

        # Move to history if complete or failed
        if stage in (BootStage.COMPLETE, BootStage.FAILED):
            self._move_to_history(ip)

        return client

    def set_error(self, ip: str, error: str) -> Optional[ClientInfo]:
        """
        Set client error status.

        Args:
            ip: Client IP address
            error: Error message

        Returns:
            Updated ClientInfo or None if client not found
        """
        client = self._clients.get(ip)
        if client:
            client.error = error
            client.stage = BootStage.FAILED
            client.last_update = datetime.now()
            logger.error(f"Client {ip} error: {error}")
            self._move_to_history(ip)
        return client

    def remove(self, ip: str) -> Optional[ClientInfo]:
        """
        Remove a client from active tracking.

        Args:
            ip: Client IP address

        Returns:
            Removed ClientInfo or None if not found
        """
        return self._clients.pop(ip, None)

    def get(self, ip: str) -> Optional[ClientInfo]:
        """Get client info by IP."""
        return self._clients.get(ip)

    def get_all(self) -> List[ClientInfo]:
        """Get all active clients."""
        return list(self._clients.values())

    def get_history(self) -> List[ClientInfo]:
        """Get completed/failed client history."""
        return self._history.copy()

    def get_stats(self) -> Dict[str, Any]:
        """Get aggregate statistics."""
        clients = list(self._clients.values()) + self._history
        return {
            'total_clients': len(clients),
            'active_clients': len(self._clients),
            'completed': sum(1 for c in clients if c.stage == BootStage.COMPLETE),
            'failed': sum(1 for c in clients if c.stage == BootStage.FAILED),
            'total_bytes': sum(c.bytes_transferred for c in clients),
        }

    def _move_to_history(self, ip: str) -> None:
        """Move client from active to history."""
        client = self._clients.pop(ip, None)
        if client:
            self._history.append(client)
            # Trim history if needed
            if len(self._history) > self._max_history:
                self._history = self._history[-self._max_history:]


class ServeProgress:
    """
    Rich-based progress display for network boot server.

    Displays:
    - Server configuration panel (interface, IP, ports)
    - Active clients table with columns: IP, MAC, Stage, Progress, Status
    - Transfer statistics (total bytes, current rate)
    - Log messages panel for errors/info

    Example:
        progress = ServeProgress()
        progress.start_display()
        progress.update_config("eth0", "192.168.1.100", [4011, 69, 10809])
        # ... handle clients ...
        progress.stop_display()
    """

    def __init__(self, verbose: bool = False):
        """
        Initialize progress display.

        Args:
            verbose: Enable verbose output
        """
        self.verbose = verbose
        self.tracker = ClientTracker()
        self._console: Optional[Any] = None
        self._live: Optional[Any] = None
        self._running = False

        # Server config
        self._interface = ""
        self._ip_address = ""
        self._ports: List[int] = []

        # Log messages
        self._logs: List[str] = []
        self._max_logs = 10

    def start_display(self) -> None:
        """Initialize and start the Rich display."""
        if not HAS_RICH:
            logger.warning("Rich not available, using basic output")
            return

        self._console = Console()
        self._running = True
        logger.info("Progress display started")

    def stop_display(self) -> None:
        """Stop and clean up the display."""
        self._running = False
        if self._live:
            self._live.stop()
            self._live = None
        logger.info("Progress display stopped")

    def update_config(
        self,
        interface: str,
        ip: str,
        ports: List[int]
    ) -> None:
        """
        Update server configuration display.

        Args:
            interface: Network interface name
            ip: Server IP address
            ports: List of service ports
        """
        self._interface = interface
        self._ip_address = ip
        self._ports = ports

        if self._console:
            self._console.print(self._build_config_panel())

    def add_client(self, ip: str, mac: str) -> None:
        """
        Add a new client to the display.

        Args:
            ip: Client IP address
            mac: Client MAC address
        """
        self.tracker.add(ip, mac)
        self.log_message(f"Client connected: {ip}", "info")
        self._refresh()

    def update_client_stage(
        self,
        ip: str,
        stage: str,
        progress: int = 0,
        bytes_transferred: int = 0
    ) -> None:
        """
        Update client boot stage.

        Args:
            ip: Client IP address
            stage: Boot stage name (DHCP, TFTP, NBD, KERNEL, COMPLETE, FAILED)
            progress: Progress percentage (0-100)
            bytes_transferred: Total bytes transferred
        """
        try:
            boot_stage = BootStage(stage.upper())
        except ValueError:
            boot_stage = BootStage.DHCP

        client = self.tracker.update_stage(ip, boot_stage, progress, bytes_transferred)
        if client and boot_stage == BootStage.COMPLETE:
            self.log_message(f"Client boot complete: {ip}", "info")
        self._refresh()

    def remove_client(self, ip: str) -> None:
        """
        Remove a client from the display.

        Args:
            ip: Client IP address
        """
        self.tracker.remove(ip)
        self.log_message(f"Client disconnected: {ip}", "info")
        self._refresh()

    def log_message(self, message: str, level: str = "info") -> None:
        """
        Add a log message to the display.

        Args:
            message: Log message
            level: Log level (info, warning, error)
        """
        timestamp = datetime.now().strftime("%H:%M:%S")
        log_entry = f"[{timestamp}] [{level.upper()}] {message}"
        self._logs.append(log_entry)

        # Trim logs
        if len(self._logs) > self._max_logs:
            self._logs = self._logs[-self._max_logs:]

        if self._console and not self._live:
            # If not in live mode, print directly
            self._console.print(log_entry)

    def _refresh(self) -> None:
        """Refresh the display."""
        if not self._running or not self._console:
            return

        if self._live:
            # Live mode handles refresh automatically
            pass

    def _build_config_panel(self) -> Any:
        """Build server configuration panel."""
        if not HAS_RICH:
            return None

        content = Text()
        content.append(f"Interface: {self._interface}\n")
        content.append(f"IP Address: {self._ip_address}\n")
        content.append(f"Ports: DHCP={self._ports[0] if len(self._ports) > 0 else '?'}, ")
        content.append(f"TFTP={self._ports[1] if len(self._ports) > 1 else '?'}, ")
        content.append(f"NBD={self._ports[2] if len(self._ports) > 2 else '?'}")

        return Panel(content, title="Server Configuration", border_style="blue")

    def _build_clients_table(self) -> Any:
        """Build clients table."""
        if not HAS_RICH:
            return None

        table = Table(title="Connected Clients")
        table.add_column("IP", style="cyan")
        table.add_column("MAC", style="dim")
        table.add_column("Stage", style="yellow")
        table.add_column("Progress", style="green")
        table.add_column("Status")

        for client in self.tracker.get_all():
            progress_bar = self._make_progress_bar(client.progress)
            table.add_row(
                client.ip,
                client.mac,
                client.stage.value,
                progress_bar,
                client.status
            )

        return table

    def _build_stats_panel(self) -> Any:
        """Build statistics panel."""
        if not HAS_RICH:
            return None

        stats = self.tracker.get_stats()
        content = Text()
        content.append(f"Active: {stats['active_clients']}  ")
        content.append(f"Completed: {stats['completed']}  ")
        content.append(f"Failed: {stats['failed']}  ")
        content.append(f"Transferred: {self._format_bytes(stats['total_bytes'])}")

        return Panel(content, title="Statistics", border_style="green")

    def _build_logs_panel(self) -> Any:
        """Build log messages panel."""
        if not HAS_RICH:
            return None

        content = Text()
        for log in self._logs[-5:]:  # Show last 5 logs
            content.append(log + "\n")

        return Panel(content, title="Recent Logs", border_style="dim")

    def _make_progress_bar(self, progress: int, width: int = 10) -> str:
        """Create a simple text progress bar."""
        filled = int(width * progress / 100)
        empty = width - filled
        return "[" + "=" * filled + " " * empty + "]"

    def _format_bytes(self, bytes_count: int) -> str:
        """Format bytes as human-readable string."""
        for unit in ['B', 'KB', 'MB', 'GB']:
            if bytes_count < 1024:
                return f"{bytes_count:.1f}{unit}"
            bytes_count /= 1024
        return f"{bytes_count:.1f}TB"

    def print_summary(self) -> None:
        """Print final summary."""
        if not self._console:
            print("\n=== Server Summary ===")
            stats = self.tracker.get_stats()
            print(f"Total clients: {stats['total_clients']}")
            print(f"Completed: {stats['completed']}")
            print(f"Failed: {stats['failed']}")
            print(f"Total transferred: {self._format_bytes(stats['total_bytes'])}")
            return

        stats = self.tracker.get_stats()

        self._console.print("\n")
        self._console.print(Panel(
            Text(
                f"Clients served: {stats['total_clients']}\n"
                f"Successful boots: {stats['completed']}\n"
                f"Failed boots: {stats['failed']}\n"
                f"Total transferred: {self._format_bytes(stats['total_bytes'])}",
                justify="center"
            ),
            title="Server Summary",
            border_style="green"
        ))


def get_stage_from_name(name: str) -> BootStage:
    """Convert stage name to BootStage enum."""
    stage_map = {
        'dhcp': BootStage.DHCP,
        'tftp': BootStage.TFTP,
        'nbd': BootStage.NBD,
        'kernel': BootStage.KERNEL,
        'complete': BootStage.COMPLETE,
        'failed': BootStage.FAILED,
    }
    return stage_map.get(name.lower(), BootStage.DHCP)
