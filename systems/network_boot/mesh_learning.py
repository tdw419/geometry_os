"""
Mesh Learning - Phase 30

Learn from migration outcomes and improve decisions over time.

The mesh develops "preferred" placement patterns based on historical
success rates and learns which peers work best for which workload types.

Usage:
    from systems.network_boot.mesh_learning import (
        MigrationOutcomeStore,
        PatternLearner,
        AdaptiveScorer,
        LearningLoadBalancer,
    )

    # Create learning system
    outcome_store = MigrationOutcomeStore()
    learner = PatternLearner(outcome_store)
    adaptive_scorer = AdaptiveScorer(learner)

    # Record migration outcome
    await outcome_store.record_outcome(migration_id, success=True, ...)

    # Get learned recommendations
    best_peer = await adaptive_scorer.recommend_peer(container_type="web")
"""

import asyncio
import logging
import time
from collections import defaultdict
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any

from systems.network_boot.load_balancing import (
    PeerMetrics,
    PeerResourceMonitor,
)

logger = logging.getLogger("MeshLearning")


class OutcomeStatus(Enum):
    """Status of a migration or placement outcome."""
    SUCCESS = "success"
    PARTIAL = "partial"      # Succeeded but with issues
    FAILED = "failed"
    ROLLED_BACK = "rolled_back"
    PENDING = "pending"


class WorkloadType(Enum):
    """Types of container workloads."""
    WEB = "web"
    DATABASE = "database"
    COMPUTE = "compute"
    GPU = "gpu"
    IO_INTENSIVE = "io_intensive"
    GENERIC = "generic"


@dataclass
class MigrationOutcome:
    """Record of a migration outcome."""
    migration_id: str
    source_peer_id: str
    target_peer_id: str
    container_name: str
    container_type: WorkloadType
    memory_mb: int
    status: OutcomeStatus
    start_time: float
    end_time: float | None = None
    duration_seconds: float | None = None
    error: str | None = None
    notes: str = ""
    timestamp: float = field(default_factory=time.time)


@dataclass
class PlacementOutcome:
    """Record of a placement decision outcome."""
    placement_id: str
    peer_id: str
    container_name: str
    container_type: WorkloadType
    memory_mb: int
    success: bool
    uptime_seconds: float | None = None
    error: str | None = None
    timestamp: float = field(default_factory=time.time)


@dataclass
class PeerAffinity:
    """Affinity score between workload type and peer."""
    workload_type: WorkloadType
    peer_id: str
    success_count: int = 0
    failure_count: int = 0
    avg_duration: float = 0.0
    last_updated: float = field(default_factory=time.time)

    @property
    def success_rate(self) -> float:
        """Calculate success rate."""
        total = self.success_count + self.failure_count
        if total == 0:
            return 0.5  # Neutral
        return self.success_count / total

    @property
    def confidence(self) -> float:
        """Confidence in the affinity score based on sample size."""
        total = self.success_count + self.failure_count
        # More samples = higher confidence (capped at 1.0)
        return min(1.0, total / 10.0)


@dataclass
class LearnedPattern:
    """A learned placement pattern."""
    pattern_id: str
    workload_type: WorkloadType
    preferred_peers: list[str]  # Ordered by success rate
    avoided_peers: list[str]
    confidence: float
    sample_size: int
    created_at: float
    updated_at: float


