"""
Tests for Load Balancing (Phase 27)

Tests automatic container placement based on peer capacity.
"""

import asyncio

import pytest

from systems.network_boot.load_balancing import (
    CapacityRouter,
    LoadBalancer,
    LoadBalancerConfig,
    OverloadDetector,
    PeerMetrics,
    PeerResourceMonitor,
    PeerStatus,
    create_load_balancer,
)


class TestPeerMetrics:
    """Tests for PeerMetrics dataclass."""

    def test_default_metrics(self):
        metrics = PeerMetrics(
            peer_id="test-peer",
            hostname="test.local",
        )
        assert metrics.peer_id == "test-peer"
        assert metrics.hostname == "test.local"
        assert metrics.cpu_percent == 0.0
        assert metrics.memory_percent == 0.0
        assert metrics.container_count == 0
        assert metrics.status == PeerStatus.ONLINE

    def test_available_capacity(self):
        # Peer with low usage should have high capacity
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=20.0,
            memory_percent=30.0,
            container_count=2,
        )
        # cpu_available = 80, memory_available = 70, container_factor = 80
        # (80 * 0.3) + (70 * 0.4) + (80 * 0.3) = 24 + 28 + 24 = 76
        assert metrics.available_capacity > 50.0

    def test_available_capacity_high_load(self):
        # Peer with high usage should have low capacity
        metrics = PeerMetrics(
            peer_id="peer-2",
            hostname="peer2.local",
            cpu_percent=95.0,
            memory_percent=90.0,
            container_count=15,
        )
        assert metrics.available_capacity < 20.0

    def test_can_accept_container(self):
        # Peer with resources can accept
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            memory_available_mb=2048,
            cpu_percent=50.0,
            memory_percent=50.0,
        )
        assert metrics.can_accept_container(512) is True

    def test_cannot_accept_offline(self):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            status=PeerStatus.OFFLINE,
            memory_available_mb=2048,
        )
        assert metrics.can_accept_container() is False

    def test_cannot_accept_high_cpu(self):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=95.0,
            memory_available_mb=2048,
        )
        assert metrics.can_accept_container() is False

    def test_cannot_accept_insufficient_memory(self):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            memory_available_mb=256,
        )
        assert metrics.can_accept_container(512) is False

    def test_to_dict_and_from_dict(self):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
            memory_available_mb=1024,
            memory_total_mb=2048,
            container_count=5,
            vnc_ports_used=[5901, 5902],
            load_average=1.5,
            network_latency_ms=10.0,
            status=PeerStatus.ONLINE,
        )

        data = metrics.to_dict()
        restored = PeerMetrics.from_dict(data)

        assert restored.peer_id == metrics.peer_id
        assert restored.hostname == metrics.hostname
        assert restored.cpu_percent == metrics.cpu_percent
        assert restored.memory_percent == metrics.memory_percent
        assert restored.container_count == metrics.container_count
        assert restored.vnc_ports_used == metrics.vnc_ports_used
        assert restored.status == metrics.status


