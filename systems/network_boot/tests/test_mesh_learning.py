"""
Tests for Mesh Learning (Phase 30)

Tests outcome storage, pattern learning, and adaptive scoring.
"""

import asyncio
import time

import pytest

from systems.network_boot.load_balancing import (
    PeerMetrics,
)
from systems.network_boot.mesh_learning import (
    AdaptiveScorer,
    LearningLoadBalancer,
    MigrationOutcome,
    MigrationOutcomeStore,
    OutcomeStatus,
    PatternLearner,
    PeerAffinity,
    WorkloadType,
    create_learning_load_balancer,
)


class TestWorkloadType:
    """Tests for WorkloadType enum."""

    def test_workload_types(self):
        assert WorkloadType.GENERIC.value == "generic"
        assert WorkloadType.WEB.value == "web"
        assert WorkloadType.DATABASE.value == "database"
        assert WorkloadType.COMPUTE.value == "compute"
        assert WorkloadType.GPU.value == "gpu"
        assert WorkloadType.IO_INTENSIVE.value == "io_intensive"


class TestMigrationOutcome:
    """Tests for MigrationOutcome dataclass."""

    def test_outcome_creation(self):
        outcome = MigrationOutcome(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test-container",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
            status=OutcomeStatus.PENDING,
            start_time=time.time(),
        )
        assert outcome.migration_id == "migr-1"
        assert outcome.status == OutcomeStatus.PENDING

    def test_outcome_with_result(self):
        outcome = MigrationOutcome(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test",
            container_type=WorkloadType.WEB,
            memory_mb=1024,
            status=OutcomeStatus.SUCCESS,
            start_time=time.time() - 5.5,
            duration_seconds=5.5,
        )
        assert outcome.status == OutcomeStatus.SUCCESS
        assert outcome.duration_seconds == 5.5


class TestPeerAffinity:
    """Tests for PeerAffinity dataclass."""

    def test_affinity_creation(self):
        affinity = PeerAffinity(
            workload_type=WorkloadType.WEB,
            peer_id="peer-1",
            success_count=8,
            failure_count=2,
        )
        assert affinity.success_rate == 0.8
        assert affinity.confidence == 1.0  # 10 samples = capped

    def test_affinity_low_samples(self):
        affinity = PeerAffinity(
            workload_type=WorkloadType.WEB,
            peer_id="peer-1",
            success_count=2,
            failure_count=0,
        )
        assert affinity.success_rate == 1.0
        assert affinity.confidence == 0.2  # 2 samples / 10

    def test_affinity_no_samples(self):
        affinity = PeerAffinity(
            workload_type=WorkloadType.WEB,
            peer_id="peer-1",
        )
        assert affinity.success_rate == 0.5  # Neutral


class TestMigrationOutcomeStore:
    """Tests for MigrationOutcomeStore."""

    @pytest.fixture
    def store(self):
        return MigrationOutcomeStore()

    def test_store_creation(self, store):
        assert len(store._migrations) == 0
        assert len(store._placements) == 0

    def test_record_migration_start(self, store):
        outcome = store.record_migration_start(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test-container",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
        )

        assert outcome.migration_id == "migr-1"
        assert outcome.status == OutcomeStatus.PENDING
        assert "migr-1" in store._migrations

    def test_record_migration_result(self, store):
        store.record_migration_start(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
        )

        result = store.record_migration_result(
            migration_id="migr-1",
            success=True,
            notes="Migration completed",
        )

        assert result is not None
        assert result.status == OutcomeStatus.SUCCESS
        assert result.duration_seconds is not None

    def test_record_migration_result_unknown(self, store):
        result = store.record_migration_result(
            migration_id="unknown",
            success=True,
        )
        assert result is None

    def test_record_placement(self, store):
        outcome = store.record_placement(
            placement_id="place-1",
            peer_id="peer-1",
            container_name="test",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
            success=True,
        )

        assert outcome.placement_id == "place-1"
        assert outcome.success is True

    def test_get_migrations_for_peer(self, store):
        store.record_migration_start(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
        )
        store.record_migration_start(
            migration_id="migr-2",
            source_peer_id="peer-3",
            target_peer_id="peer-1",
            container_name="test2",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
        )

        migrations = store.get_migrations_for_peer("peer-1")
        assert len(migrations) == 2

    def test_get_migrations_for_workload(self, store):
        store.record_migration_start(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test",
            container_type=WorkloadType.WEB,
            memory_mb=512,
        )

        migrations = store.get_migrations_for_workload(WorkloadType.WEB)
        assert len(migrations) == 1

    def test_get_statistics_empty(self, store):
        stats = store.get_statistics()

        assert stats["total_migrations"] == 0
        assert stats["success_rate"] == 0

    def test_get_statistics_with_migrations(self, store):
        store.record_migration_start(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
        )
        store.record_migration_result("migr-1", success=True)

        stats = store.get_statistics()

        assert stats["total_migrations"] == 1
        assert stats["success_rate"] == 1.0