class MigrationOutcomeStore:
    """
    Stores and retrieves migration outcomes for learning.

    Maintains history of all migrations and placements for pattern extraction.
    """

    def __init__(
        self,
        storage_path: str | None = None,
        max_history: int = 1000,
    ):
        self.storage_path = Path(storage_path) if storage_path else None
        self.max_history = max_history

        # In-memory storage
        self._migrations: dict[str, MigrationOutcome] = {}
        self._placements: dict[str, PlacementOutcome] = {}

        # Indexes for fast lookup
        self._by_source_peer: dict[str, list[str]] = defaultdict(list)
        self._by_target_peer: dict[str, list[str]] = defaultdict(list)
        self._by_workload_type: dict[WorkloadType, list[str]] = defaultdict(list)

    def record_migration_start(
        self,
        migration_id: str,
        source_peer_id: str,
        target_peer_id: str,
        container_name: str,
        container_type: WorkloadType = WorkloadType.GENERIC,
        memory_mb: int = 512,
    ) -> MigrationOutcome:
        """Record the start of a migration."""
        outcome = MigrationOutcome(
            migration_id=migration_id,
            source_peer_id=source_peer_id,
            target_peer_id=target_peer_id,
            container_name=container_name,
            container_type=container_type,
            memory_mb=memory_mb,
            status=OutcomeStatus.PENDING,
            start_time=time.time(),
        )

        self._migrations[migration_id] = outcome

        # Update indexes
        self._by_source_peer[source_peer_id].append(migration_id)
        self._by_target_peer[target_peer_id].append(migration_id)
        self._by_workload_type[container_type].append(migration_id)

        return outcome

    def record_migration_result(
        self,
        migration_id: str,
        success: bool,
        error: str | None = None,
        notes: str = "",
    ) -> MigrationOutcome | None:
        """Record the result of a migration."""
        if migration_id not in self._migrations:
            logger.warning(f"Unknown migration: {migration_id}")
            return None

        outcome = self._migrations[migration_id]
        outcome.end_time = time.time()
        outcome.duration_seconds = outcome.end_time - outcome.start_time
        outcome.status = OutcomeStatus.SUCCESS if success else OutcomeStatus.FAILED
        outcome.error = error
        outcome.notes = notes

        logger.info(
            f"Recorded migration {migration_id}: {outcome.status.value} "
            f"in {outcome.duration_seconds:.1f}s"
        )

        return outcome

    def record_placement(
        self,
        placement_id: str,
        peer_id: str,
        container_name: str,
        container_type: WorkloadType = WorkloadType.GENERIC,
        memory_mb: int = 512,
        success: bool = True,
        error: str | None = None,
    ) -> PlacementOutcome:
        """Record a placement outcome."""
        outcome = PlacementOutcome(
            placement_id=placement_id,
            peer_id=peer_id,
            container_name=container_name,
            container_type=container_type,
            memory_mb=memory_mb,
            success=success,
            error=error,
        )

        self._placements[placement_id] = outcome
        return outcome

    def get_migration(self, migration_id: str) -> MigrationOutcome | None:
        """Get a specific migration outcome."""
        return self._migrations.get(migration_id)

    def get_migrations_for_peer(
        self,
        peer_id: str,
        as_source: bool = True,
        as_target: bool = True,
        limit: int = 100,
    ) -> list[MigrationOutcome]:
        """Get migrations involving a peer."""
        ids = set()
        if as_source:
            ids.update(self._by_source_peer.get(peer_id, []))
        if as_target:
            ids.update(self._by_target_peer.get(peer_id, []))

        migrations = [self._migrations[i] for i in ids if i in self._migrations]
        migrations.sort(key=lambda m: m.timestamp, reverse=True)
        return migrations[:limit]

    def get_migrations_for_workload(
        self,
        workload_type: WorkloadType,
        limit: int = 100,
    ) -> list[MigrationOutcome]:
        """Get migrations for a workload type."""
        ids = self._by_workload_type.get(workload_type, [])
        migrations = [self._migrations[i] for i in ids if i in self._migrations]
        migrations.sort(key=lambda m: m.timestamp, reverse=True)
        return migrations[:limit]

    def get_statistics(self) -> dict[str, Any]:
        """Get overall statistics."""
        total = len(self._migrations)
        if total == 0:
            return {
                "total_migrations": 0,
                "total_placements": len(self._placements),
                "success_rate": 0,
            }

        successes = sum(
            1 for m in self._migrations.values()
            if m.status == OutcomeStatus.SUCCESS
        )

        return {
            "total_migrations": total,
            "total_placements": len(self._placements),
            "success_rate": successes / total,
            "by_status": {
                status.value: sum(1 for m in self._migrations.values() if m.status == status)
                for status in OutcomeStatus
            },
        }