class TestPeerResourceMonitor:
    """Tests for PeerResourceMonitor."""

    @pytest.fixture
    def monitor(self):
        return PeerResourceMonitor(local_peer_id="test-local")

    def test_initial_state(self, monitor):
        assert monitor.local_peer_id == "test-local"
        assert len(monitor.get_all_metrics()) == 0

    def test_update_peer_metrics(self, monitor):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
        )
        monitor.update_peer_metrics(metrics)

        result = monitor.get_peer_metrics("peer-1")
        assert result is not None
        assert result.cpu_percent == 50.0

    def test_update_peer_from_dict(self, monitor):
        data = {
            "peer_id": "peer-2",
            "hostname": "peer2.local",
            "cpu_percent": 30.0,
            "memory_percent": 40.0,
        }
        monitor.update_peer_from_dict(data)

        result = monitor.get_peer_metrics("peer-2")
        assert result is not None
        assert result.cpu_percent == 30.0

    def test_get_available_peers(self, monitor):
        # Add online peer
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="online-peer",
            hostname="online.local",
            status=PeerStatus.ONLINE,
            memory_available_mb=2048,
        ))

        # Add offline peer
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="offline-peer",
            hostname="offline.local",
            status=PeerStatus.OFFLINE,
        ))

        # Add overloaded peer
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="overloaded-peer",
            hostname="overloaded.local",
            status=PeerStatus.OVERLOADED,
            cpu_percent=95.0,
        ))

        available = monitor.get_available_peers()
        assert len(available) == 1
        assert available[0].peer_id == "online-peer"

    def test_remove_peer(self, monitor):
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
        ))
        assert monitor.get_peer_metrics("peer-1") is not None

        monitor.remove_peer("peer-1")
        assert monitor.get_peer_metrics("peer-1") is None

    def test_set_peer_status(self, monitor):
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            status=PeerStatus.ONLINE,
        ))

        monitor.set_peer_status("peer-1", PeerStatus.OVERLOADED)
        result = monitor.get_peer_metrics("peer-1")
        assert result.status == PeerStatus.OVERLOADED

    @pytest.mark.asyncio
    async def test_start_stop_monitoring(self, monitor):
        await monitor.start_monitoring()
        assert monitor._running is True

        # Wait for at least one metrics collection
        await asyncio.sleep(0.2)

        await monitor.stop_monitoring()
        assert monitor._running is False


class TestCapacityRouter:
    """Tests for CapacityRouter."""

    @pytest.fixture
    def monitor_with_peers(self):
        monitor = PeerResourceMonitor(local_peer_id="local")

        # Add local peer with medium capacity
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="local",
            hostname="local.host",
            cpu_percent=50.0,
            memory_percent=50.0,
            container_count=5,
            memory_available_mb=1024,
        ))

        # Add remote peer with more capacity
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="remote-1",
            hostname="remote1.host",
            cpu_percent=20.0,
            memory_percent=30.0,
            container_count=2,
            memory_available_mb=2048,
        ))

        # Add overloaded peer
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="remote-2",
            hostname="remote2.host",
            cpu_percent=95.0,
            memory_percent=90.0,
            container_count=10,
            memory_available_mb=256,
        ))

        return monitor

    @pytest.fixture
    def router(self, monitor_with_peers):
        return CapacityRouter(
            monitor_with_peers,
            prefer_local=True,
            local_peer_id="local",
        )

    @pytest.mark.asyncio
    async def test_select_peer_prefer_local(self, router):
        # Should prefer local when prefer_local=True
        peer = await router.select_peer(memory_required_mb=512, prefer_local=True)
        assert peer is not None
        assert peer.peer_id == "local"

    @pytest.mark.asyncio
    async def test_select_peer_best_capacity(self, router):
        # Should select peer with most capacity when not preferring local
        peer = await router.select_peer(memory_required_mb=512, prefer_local=False)
        assert peer is not None
        # remote-1 has more capacity
        assert peer.peer_id == "remote-1"

    @pytest.mark.asyncio
    async def test_select_peer_exclude(self, router):
        # Exclude local and remote-1, should return None (remote-2 is overloaded)
        peer = await router.select_peer(
            memory_required_mb=512,
            exclude_peers=["local", "remote-1"],
        )
        # remote-2 is overloaded so won't be selected
        assert peer is None

    @pytest.mark.asyncio
    async def test_find_migration_target(self, router):
        # Find target for migration from local
        target = await router.find_migration_target("local", memory_required_mb=512)
        assert target is not None
        assert target.peer_id != "local"

    def test_get_cluster_summary(self, router):
        summary = router.get_cluster_summary()

        assert summary["peer_count"] == 3
        assert summary["online_count"] >= 1
        assert "total_containers" in summary
        assert "peers" in summary


