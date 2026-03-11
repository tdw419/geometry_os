"""
Tests for Cognitive Load Balancing (Phase 28)

Tests the cognitive-enhanced load balancing with LLM-backed decisions.
"""

import asyncio
import json
from unittest.mock import AsyncMock, Mock

import pytest

from systems.network_boot.cognitive_load_balancing import (
    MIGRATION_DECISION_PROMPT,
    OVERLOAD_PREDICTION_PROMPT,
    PLACEMENT_PROMPT,
    CognitiveCapacityRouter,
    CognitiveLoadBalancer,
    MigrationDecision,
    OverloadPrediction,
    OverloadPredictor,
    PlacementDecision,
    create_cognitive_load_balancer,
)
from systems.network_boot.load_balancing import (
    PeerMetrics,
    PeerResourceMonitor,
)


class TestPlacementDecision:
    """Tests for PlacementDecision dataclass."""

    def test_decision_creation(self):
        decision = PlacementDecision(
            peer_id="peer-1",
            reason="Best capacity",
        )
        assert decision.peer_id == "peer-1"
        assert decision.reason == "Best capacity"
        assert decision.confidence == 1.0
        assert decision.alternatives == []

    def test_decision_with_alternatives(self):
        decision = PlacementDecision(
            peer_id="peer-1",
            reason="Best match",
            confidence=0.85,
            alternatives=["peer-2", "peer-3"],
        )
        assert decision.confidence == 0.85
        assert len(decision.alternatives) == 2


class TestMigrationDecision:
    """Tests for MigrationDecision dataclass."""

    def test_migrate_decision(self):
        decision = MigrationDecision(
            should_migrate=True,
            target_peer_id="peer-2",
            reason="Source overloaded",
        )
        assert decision.should_migrate is True
        assert decision.target_peer_id == "peer-2"

    def test_no_migrate_decision(self):
        decision = MigrationDecision(
            should_migrate=False,
            target_peer_id=None,
            reason="Source has capacity",
        )
        assert decision.should_migrate is False
        assert decision.target_peer_id is None


class TestOverloadPrediction:
    """Tests for OverloadPrediction dataclass."""

    def test_prediction_overload(self):
        prediction = OverloadPrediction(
            will_overload=True,
            confidence=0.85,
            reason="CPU trending up",
            predicted_time_seconds=60,
        )
        assert prediction.will_overload is True
        assert prediction.confidence == 0.85
        assert prediction.predicted_time_seconds == 60

    def test_prediction_no_overload(self):
        prediction = OverloadPrediction(
            will_overload=False,
            confidence=0.9,
            reason="Stable metrics",
        )
        assert prediction.will_overload is False