class PatternLearner:
    """
    Learns placement patterns from migration outcomes.

    Extracts patterns about which peers work best for which workload types.
    """

    def __init__(
        self,
        outcome_store: MigrationOutcomeStore,
        min_samples: int = 3,  # Minimum samples before pattern is valid
    ):
        self.outcome_store = outcome_store
        self.min_samples = min_samples

        # Learned affinities: (workload_type, peer_id) -> PeerAffinity
        self._affinities: dict[tuple[WorkloadType, str], PeerAffinity] = {}

        # Cached patterns
        self._patterns: dict[WorkloadType, LearnedPattern] = {}

        # Last learning timestamp
        self._last_learning: float = 0

    def learn(self) -> int:
        """
        Learn patterns from all recorded outcomes.

        Returns number of patterns updated.
        """
        # Get all completed migrations
        migrations = [
            m for m in self.outcome_store._migrations.values()
            if m.status != OutcomeStatus.PENDING
        ]

        # Group by (workload_type, target_peer)
        groups: dict[tuple[WorkloadType, str], list[MigrationOutcome]] = defaultdict(list)
        for m in migrations:
            key = (m.container_type, m.target_peer_id)
            groups[key].append(m)

        # Update affinities
        for (workload_type, peer_id), group in groups.items():
            successes = sum(1 for m in group if m.status == OutcomeStatus.SUCCESS)
            failures = sum(1 for m in group if m.status == OutcomeStatus.FAILED)
            durations = [m.duration_seconds for m in group if m.duration_seconds]
            avg_duration = sum(durations) / len(durations) if durations else 0

            affinity = PeerAffinity(
                workload_type=workload_type,
                peer_id=peer_id,
                success_count=successes,
                failure_count=failures,
                avg_duration=avg_duration,
            )
            self._affinities[(workload_type, peer_id)] = affinity

        # Update patterns for each workload type
        patterns_updated = 0
        for workload_type in WorkloadType:
            if self._update_pattern(workload_type):
                patterns_updated += 1

        self._last_learning = time.time()
        return patterns_updated

    def _update_pattern(self, workload_type: WorkloadType) -> bool:
        """Update learned pattern for a workload type."""
        # Get all affinities for this workload type
        relevant = [
            aff for key, aff in self._affinities.items()
            if key[0] == workload_type
        ]

        if len(relevant) < self.min_samples:
            return False

        # Sort by success rate (descending)
        relevant.sort(key=lambda a: a.success_rate, reverse=True)

        # Determine preferred and avoided peers
        preferred = [a.peer_id for a in relevant if a.success_rate > 0.7]
        avoided = [a.peer_id for a in relevant if a.success_rate < 0.3]

        total_samples = sum(a.success_count + a.failure_count for a in relevant)
        confidence = min(1.0, total_samples / 20.0)

        pattern_id = f"pattern-{workload_type.value}"

        if workload_type in self._patterns:
            pattern = self._patterns[workload_type]
            pattern.preferred_peers = preferred
            pattern.avoided_peers = avoided
            pattern.confidence = confidence
            pattern.sample_size = total_samples
            pattern.updated_at = time.time()
        else:
            self._patterns[workload_type] = LearnedPattern(
                pattern_id=pattern_id,
                workload_type=workload_type,
                preferred_peers=preferred,
                avoided_peers=avoided,
                confidence=confidence,
                sample_size=total_samples,
                created_at=time.time(),
                updated_at=time.time(),
            )

        return True

    def get_pattern(self, workload_type: WorkloadType) -> LearnedPattern | None:
        """Get learned pattern for a workload type."""
        return self._patterns.get(workload_type)

    def get_affinity(
        self,
        workload_type: WorkloadType,
        peer_id: str,
    ) -> PeerAffinity | None:
        """Get affinity score for a workload type and peer."""
        return self._affinities.get((workload_type, peer_id))

    def get_recommendations(
        self,
        workload_type: WorkloadType,
        available_peers: list[str],
    ) -> list[tuple[str, float]]:
        """
        Get recommended peers for a workload type.

        Returns list of (peer_id, score) tuples sorted by score.
        """
        recommendations = []

        for peer_id in available_peers:
            affinity = self.get_affinity(workload_type, peer_id)
            if affinity:
                # Combine success rate with confidence
                score = affinity.success_rate * (0.5 + 0.5 * affinity.confidence)
                recommendations.append((peer_id, score))
            else:
                # No data - neutral score
                recommendations.append((peer_id, 0.5))

        # Sort by score descending
        recommendations.sort(key=lambda x: x[1], reverse=True)
        return recommendations

    def get_statistics(self) -> dict[str, Any]:
        """Get learning statistics."""
        return {
            "last_learning": self._last_learning,
            "total_affinities": len(self._affinities),
            "patterns_learned": len(self._patterns),
            "patterns": {
                wt.value: {
                    "preferred": p.preferred_peers,
                    "avoided": p.avoided_peers,
                    "confidence": p.confidence,
                    "sample_size": p.sample_size,
                }
                for wt, p in self._patterns.items()
            },
        }