class TestPatternLearner:
    """Tests for PatternLearner."""

    @pytest.fixture
    def store(self):
        return MigrationOutcomeStore()

    @pytest.fixture
    def learner(self, store):
        return PatternLearner(store, min_samples=2)

    def test_learner_creation(self, learner):
        assert learner.min_samples == 2
        assert len(learner._affinities) == 0

    def test_learn_no_data(self, learner):
        patterns = learner.learn()
        assert patterns == 0

    def test_learn_with_migrations(self, store, learner):
        # Record successful migrations to multiple peers (need 2+ peers for pattern)
        for i in range(2):
            store.record_migration_start(
                migration_id=f"migr-{i}",
                source_peer_id="peer-1",
                target_peer_id=f"peer-{i+2}",  # peer-2, peer-3
                container_name=f"test-{i}",
                container_type=WorkloadType.WEB,
                memory_mb=512,
            )
            store.record_migration_result(f"migr-{i}", success=True)

        patterns = learner.learn()
        assert patterns >= 1

    def test_get_pattern(self, store, learner):
        for i in range(2):
            store.record_migration_start(
                migration_id=f"migr-{i}",
                source_peer_id="peer-1",
                target_peer_id=f"peer-{i+2}",  # peer-2, peer-3
                container_name=f"test-{i}",
                container_type=WorkloadType.WEB,
                memory_mb=512,
            )
            store.record_migration_result(f"migr-{i}", success=True)

        learner.learn()
        pattern = learner.get_pattern(WorkloadType.WEB)

        assert pattern is not None
        assert "peer-2" in pattern.preferred_peers or "peer-3" in pattern.preferred_peers

    def test_get_affinity(self, store, learner):
        store.record_migration_start(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test",
            container_type=WorkloadType.WEB,
            memory_mb=512,
        )
        store.record_migration_result("migr-1", success=True)

        learner.learn()
        affinity = learner.get_affinity(WorkloadType.WEB, "peer-2")

        assert affinity is not None
        assert affinity.success_count == 1

    def test_get_recommendations(self, store, learner):
        for i in range(3):
            store.record_migration_start(
                migration_id=f"migr-{i}",
                source_peer_id="peer-1",
                target_peer_id="peer-2",
                container_name=f"test-{i}",
                container_type=WorkloadType.WEB,
                memory_mb=512,
            )
            store.record_migration_result(f"migr-{i}", success=True)

        # One failure to peer-3
        store.record_migration_start(
            migration_id="migr-fail",
            source_peer_id="peer-1",
            target_peer_id="peer-3",
            container_name="test-fail",
            container_type=WorkloadType.WEB,
            memory_mb=512,
        )
        store.record_migration_result("migr-fail", success=False)

        learner.learn()
        recommendations = learner.get_recommendations(
            WorkloadType.WEB,
            ["peer-2", "peer-3", "peer-4"],
        )

        assert len(recommendations) == 3
        # peer-2 should be first (all successes)
        assert recommendations[0][0] == "peer-2"