class TestCognitiveCapacityRouter:
    """Tests for CognitiveCapacityRouter."""

    @pytest.fixture
    def mock_cognitive_router(self):
        router = Mock()
        router.generate = AsyncMock(return_value='{"peer_id": "peer-2", "reason": "Best capacity"}')
        return router

    @pytest.fixture
    def monitor_with_peers(self):
        monitor = PeerResourceMonitor(local_peer_id="local")

        monitor.update_peer_metrics(PeerMetrics(
            peer_id="local",
            hostname="local.host",
            cpu_percent=50.0,
            memory_percent=50.0,
            container_count=5,
            memory_available_mb=1024,
        ))

        monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-2",
            hostname="peer2.host",
            cpu_percent=20.0,
            memory_percent=30.0,
            container_count=2,
            memory_available_mb=2048,
        ))

        return monitor

    @pytest.fixture
    def cognitive_router(self, monitor_with_peers, mock_cognitive_router):
        return CognitiveCapacityRouter(
            monitor_with_peers,
            cognitive_router=mock_cognitive_router,
            local_peer_id="local",
        )

    def test_router_creation(self, cognitive_router):
        assert cognitive_router.resource_monitor is not None
        assert cognitive_router.cognitive_router is not None
        assert cognitive_router._fallback_router is not None

    @pytest.mark.asyncio
    async def test_select_peer_cognitive_success(self, cognitive_router, mock_cognitive_router):
        # Cognitive returns peer-2
        peer = await cognitive_router.select_peer(
            memory_required_mb=512,
            container_name="test-container",
            container_type="web",
        )

        assert peer is not None
        assert peer.peer_id == "peer-2"
        mock_cognitive_router.generate.assert_called_once()

    @pytest.mark.asyncio
    async def test_select_peer_fallback_on_error(self, cognitive_router, mock_cognitive_router):
        # Cognitive fails
        mock_cognitive_router.generate.side_effect = Exception("LLM error")

        peer = await cognitive_router.select_peer(
            memory_required_mb=512,
            container_name="test-container",
        )

        # Should fallback to standard router
        assert peer is not None

    @pytest.mark.asyncio
    async def test_select_peer_excluded(self, cognitive_router, mock_cognitive_router):
        # Cognitive suggests peer-2 but it's excluded
        mock_cognitive_router.generate.return_value = '{"peer_id": "peer-2", "reason": "Test"}'

        # Exclude peer-2 - cognitive will suggest it but validation should fail
        # Then fallback should select local (only remaining peer)
        peer = await cognitive_router.select_peer(
            memory_required_mb=512,
            exclude_peers=["peer-2"],
        )

        # Should get local since peer-2 is excluded
        if peer:
            assert peer.peer_id == "local"

    def test_format_cluster_state(self, cognitive_router, monitor_with_peers):
        peers = monitor_with_peers.get_all_metrics()
        state = cognitive_router._format_cluster_state(peers, [])

        assert "local" in state
        assert "peer-2" in state
        assert "CPU" in state
        assert "Mem" in state

    def test_extract_json(self, cognitive_router):
        text = 'Some text {"peer_id": "test", "value": 123} more text'
        result = cognitive_router._extract_json(text)
        data = json.loads(result)

        assert data["peer_id"] == "test"
        assert data["value"] == 123

    @pytest.mark.asyncio
    async def test_should_migrate(self, cognitive_router, mock_cognitive_router, monitor_with_peers):
        mock_cognitive_router.generate.return_value = '{"migrate": true, "target": "peer-2", "reason": "Load balancing"}'

        source = monitor_with_peers.get_peer_metrics("local")
        decision = await cognitive_router.should_migrate(
            container_name="test-container",
            source_peer=source,
            memory_mb=512,
        )

        assert decision.should_migrate is True
        assert decision.target_peer_id == "peer-2"

    @pytest.mark.asyncio
    async def test_should_not_migrate(self, cognitive_router, mock_cognitive_router, monitor_with_peers):
        mock_cognitive_router.generate.return_value = '{"migrate": false, "target": null, "reason": "Source has capacity"}'

        source = monitor_with_peers.get_peer_metrics("local")
        decision = await cognitive_router.should_migrate(
            container_name="test-container",
            source_peer=source,
            memory_mb=512,
        )

        assert decision.should_migrate is False

    def test_history_tracking(self, cognitive_router):
        # Add fake history
        cognitive_router._placement_history.append(
            PlacementDecision(peer_id="test", reason="Test")
        )
        cognitive_router._migration_history.append(
            MigrationDecision(should_migrate=True, target_peer_id="peer-2", reason="Test")
        )

        placements = cognitive_router.get_placement_history()
        migrations = cognitive_router.get_migration_history()

        assert len(placements) == 1
        assert len(migrations) == 1


class TestOverloadPredictor:
    """Tests for OverloadPredictor."""

    @pytest.fixture
    def mock_cognitive_router(self):
        router = Mock()
        router.generate = AsyncMock(
            return_value='{"will_overload": true, "confidence": 0.8, "reason": "CPU trending up"}'
        )
        return router

    @pytest.fixture
    def monitor(self):
        return PeerResourceMonitor(local_peer_id="local")

    @pytest.fixture
    def predictor(self, monitor, mock_cognitive_router):
        return OverloadPredictor(
            monitor,
            cognitive_router=mock_cognitive_router,
        )

    def test_record_metrics(self, predictor):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
        )

        predictor.record_metrics("peer-1", metrics)

        assert "peer-1" in predictor._metric_history
        assert len(predictor._metric_history["peer-1"]) == 1

    def test_record_metrics_history_limit(self, predictor):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
        )

        # Record more than history_size
        for i in range(15):
            predictor.record_metrics("peer-1", metrics)

        assert len(predictor._metric_history["peer-1"]) <= predictor.history_size

    @pytest.mark.asyncio
    async def test_predict_no_history(self, predictor):
        prediction = await predictor.predict_overload("unknown-peer")

        assert prediction.will_overload is False
        assert prediction.confidence == 0.0
        assert "No history" in prediction.reason

    @pytest.mark.asyncio
    async def test_predict_insufficient_history(self, predictor):
        # Only 1 sample
        predictor.record_metrics("peer-1", PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
        ))

        prediction = await predictor.predict_overload("peer-1")

        assert prediction.will_overload is False
        assert "Insufficient" in prediction.reason

    @pytest.mark.asyncio
    async def test_predict_cpu_overload_trend(self, predictor):
        # Simulate rising CPU
        for i, cpu in enumerate([60, 70, 80, 88, 92]):
            predictor.record_metrics("peer-1", PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=float(cpu),
                memory_percent=50.0,
            ))

        prediction = await predictor.predict_overload("peer-1")

        assert prediction.will_overload is True
        assert "CPU" in prediction.reason

    @pytest.mark.asyncio
    async def test_predict_memory_overload_trend(self, predictor):
        # Simulate rising memory
        for i, mem in enumerate([60, 70, 80, 88, 92]):
            predictor.record_metrics("peer-1", PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=50.0,
                memory_percent=float(mem),
            ))

        prediction = await predictor.predict_overload("peer-1")

        assert prediction.will_overload is True
        assert "Memory" in prediction.reason