class AdaptiveScorer:
    """
    Adaptive scoring for peer selection based on learned patterns.

    Adjusts capacity scores based on historical success rates.
    """

    def __init__(
        self,
        pattern_learner: PatternLearner,
        base_weight: float = 0.6,  # Weight for base capacity score
        learned_weight: float = 0.4,  # Weight for learned patterns
    ):
        self.pattern_learner = pattern_learner
        self.base_weight = base_weight
        self.learned_weight = learned_weight

    def score_peer(
        self,
        peer: PeerMetrics,
        workload_type: WorkloadType = WorkloadType.GENERIC,
        base_capacity: float | None = None,
    ) -> float:
        """
        Calculate adaptive score for a peer.

        Combines base capacity with learned affinity.
        """
        # Use provided base capacity or calculate
        if base_capacity is None:
            base_capacity = peer.available_capacity

        # Get learned affinity
        affinity = self.pattern_learner.get_affinity(workload_type, peer.peer_id)

        if affinity:
            # Weighted combination
            learned_score = affinity.success_rate * affinity.confidence
            final_score = (
                self.base_weight * (base_capacity / 100) +
                self.learned_weight * learned_score
            )
        else:
            # No learning data - use base capacity only
            final_score = base_capacity / 100

        # Penalty for avoided peers
        pattern = self.pattern_learner.get_pattern(workload_type)
        if pattern and peer.peer_id in pattern.avoided_peers:
            final_score *= 0.5  # 50% penalty

        # Bonus for preferred peers
        if pattern and peer.peer_id in pattern.preferred_peers:
            final_score *= 1.2  # 20% bonus

        return min(1.0, final_score)

    async def recommend_peer(
        self,
        peers: list[PeerMetrics],
        workload_type: WorkloadType = WorkloadType.GENERIC,
    ) -> PeerMetrics | None:
        """
        Recommend best peer for a workload type.

        Uses learned patterns combined with current capacity.
        """
        if not peers:
            return None

        # Score all peers
        scored = [
            (peer, self.score_peer(peer, workload_type))
            for peer in peers
        ]

        # Sort by score
        scored.sort(key=lambda x: x[1], reverse=True)

        best_peer, best_score = scored[0]
        logger.info(
            f"Recommended peer {best_peer.peer_id} for {workload_type.value} "
            f"(score: {best_score:.2f})"
        )

        return best_peer