class TestAdaptiveScorer:
    """Tests for AdaptiveScorer."""

    @pytest.fixture
    def store(self):
        return MigrationOutcomeStore()

    @pytest.fixture
    def learner(self, store):
        return PatternLearner(store, min_samples=2)

    @pytest.fixture
    def scorer(self, learner):
        return AdaptiveScorer(learner)

    def test_scorer_creation(self, scorer):
        assert scorer.pattern_learner is not None

    def test_score_peer_no_affinity(self, scorer):
        peer = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=50.0,
        )

        score = scorer.score_peer(peer, WorkloadType.WEB)
        # No affinity data, should use base capacity
        assert 0 < score <= 1.0

    def test_score_peer_with_affinity(self, store, learner, scorer):
        # Create affinity data
        for i in range(3):
            store.record_migration_start(
                migration_id=f"migr-{i}",
                source_peer_id="peer-1",
                target_peer_id="peer-2",
                container_name=f"test-{i}",
                container_type=WorkloadType.WEB,
                memory_mb=512,
            )
            store.record_migration_result(f"migr-{i}", success=True)

        learner.learn()

        peer = PeerMetrics(
            peer_id="peer-2",
            hostname="peer2.local",
            cpu_percent=50.0,
            memory_percent=50.0,
        )

        score = scorer.score_peer(peer, WorkloadType.WEB)
        # Should get bonus for being preferred
        assert score > 0

    @pytest.mark.asyncio
    async def test_recommend_peer(self, scorer):
        peers = [
            PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=50.0,
                memory_percent=50.0,
            ),
            PeerMetrics(
                peer_id="peer-2",
                hostname="peer2.local",
                cpu_percent=30.0,
                memory_percent=30.0,
            ),
        ]

        best = await scorer.recommend_peer(peers, WorkloadType.GENERIC)
        assert best is not None
        # peer-2 has more capacity
        assert best.peer_id == "peer-2"


class TestLearningLoadBalancer:
    """Tests for LearningLoadBalancer."""

    @pytest.fixture
    def load_balancer(self):
        return LearningLoadBalancer(local_peer_id="test-local")

    def test_load_balancer_creation(self, load_balancer):
        assert load_balancer.outcome_store is not None
        assert load_balancer.pattern_learner is not None
        assert load_balancer.adaptive_scorer is not None

    @pytest.mark.asyncio
    async def test_start_stop(self, load_balancer):
        await load_balancer.start()
        assert load_balancer._running is True

        await asyncio.sleep(0.1)

        await load_balancer.stop()
        assert load_balancer._running is False

    @pytest.mark.asyncio
    async def test_select_peer(self, load_balancer):
        load_balancer.resource_monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=30.0,
            memory_percent=40.0,
            memory_available_mb=2048,
        ))

        peer = await load_balancer.select_peer(WorkloadType.GENERIC)
        assert peer is not None

    def test_record_migration(self, load_balancer):
        outcome = load_balancer.record_migration_start(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="test",
            container_type=WorkloadType.GENERIC,
            memory_mb=512,
        )

        assert outcome.migration_id == "migr-1"

        load_balancer.record_migration_result("migr-1", success=True)

        stored = load_balancer.outcome_store.get_migration("migr-1")
        assert stored.status == OutcomeStatus.SUCCESS

    def test_get_status(self, load_balancer):
        status = load_balancer.get_status()

        assert "running" in status
        assert "outcome_stats" in status
        assert "learning_stats" in status


class TestCreateLearningLoadBalancer:
    """Tests for create_learning_load_balancer function."""

    def test_create_defaults(self):
        lb = create_learning_load_balancer()

        assert lb.local_peer_id == "local"
        assert lb.outcome_store is not None

    def test_create_with_options(self):
        lb = create_learning_load_balancer(
            local_peer_id="custom-local",
        )

        assert lb.local_peer_id == "custom-local"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