class TestOverloadDetector:
    """Tests for OverloadDetector."""

    @pytest.fixture
    def monitor(self):
        monitor = PeerResourceMonitor(local_peer_id="local")
        return monitor

    @pytest.fixture
    def detector(self, monitor):
        return OverloadDetector(
            monitor,
            cpu_threshold=80.0,
            memory_threshold=80.0,
            check_interval=0.1,
        )

    def test_add_callback(self, detector):
        callback_called = []

        async def callback(peer):
            callback_called.append(peer.peer_id)

        detector.add_overload_callback(callback)
        assert len(detector._overload_callbacks) == 1

    @pytest.mark.asyncio
    async def test_detect_overload(self, detector, monitor):
        # Add peer that becomes overloaded
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=95.0,  # Above threshold
            memory_percent=50.0,
        ))

        overload_detected = []

        async def callback(peer):
            overload_detected.append(peer.peer_id)

        detector.add_overload_callback(callback)

        await detector.start()
        await asyncio.sleep(0.3)  # Wait for detection
        await detector.stop()

        assert "peer-1" in overload_detected

    @pytest.mark.asyncio
    async def test_detect_recovery(self, detector, monitor):
        # Add overloaded peer
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=95.0,
            memory_percent=50.0,
            status=PeerStatus.OVERLOADED,
        )
        monitor.update_peer_metrics(metrics)

        # Simulate recovery
        metrics.cpu_percent = 50.0
        monitor.update_peer_metrics(metrics)

        await detector.start()
        await asyncio.sleep(0.3)
        await detector.stop()

        result = monitor.get_peer_metrics("peer-1")
        assert result.status == PeerStatus.ONLINE


class TestLoadBalancer:
    """Tests for LoadBalancer."""

    @pytest.fixture
    def config(self):
        return LoadBalancerConfig(
            prefer_local=True,
            cpu_threshold=85.0,
            memory_threshold=85.0,
            monitor_interval=0.1,
            detector_interval=0.1,
        )

    @pytest.fixture
    def load_balancer(self, config):
        return LoadBalancer(
            local_peer_id="test-local",
            config=config,
        )

    def test_components_created(self, load_balancer):
        assert load_balancer.resource_monitor is not None
        assert load_balancer.capacity_router is not None
        assert load_balancer.overload_detector is not None

    @pytest.mark.asyncio
    async def test_start_stop(self, load_balancer):
        await load_balancer.start()
        assert load_balancer._running is True

        await asyncio.sleep(0.2)

        await load_balancer.stop()
        assert load_balancer._running is False

    @pytest.mark.asyncio
    async def test_select_peer_for_boot(self, load_balancer):
        # Add a peer
        load_balancer.resource_monitor.update_peer_metrics(PeerMetrics(
            peer_id="test-local",
            hostname="local.host",
            cpu_percent=30.0,
            memory_percent=40.0,
            memory_available_mb=2048,
        ))

        peer = await load_balancer.select_peer_for_boot(memory_required_mb=512)
        assert peer is not None
        assert peer.peer_id == "test-local"

    def test_update_peer_metrics(self, load_balancer):
        metrics = PeerMetrics(
            peer_id="remote-1",
            hostname="remote.host",
        )
        load_balancer.update_peer_metrics(metrics)

        result = load_balancer.resource_monitor.get_peer_metrics("remote-1")
        assert result is not None

    def test_get_cluster_status(self, load_balancer):
        load_balancer.resource_monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
        ))

        status = load_balancer.get_cluster_status()
        assert status["peer_count"] == 1

    def test_get_local_metrics(self, load_balancer):
        # Initially no local metrics until monitoring starts
        result = load_balancer.get_local_metrics()
        # May be None if monitoring hasn't run
        assert result is None or result.peer_id == "test-local"


class TestCreateLoadBalancer:
    """Tests for create_load_balancer convenience function."""

    def test_create_defaults(self):
        lb = create_load_balancer()
        assert lb.local_peer_id == "local"
        assert lb.resource_monitor is not None

    def test_create_with_options(self):
        lb = create_load_balancer(
            local_peer_id="custom-local",
            prefer_local=False,
            cpu_threshold=75.0,
            memory_threshold=75.0,
        )
        assert lb.local_peer_id == "custom-local"
        assert lb.config.prefer_local is False
        assert lb.config.cpu_threshold == 75.0
        assert lb.config.memory_threshold == 75.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