class LearningLoadBalancer:
    """
    Complete learning load balancer.

    Combines:
    - Predictive migration (Phase 29)
    - Outcome storage
    - Pattern learning
    - Adaptive scoring
    """

    def __init__(
        self,
        local_peer_id: str = "local",
        resource_monitor: PeerResourceMonitor | None = None,
        migration_coordinator=None,
    ):
        self.local_peer_id = local_peer_id
        self.resource_monitor = resource_monitor or PeerResourceMonitor(local_peer_id)
        self.migration_coordinator = migration_coordinator

        # Learning components
        self.outcome_store = MigrationOutcomeStore()
        self.pattern_learner = PatternLearner(self.outcome_store)
        self.adaptive_scorer = AdaptiveScorer(self.pattern_learner)

        # Running state
        self._running = False
        self._learning_task: asyncio.Task | None = None
        self._learning_interval: float = 60.0  # Relearn every minute

    async def start(self):
        """Start learning loop."""
        if self._running:
            return

        self._running = True
        self._learning_task = asyncio.create_task(self._learning_loop())
        logger.info("Learning load balancer started")

    async def stop(self):
        """Stop learning loop."""
        self._running = False
        if self._learning_task:
            self._learning_task.cancel()
            try:
                await self._learning_task
            except asyncio.CancelledError:
                pass
        logger.info("Learning load balancer stopped")

    async def _learning_loop(self):
        """Periodically relearn patterns."""
        while self._running:
            try:
                await asyncio.sleep(self._learning_interval)

                patterns = self.pattern_learner.learn()
                if patterns > 0:
                    logger.info(f"Updated {patterns} learned patterns")

            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Learning error: {e}")
                await asyncio.sleep(10)

    async def select_peer(
        self,
        workload_type: WorkloadType = WorkloadType.GENERIC,
        memory_required_mb: int = 512,
    ) -> PeerMetrics | None:
        """
        Select best peer using learned patterns.

        Combines current capacity with historical success rates.
        """
        # Get available peers
        available = self.resource_monitor.get_available_peers()

        # Filter by memory requirement
        available = [
            p for p in available
            if p.memory_available_mb >= memory_required_mb
        ]

        if not available:
            return None

        # Use adaptive scoring
        return await self.adaptive_scorer.recommend_peer(available, workload_type)

    def record_migration_start(
        self,
        migration_id: str,
        source_peer_id: str,
        target_peer_id: str,
        container_name: str,
        container_type: WorkloadType = WorkloadType.GENERIC,
        memory_mb: int = 512,
    ) -> MigrationOutcome:
        """Record the start of a migration for learning."""
        return self.outcome_store.record_migration_start(
            migration_id=migration_id,
            source_peer_id=source_peer_id,
            target_peer_id=target_peer_id,
            container_name=container_name,
            container_type=container_type,
            memory_mb=memory_mb,
        )

    def record_migration_result(
        self,
        migration_id: str,
        success: bool,
        error: str | None = None,
        notes: str = "",
    ):
        """Record the result of a migration."""
        self.outcome_store.record_migration_result(
            migration_id=migration_id,
            success=success,
            error=error,
            notes=notes,
        )

        # Trigger immediate learning
        self.pattern_learner.learn()

    def get_status(self) -> dict[str, Any]:
        """Get complete status."""
        return {
            "local_peer_id": self.local_peer_id,
            "running": self._running,
            "outcome_stats": self.outcome_store.get_statistics(),
            "learning_stats": self.pattern_learner.get_statistics(),
        }

    def get_peer_affinities(
        self,
        peer_id: str,
    ) -> dict[WorkloadType, PeerAffinity]:
        """Get all affinities for a peer."""
        result = {}
        for wt in WorkloadType:
            affinity = self.pattern_learner.get_affinity(wt, peer_id)
            if affinity:
                result[wt] = affinity
        return result


# Convenience function
def create_learning_load_balancer(
    local_peer_id: str = "local",
    resource_monitor: PeerResourceMonitor | None = None,
) -> LearningLoadBalancer:
    """Create a fully configured learning load balancer."""
    return LearningLoadBalancer(
        local_peer_id=local_peer_id,
        resource_monitor=resource_monitor,
    )
