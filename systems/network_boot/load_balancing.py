"""
Load Balancing - Phase 27

Automatic container placement based on peer capacity.

Usage:
    from systems.network_boot.load_balancing import (
        PeerResourceMonitor,
        CapacityRouter,
        OverloadDetector,
        LoadBalancer,
    )

    # Monitor peer resources
    monitor = PeerResourceMonitor()
    await monitor.start_monitoring()

    # Route boots to best peer
    router = CapacityRouter(monitor)
    best_peer = await router.select_peer(memory_required=1024)

    # Detect overload and trigger migration
    detector = OverloadDetector(monitor, migration_coordinator)
    await detector.start()
"""

import asyncio
import logging
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

logger = logging.getLogger("LoadBalancing")


class PeerStatus(Enum):
    """Status of a peer in the cluster."""
    ONLINE = "online"
    OFFLINE = "offline"
    OVERLOADED = "overloaded"
    DRAINING = "draining"


@dataclass
class PeerMetrics:
    """Resource metrics for a peer."""
    peer_id: str
    hostname: str
    cpu_percent: float = 0.0
    memory_percent: float = 0.0
    memory_available_mb: int = 0
    memory_total_mb: int = 0
    container_count: int = 0
    vnc_ports_used: list[int] = field(default_factory=list)
    load_average: float = 0.0
    network_latency_ms: float = 0.0
    last_updated: float = field(default_factory=time.time)
    status: PeerStatus = PeerStatus.ONLINE

    @property
    def available_capacity(self) -> float:
        """Calculate available capacity score (0-100)."""
        # Weighted combination of available resources
        cpu_available = 100.0 - self.cpu_percent
        memory_available = 100.0 - self.memory_percent

        # Lower container count = more capacity
        container_factor = max(0, 100 - (self.container_count * 10))

        return (cpu_available * 0.3 + memory_available * 0.4 + container_factor * 0.3)

    def can_accept_container(self, memory_required_mb: int = 512) -> bool:
        """Check if peer can accept a new container."""
        if self.status != PeerStatus.ONLINE:
            return False
        if self.memory_available_mb < memory_required_mb:
            return False
        if self.cpu_percent > 90 or self.memory_percent > 90:
            return False
        return True

    def to_dict(self) -> dict[str, Any]:
        """Serialize to dict."""
        return {
            "peer_id": self.peer_id,
            "hostname": self.hostname,
            "cpu_percent": self.cpu_percent,
            "memory_percent": self.memory_percent,
            "memory_available_mb": self.memory_available_mb,
            "memory_total_mb": self.memory_total_mb,
            "container_count": self.container_count,
            "vnc_ports_used": self.vnc_ports_used,
            "load_average": self.load_average,
            "network_latency_ms": self.network_latency_ms,
            "last_updated": self.last_updated,
            "status": self.status.value,
            "available_capacity": self.available_capacity,
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "PeerMetrics":
        """Deserialize from dict."""
        return cls(
            peer_id=data["peer_id"],
            hostname=data["hostname"],
            cpu_percent=data.get("cpu_percent", 0.0),
            memory_percent=data.get("memory_percent", 0.0),
            memory_available_mb=data.get("memory_available_mb", 0),
            memory_total_mb=data.get("memory_total_mb", 0),
            container_count=data.get("container_count", 0),
            vnc_ports_used=data.get("vnc_ports_used", []),
            load_average=data.get("load_average", 0.0),
            network_latency_ms=data.get("network_latency_ms", 0.0),
            last_updated=data.get("last_updated", time.time()),
            status=PeerStatus(data.get("status", "online")),
        )


class PeerResourceMonitor:
    """
    Monitors resource usage across mesh peers.

    Collects metrics from local and remote peers for load balancing decisions.
    """

    def __init__(
        self,
        local_peer_id: str = "local",
        update_interval: float = 5.0,
        metrics_timeout: float = 30.0,
    ):
        self.local_peer_id = local_peer_id
        self.update_interval = update_interval
        self.metrics_timeout = metrics_timeout

        self._peers: dict[str, PeerMetrics] = {}
        self._monitor_task: asyncio.Task | None = None
        self._running = False

    async def start_monitoring(self):
        """Start periodic resource monitoring."""
        if self._running:
            return

        self._running = True
        self._monitor_task = asyncio.create_task(self._monitor_loop())
        logger.info(f"Started resource monitoring for peer {self.local_peer_id}")

    async def stop_monitoring(self):
        """Stop resource monitoring."""
        self._running = False
        if self._monitor_task:
            self._monitor_task.cancel()
            try:
                await self._monitor_task
            except asyncio.CancelledError:
                pass
        logger.info("Stopped resource monitoring")

    async def _monitor_loop(self):
        """Periodically collect local metrics."""
        while self._running:
            try:
                metrics = await self._collect_local_metrics()
                self._peers[self.local_peer_id] = metrics
                await asyncio.sleep(self.update_interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error collecting metrics: {e}")
                await asyncio.sleep(1.0)

    async def _collect_local_metrics(self) -> PeerMetrics:
        """Collect metrics for local peer."""
        import os
        import shutil

        # Get CPU usage
        try:
            cpu_percent = await self._get_cpu_percent()
        except Exception:
            cpu_percent = 0.0

        # Get memory usage
        try:
            memory = shutil.disk_usage("/")
            memory_total_mb = memory.total // (1024 * 1024)
            memory_available_mb = memory.free // (1024 * 1024)
            memory_percent = ((memory.total - memory.free) / memory.total) * 100
        except Exception:
            memory_total_mb = 0
            memory_available_mb = 0
            memory_percent = 0.0

        # Get load average
        try:
            load_average = os.getloadavg()[0] if hasattr(os, 'getloadavg') else 0.0
        except Exception:
            load_average = 0.0

        return PeerMetrics(
            peer_id=self.local_peer_id,
            hostname=self._get_hostname(),
            cpu_percent=cpu_percent,
            memory_percent=memory_percent,
            memory_available_mb=memory_available_mb,
            memory_total_mb=memory_total_mb,
            container_count=0,  # Would be populated from boot manager
            load_average=load_average,
            status=PeerStatus.ONLINE,
        )

    async def _get_cpu_percent(self) -> float:
        """Get CPU usage percentage."""
        # Simple implementation - read from /proc/stat on Linux
        try:
            with open("/proc/stat") as f:
                line = f.readline()
                parts = line.split()
                if parts[0] == "cpu":
                    total = sum(int(x) for x in parts[1:8])
                    idle = int(parts[4])
                    # Wait briefly and calculate
                    await asyncio.sleep(0.1)
                    with open("/proc/stat") as f2:
                        line2 = f2.readline()
                        parts2 = line2.split()
                        total2 = sum(int(x) for x in parts2[1:8])
                        idle2 = int(parts2[4])
                    if total2 - total > 0:
                        return 100.0 * (1.0 - (idle2 - idle) / (total2 - total))
        except Exception:
            pass
        return 0.0

    def _get_hostname(self) -> str:
        """Get local hostname."""
        import socket
        try:
            return socket.gethostname()
        except Exception:
            return "localhost"

    def update_peer_metrics(self, metrics: PeerMetrics):
        """Update metrics for a remote peer."""
        self._peers[metrics.peer_id] = metrics
        logger.debug(f"Updated metrics for peer {metrics.peer_id}")

    def update_peer_from_dict(self, data: dict[str, Any]):
        """Update peer metrics from dict."""
        metrics = PeerMetrics.from_dict(data)
        self.update_peer_metrics(metrics)

    def get_peer_metrics(self, peer_id: str) -> PeerMetrics | None:
        """Get metrics for a specific peer."""
        return self._peers.get(peer_id)

    def get_all_metrics(self) -> list[PeerMetrics]:
        """Get metrics for all peers."""
        return list(self._peers.values())

    def get_available_peers(self) -> list[PeerMetrics]:
        """Get all peers that can accept containers."""
        return [
            p for p in self._peers.values()
            if p.status == PeerStatus.ONLINE and p.can_accept_container()
        ]

    def remove_peer(self, peer_id: str):
        """Remove a peer from monitoring."""
        if peer_id in self._peers:
            del self._peers[peer_id]
            logger.info(f"Removed peer {peer_id}")

    def set_peer_status(self, peer_id: str, status: PeerStatus):
        """Set status for a peer."""
        if peer_id in self._peers:
            self._peers[peer_id].status = status
            logger.info(f"Set peer {peer_id} status to {status.value}")


class CapacityRouter:
    """
    Routes container boots to the best available peer.

    Uses PeerResourceMonitor to make placement decisions.
    """

    def __init__(
        self,
        resource_monitor: PeerResourceMonitor,
        prefer_local: bool = True,
        local_peer_id: str = "local",
    ):
        self.resource_monitor = resource_monitor
        self.prefer_local = prefer_local
        self.local_peer_id = local_peer_id

    async def select_peer(
        self,
        memory_required_mb: int = 512,
        prefer_local: bool | None = None,
        exclude_peers: list[str] | None = None,
    ) -> PeerMetrics | None:
        """
        Select the best peer for a new container.

        Args:
            memory_required_mb: Memory requirement in MB
            prefer_local: Prefer local peer if available (overrides instance default)
            exclude_peers: List of peer IDs to exclude from selection

        Returns:
            Best peer for placement, or None if no peer available
        """
        prefer = prefer_local if prefer_local is not None else self.prefer_local
        exclude = exclude_peers or []

        # Get available peers
        available = [
            p for p in self.resource_monitor.get_all_metrics()
            if p.peer_id not in exclude
            and p.can_accept_container(memory_required_mb)
            and p.status == PeerStatus.ONLINE
        ]

        if not available:
            logger.warning("No peers available for container placement")
            return None

        # Prefer local if requested and available
        if prefer:
            local = next(
                (p for p in available if p.peer_id == self.local_peer_id),
                None
            )
            if local and local.can_accept_container(memory_required_mb):
                logger.debug("Selected local peer for placement")
                return local

        # Sort by available capacity (descending)
        available.sort(key=lambda p: p.available_capacity, reverse=True)

        best = available[0]
        logger.info(
            f"Selected peer {best.peer_id} ({best.hostname}) "
            f"with capacity {best.available_capacity:.1f}%"
        )
        return best

    async def find_migration_target(
        self,
        source_peer_id: str,
        memory_required_mb: int = 512,
    ) -> PeerMetrics | None:
        """
        Find a target peer for container migration.

        Args:
            source_peer_id: Peer to migrate from
            memory_required_mb: Memory requirement

        Returns:
            Best target peer, or None if no peer available
        """
        return await self.select_peer(
            memory_required_mb=memory_required_mb,
            prefer_local=False,
            exclude_peers=[source_peer_id],
        )

    def get_cluster_summary(self) -> dict[str, Any]:
        """Get summary of cluster capacity."""
        all_peers = self.resource_monitor.get_all_metrics()

        total_capacity = sum(p.available_capacity for p in all_peers)
        total_containers = sum(p.container_count for p in all_peers)
        total_memory_available = sum(p.memory_available_mb for p in all_peers)

        online_count = sum(1 for p in all_peers if p.status == PeerStatus.ONLINE)
        overloaded_count = sum(1 for p in all_peers if p.status == PeerStatus.OVERLOADED)

        return {
            "peer_count": len(all_peers),
            "online_count": online_count,
            "overloaded_count": overloaded_count,
            "total_capacity": total_capacity,
            "avg_capacity": total_capacity / len(all_peers) if all_peers else 0,
            "total_containers": total_containers,
            "total_memory_available_mb": total_memory_available,
            "peers": [p.to_dict() for p in all_peers],
        }


class OverloadDetector:
    """
    Detects overloaded peers and triggers migrations.

    Monitors peer metrics and initiates container migration when
    thresholds are exceeded.
    """

    def __init__(
        self,
        resource_monitor: PeerResourceMonitor,
        migration_coordinator=None,
        capacity_router: CapacityRouter | None = None,
        cpu_threshold: float = 90.0,
        memory_threshold: float = 90.0,
        check_interval: float = 10.0,
    ):
        self.resource_monitor = resource_monitor
        self.migration_coordinator = migration_coordinator
        self.capacity_router = capacity_router or CapacityRouter(resource_monitor)
        self.cpu_threshold = cpu_threshold
        self.memory_threshold = memory_threshold
        self.check_interval = check_interval

        self._detector_task: asyncio.Task | None = None
        self._running = False
        self._overload_callbacks: list[Callable] = []

    def add_overload_callback(self, callback: Callable):
        """Add callback to be called when overload detected."""
        self._overload_callbacks.append(callback)

    async def start(self):
        """Start overload detection."""
        if self._running:
            return

        self._running = True
        self._detector_task = asyncio.create_task(self._detect_loop())
        logger.info("Started overload detection")

    async def stop(self):
        """Stop overload detection."""
        self._running = False
        if self._detector_task:
            self._detector_task.cancel()
            try:
                await self._detector_task
            except asyncio.CancelledError:
                pass
        logger.info("Stopped overload detection")

    async def _detect_loop(self):
        """Periodically check for overloaded peers."""
        while self._running:
            try:
                await self._check_overload()
                await asyncio.sleep(self.check_interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error in overload detection: {e}")
                await asyncio.sleep(1.0)

    async def _check_overload(self):
        """Check all peers for overload conditions."""
        for peer in self.resource_monitor.get_all_metrics():
            is_overloaded = (
                peer.cpu_percent > self.cpu_threshold or
                peer.memory_percent > self.memory_threshold
            )

            if is_overloaded and peer.status != PeerStatus.OVERLOADED:
                logger.warning(
                    f"Peer {peer.peer_id} is overloaded: "
                    f"CPU={peer.cpu_percent:.1f}%, Memory={peer.memory_percent:.1f}%"
                )
                self.resource_monitor.set_peer_status(
                    peer.peer_id,
                    PeerStatus.OVERLOADED
                )

                # Notify callbacks
                for callback in self._overload_callbacks:
                    try:
                        await callback(peer)
                    except Exception as e:
                        logger.error(f"Overload callback error: {e}")

                # Trigger migration if coordinator available
                if self.migration_coordinator:
                    await self._initiate_rebalance(peer)

            elif not is_overloaded and peer.status == PeerStatus.OVERLOADED:
                logger.info(f"Peer {peer.peer_id} recovered from overload")
                self.resource_monitor.set_peer_status(
                    peer.peer_id,
                    PeerStatus.ONLINE
                )

    async def _initiate_rebalance(self, overloaded_peer: PeerMetrics):
        """Initiate container rebalancing from overloaded peer."""
        if not self.migration_coordinator:
            return

        # Find a target peer
        target = await self.capacity_router.find_migration_target(
            overloaded_peer.peer_id,
            memory_required_mb=512,
        )

        if not target:
            logger.warning(
                f"No target peer available for rebalancing from {overloaded_peer.peer_id}"
            )
            return

        logger.info(
            f"Would migrate container from {overloaded_peer.peer_id} to {target.peer_id}"
        )
        # Actual migration would be triggered here via migration_coordinator


@dataclass
class LoadBalancerConfig:
    """Configuration for LoadBalancer."""
    prefer_local: bool = True
    cpu_threshold: float = 90.0
    memory_threshold: float = 90.0
    monitor_interval: float = 5.0
    detector_interval: float = 10.0


class LoadBalancer:
    """
    Complete load balancing solution.

    Combines resource monitoring, capacity routing, and overload detection.
    """

    def __init__(
        self,
        local_peer_id: str = "local",
        config: LoadBalancerConfig | None = None,
        migration_coordinator=None,
    ):
        self.config = config or LoadBalancerConfig()
        self.local_peer_id = local_peer_id

        # Create components
        self.resource_monitor = PeerResourceMonitor(
            local_peer_id=local_peer_id,
            update_interval=self.config.monitor_interval,
        )

        self.capacity_router = CapacityRouter(
            self.resource_monitor,
            prefer_local=self.config.prefer_local,
            local_peer_id=local_peer_id,
        )

        self.overload_detector = OverloadDetector(
            self.resource_monitor,
            migration_coordinator=migration_coordinator,
            capacity_router=self.capacity_router,
            cpu_threshold=self.config.cpu_threshold,
            memory_threshold=self.config.memory_threshold,
            check_interval=self.config.detector_interval,
        )

        self._running = False

    async def start(self):
        """Start load balancing."""
        if self._running:
            return

        self._running = True
        await self.resource_monitor.start_monitoring()
        await self.overload_detector.start()
        logger.info(f"Load balancer started for peer {self.local_peer_id}")

    async def stop(self):
        """Stop load balancing."""
        self._running = False
        await self.overload_detector.stop()
        await self.resource_monitor.stop_monitoring()
        logger.info("Load balancer stopped")

    async def select_peer_for_boot(
        self,
        memory_required_mb: int = 512,
    ) -> PeerMetrics | None:
        """Select best peer for a new container boot."""
        return await self.capacity_router.select_peer(
            memory_required_mb=memory_required_mb,
            prefer_local=self.config.prefer_local,
        )

    def update_peer_metrics(self, metrics: PeerMetrics):
        """Update metrics for a remote peer."""
        self.resource_monitor.update_peer_metrics(metrics)

    def get_cluster_status(self) -> dict[str, Any]:
        """Get current cluster status."""
        return self.capacity_router.get_cluster_summary()

    def get_local_metrics(self) -> PeerMetrics | None:
        """Get metrics for local peer."""
        return self.resource_monitor.get_peer_metrics(self.local_peer_id)


# Convenience function
def create_load_balancer(
    local_peer_id: str = "local",
    migration_coordinator=None,
    prefer_local: bool = True,
    cpu_threshold: float = 90.0,
    memory_threshold: float = 90.0,
) -> LoadBalancer:
    """Create a fully configured load balancer."""
    config = LoadBalancerConfig(
        prefer_local=prefer_local,
        cpu_threshold=cpu_threshold,
        memory_threshold=memory_threshold,
    )
    return LoadBalancer(
        local_peer_id=local_peer_id,
        config=config,
        migration_coordinator=migration_coordinator,
    )