class TestCognitiveLoadBalancer:
    """Tests for CognitiveLoadBalancer."""

    @pytest.fixture
    def mock_cognitive_router(self):
        router = Mock()
        router.generate = AsyncMock(
            return_value='{"peer_id": "peer-2", "reason": "Best capacity"}'
        )
        return router

    @pytest.fixture
    def load_balancer(self, mock_cognitive_router):
        return CognitiveLoadBalancer(
            local_peer_id="test-local",
            cognitive_router=mock_cognitive_router,
        )

    def test_load_balancer_creation(self, load_balancer):
        assert load_balancer.resource_monitor is not None
        assert load_balancer.capacity_router is not None
        assert load_balancer.overload_predictor is not None
        assert isinstance(load_balancer.capacity_router, CognitiveCapacityRouter)

    @pytest.mark.asyncio
    async def test_start_stop(self, load_balancer):
        await load_balancer.start()
        assert load_balancer._running is True

        await asyncio.sleep(0.1)

        await load_balancer.stop()
        assert load_balancer._running is False

    @pytest.mark.asyncio
    async def test_select_peer_for_boot(self, load_balancer, mock_cognitive_router):
        # Add a peer
        load_balancer.resource_monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-2",
            hostname="peer2.local",
            cpu_percent=30.0,
            memory_percent=40.0,
            memory_available_mb=2048,
        ))

        peer = await load_balancer.select_peer_for_boot(
            memory_required_mb=512,
            container_name="test-container",
            container_type="web",
        )

        assert peer is not None

    @pytest.mark.asyncio
    async def test_predict_peer_overload(self, load_balancer):
        # Add peer with metrics
        load_balancer.resource_monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
        ))

        prediction = await load_balancer.predict_peer_overload("peer-1")

        assert prediction is not None
        assert isinstance(prediction, OverloadPrediction)

    @pytest.mark.asyncio
    async def test_check_all_peers_for_overload(self, load_balancer):
        # Add peers with rising metrics
        for i, cpu in enumerate([80, 85, 90]):
            load_balancer.resource_monitor.update_peer_metrics(PeerMetrics(
                peer_id=f"peer-{i}",
                hostname=f"peer{i}.local",
                cpu_percent=float(cpu),
                memory_percent=50.0,
            ))

            # Record multiple samples for trend
            for _ in range(5):
                load_balancer.overload_predictor.record_metrics(
                    f"peer-{i}",
                    PeerMetrics(
                        peer_id=f"peer-{i}",
                        hostname=f"peer{i}.local",
                        cpu_percent=float(cpu + _ * 2),
                        memory_percent=50.0,
                    )
                )

        predictions = await load_balancer.check_all_peers_for_overload()

        assert isinstance(predictions, dict)

    def test_get_decision_history(self, load_balancer):
        history = load_balancer.get_decision_history()

        assert "placements" in history
        assert "migrations" in history
        assert "predictions" in history


class TestCreateCognitiveLoadBalancer:
    """Tests for create_cognitive_load_balancer convenience function."""

    def test_create_defaults(self):
        lb = create_cognitive_load_balancer()

        assert lb.local_peer_id == "local"
        assert lb.resource_monitor is not None
        assert isinstance(lb, CognitiveLoadBalancer)

    def test_create_with_options(self):
        lb = create_cognitive_load_balancer(
            local_peer_id="custom-local",
            prefer_local=False,
        )

        assert lb.local_peer_id == "custom-local"
        assert lb.config.prefer_local is False


class TestPrompts:
    """Tests for prompt templates."""

    def test_placement_prompt_format(self):
        result = PLACEMENT_PROMPT.format(
            cluster_state="peer-1: CPU 50%",
            container_name="test",
            memory_mb=512,
            container_type="web",
        )

        assert "peer-1: CPU 50%" in result
        assert "test" in result
        assert "512" in result
        assert "web" in result

    def test_migration_prompt_format(self):
        result = MIGRATION_DECISION_PROMPT.format(
            source_peer="peer-1 (CPU 90%)",
            container_name="test",
            memory_mb=512,
            targets="peer-2: CPU 20%",
        )

        assert "peer-1" in result
        assert "test" in result
        assert "peer-2" in result

    def test_overload_prompt_format(self):
        result = OVERLOAD_PREDICTION_PROMPT.format(
            metrics_history="timestamp1: CPU 50%",
            current_metrics="CPU 85%",
        )

        assert "timestamp1" in result
        assert "85%" in result


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
