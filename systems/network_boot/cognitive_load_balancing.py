"""
Cognitive Load Balancing - Phase 28

Intelligent container placement using the cognitive bus (PixelBrain/LM Studio).

Extends the basic LoadBalancer with LLM-backed decision making for:
- Smart peer selection based on historical patterns
- Workload affinity (certain containers run better on certain peers)
- Cost-aware placement (minimize migrations)
"""

import json
import logging
import time
from dataclasses import dataclass, field
from typing import Any

from systems.cognitive.cognitive_router import get_cognitive_router
from systems.network_boot.load_balancing import (
    CapacityRouter,
    LoadBalancer,
    LoadBalancerConfig,
    PeerMetrics,
    PeerResourceMonitor,
    PeerStatus,
)

logger = logging.getLogger("CognitiveLoadBalancing")


# Prompt templates for cognitive decisions
PLACEMENT_PROMPT = """You are a cluster scheduler. Choose the best peer for a new container.

Current cluster state:
{cluster_state}

Container to place:
- Name: {container_name}
- Memory required: {memory_mb}MB
- Type: {container_type}

Select the best peer. Consider:
1. Available capacity
2. Workload affinity (similar containers on same peer)
3. Migration cost (avoid peers likely to need migration soon)

Respond with ONLY a JSON object:
{{"peer_id": "<id>", "reason": "<brief explanation>"}}
"""

MIGRATION_DECISION_PROMPT = """You are a cluster scheduler. Decide if a container should be migrated.

Current situation:
- Source peer: {source_peer}
- Container: {container_name}
- Memory usage: {memory_mb}MB

Alternative targets:
{targets}

Should this container be migrated? If yes, to which peer?

Respond with ONLY a JSON object:
{{"migrate": true/false, "target": "<peer_id or null>", "reason": "<brief explanation>"}}
"""

OVERLOAD_PREDICTION_PROMPT = """You are a cluster monitor. Analyze peer metrics and predict overload.

Peer metrics history (last 5 minutes):
{metrics_history}

Current metrics:
{current_metrics}

Predict: Will this peer become overloaded in the next 2 minutes?
Overload = CPU > 90% OR Memory > 90%

Respond with ONLY a JSON object:
{{"will_overload": true/false, "confidence": 0.0-1.0, "reason": "<brief explanation>"}}
"""


@dataclass
class PlacementDecision:
    """Result of a cognitive placement decision."""
    peer_id: str
    reason: str
    confidence: float = 1.0
    alternatives: list[str] = field(default_factory=list)
    timestamp: float = field(default_factory=time.time)


@dataclass
class MigrationDecision:
    """Result of a cognitive migration decision."""
    should_migrate: bool
    target_peer_id: str | None
    reason: str
    confidence: float = 1.0
    timestamp: float = field(default_factory=time.time)


@dataclass
class OverloadPrediction:
    """Prediction about peer overload."""
    will_overload: bool
    confidence: float
    reason: str
    predicted_time_seconds: float | None = None
    timestamp: float = field(default_factory=time.time)


class CognitiveCapacityRouter:
    """
    Capacity router enhanced with cognitive decision making.

    Falls back to standard CapacityRouter if cognitive systems unavailable.
    """

    def __init__(
        self,
        resource_monitor: PeerResourceMonitor,
        cognitive_router=None,
        prefer_cognitive: bool = True,
        local_peer_id: str = "local",
    ):
        self.resource_monitor = resource_monitor
        self.cognitive_router = cognitive_router or get_cognitive_router()
        self.prefer_cognitive = prefer_cognitive
        self.local_peer_id = local_peer_id

        # Fallback to standard router
        self._fallback_router = CapacityRouter(
            resource_monitor,
            prefer_local=True,
            local_peer_id=local_peer_id,
        )

        # Decision history for learning
        self._placement_history: list[PlacementDecision] = []
        self._migration_history: list[MigrationDecision] = []

    async def select_peer(
        self,
        memory_required_mb: int = 512,
        container_name: str = "unknown",
        container_type: str = "generic",
        prefer_local: bool = True,
        exclude_peers: list[str] | None = None,
    ) -> PeerMetrics | None:
        """
        Select best peer using cognitive decision making.

        Falls back to standard routing if cognitive fails.
        """
        exclude = exclude_peers or []

        # Try cognitive placement first
        if self.prefer_cognitive:
            try:
                decision = await self._cognitive_placement(
                    memory_required_mb=memory_required_mb,
                    container_name=container_name,
                    container_type=container_type,
                    exclude_peers=exclude,
                )

                if decision and decision.peer_id:
                    # Validate peer is not excluded
                    if exclude and decision.peer_id in exclude:
                        logger.warning(
                            f"Cognitive suggested excluded peer {decision.peer_id}, falling back"
                        )
                    else:
                        peer = self.resource_monitor.get_peer_metrics(decision.peer_id)
                        if peer and peer.can_accept_container(memory_required_mb):
                            self._placement_history.append(decision)
                            logger.info(
                                f"Cognitive placement: {container_name} -> {decision.peer_id} "
                                f"({decision.reason})"
                            )
                            return peer

            except Exception as e:
                logger.warning(f"Cognitive placement failed, falling back: {e}")

        # Fallback to standard routing
        return await self._fallback_router.select_peer(
            memory_required_mb=memory_required_mb,
            prefer_local=prefer_local,
            exclude_peers=exclude,
        )

    async def _cognitive_placement(
        self,
        memory_required_mb: int,
        container_name: str,
        container_type: str,
        exclude_peers: list[str],
    ) -> PlacementDecision | None:
        """Use cognitive router for placement decision."""
        # Build cluster state for prompt
        peers = self.resource_monitor.get_all_metrics()
        cluster_state = self._format_cluster_state(peers, exclude_peers)

        prompt = PLACEMENT_PROMPT.format(
            cluster_state=cluster_state,
            container_name=container_name,
            memory_mb=memory_required_mb,
            container_type=container_type,
        )

        response = await self.cognitive_router.generate(
            prompt=prompt,
            max_tokens=150,
            temperature=0.3,  # Low temperature for consistent decisions
        )

        # Parse response
        try:
            # Extract JSON from response
            json_str = self._extract_json(response)
            data = json.loads(json_str)

            return PlacementDecision(
                peer_id=data.get("peer_id", ""),
                reason=data.get("reason", "Cognitive decision"),
                confidence=0.8,
            )
        except (json.JSONDecodeError, KeyError) as e:
            logger.warning(f"Failed to parse cognitive response: {e}")
            return None

    def _format_cluster_state(
        self,
        peers: list[PeerMetrics],
        exclude_peers: list[str],
    ) -> str:
        """Format cluster state for prompt."""
        lines = []
        for peer in peers:
            if peer.peer_id in exclude_peers:
                continue

            status = "✓" if peer.status == PeerStatus.ONLINE else "✗"
            lines.append(
                f"- {peer.peer_id} [{status}]: "
                f"CPU {peer.cpu_percent:.0f}%, "
                f"Mem {peer.memory_percent:.0f}%, "
                f"{peer.container_count} containers, "
                f"capacity {peer.available_capacity:.0f}%"
            )

        return "\n".join(lines) if lines else "No peers available"

    def _extract_json(self, text: str) -> str:
        """Extract JSON object from text."""
        # Find JSON object boundaries
        start = text.find("{")
        end = text.rfind("}") + 1
        if start >= 0 and end > start:
            return text[start:end]
        return "{}"

    async def should_migrate(
        self,
        container_name: str,
        source_peer: PeerMetrics,
        memory_mb: int = 512,
    ) -> MigrationDecision:
        """
        Decide if a container should be migrated using cognitive analysis.
        """
        # Get potential targets
        targets = self.resource_monitor.get_available_peers()
        if not targets:
            return MigrationDecision(
                should_migrate=False,
                target_peer_id=None,
                reason="No targets available",
            )

        # Build prompt
        targets_str = self._format_cluster_state(targets, [])
        prompt = MIGRATION_DECISION_PROMPT.format(
            source_peer=f"{source_peer.peer_id} (CPU {source_peer.cpu_percent:.0f}%, Mem {source_peer.memory_percent:.0f}%)",
            container_name=container_name,
            memory_mb=memory_mb,
            targets=targets_str,
        )

        try:
            response = await self.cognitive_router.generate(
                prompt=prompt,
                max_tokens=150,
                temperature=0.3,
            )

            json_str = self._extract_json(response)
            data = json.loads(json_str)

            decision = MigrationDecision(
                should_migrate=data.get("migrate", False),
                target_peer_id=data.get("target"),
                reason=data.get("reason", "Cognitive decision"),
            )

            self._migration_history.append(decision)
            return decision

        except Exception as e:
            logger.warning(f"Cognitive migration decision failed: {e}")
            return MigrationDecision(
                should_migrate=False,
                target_peer_id=None,
                reason=f"Cognitive error: {e}",
            )

    def get_placement_history(self, limit: int = 10) -> list[PlacementDecision]:
        """Get recent placement decisions."""
        return self._placement_history[-limit:]

    def get_migration_history(self, limit: int = 10) -> list[MigrationDecision]:
        """Get recent migration decisions."""
        return self._migration_history[-limit:]

    def get_cluster_summary(self) -> dict[str, Any]:
        """Get summary of cluster capacity (delegates to fallback router)."""
        return self._fallback_router.get_cluster_summary()


class OverloadPredictor:
    """
    Predicts peer overload using cognitive analysis.

    Analyzes metric trends to predict overload before it happens.
    """

    def __init__(
        self,
        resource_monitor: PeerResourceMonitor,
        cognitive_router=None,
        history_size: int = 12,  # 12 samples at 5s = 1 minute history
    ):
        self.resource_monitor = resource_monitor
        self.cognitive_router = cognitive_router or get_cognitive_router()
        self.history_size = history_size

        # Metric history per peer
        self._metric_history: dict[str, list[dict[str, Any]]] = {}

    def record_metrics(self, peer_id: str, metrics: PeerMetrics):
        """Record metrics sample for trend analysis."""
        if peer_id not in self._metric_history:
            self._metric_history[peer_id] = []

        history = self._metric_history[peer_id]
        history.append({
            "timestamp": time.time(),
            "cpu_percent": metrics.cpu_percent,
            "memory_percent": metrics.memory_percent,
            "container_count": metrics.container_count,
        })

        # Trim to history size
        if len(history) > self.history_size:
            self._metric_history[peer_id] = history[-self.history_size:]

    async def predict_overload(
        self,
        peer_id: str,
    ) -> OverloadPrediction:
        """
        Predict if a peer will become overloaded.

        Uses cognitive analysis of metric trends.
        """
        if peer_id not in self._metric_history:
            return OverloadPrediction(
                will_overload=False,
                confidence=0.0,
                reason="No history available",
            )

        history = self._metric_history[peer_id]
        if len(history) < 3:
            return OverloadPrediction(
                will_overload=False,
                confidence=0.0,
                reason="Insufficient history",
            )

        # Simple trend-based prediction (can be enhanced with cognitive)
        recent = history[-3:]
        cpu_trend = recent[-1]["cpu_percent"] - recent[0]["cpu_percent"]
        mem_trend = recent[-1]["memory_percent"] - recent[0]["memory_percent"]

        current = history[-1]
        current_cpu = current["cpu_percent"]
        current_mem = current["memory_percent"]

        # Quick heuristic check
        if current_cpu > 85 and cpu_trend > 5:
            return OverloadPrediction(
                will_overload=True,
                confidence=0.7,
                reason=f"CPU trending up: {current_cpu:.0f}% (+{cpu_trend:.0f}%)",
                predicted_time_seconds=60,
            )

        if current_mem > 85 and mem_trend > 5:
            return OverloadPrediction(
                will_overload=True,
                confidence=0.7,
                reason=f"Memory trending up: {current_mem:.0f}% (+{mem_trend:.0f}%)",
                predicted_time_seconds=60,
            )

        # Try cognitive prediction for edge cases
        try:
            prediction = await self._cognitive_prediction(peer_id, history)
            return prediction
        except Exception as e:
            logger.debug(f"Cognitive prediction failed: {e}")

        return OverloadPrediction(
            will_overload=False,
            confidence=0.5,
            reason="No overload predicted",
        )

    async def _cognitive_prediction(
        self,
        peer_id: str,
        history: list[dict[str, Any]],
    ) -> OverloadPrediction:
        """Use cognitive router for overload prediction."""
        # Format history for prompt
        history_str = "\n".join([
            f"- {h['timestamp']:.0f}: CPU {h['cpu_percent']:.0f}%, Mem {h['memory_percent']:.0f}%"
            for h in history[-5:]
        ])

        current = history[-1]
        current_str = f"CPU {current['cpu_percent']:.0f}%, Mem {current['memory_percent']:.0f}%"

        prompt = OVERLOAD_PREDICTION_PROMPT.format(
            metrics_history=history_str,
            current_metrics=current_str,
        )

        response = await self.cognitive_router.generate(
            prompt=prompt,
            max_tokens=100,
            temperature=0.2,
        )

        json_str = CognitiveCapacityRouter._extract_json(None, response)
        data = json.loads(json_str)

        return OverloadPrediction(
            will_overload=data.get("will_overload", False),
            confidence=data.get("confidence", 0.5),
            reason=data.get("reason", "Cognitive prediction"),
        )


# Patch method for extract_json
def _extract_json_patch(self, text: str) -> str:
    start = text.find("{")
    end = text.rfind("}") + 1
    if start >= 0 and end > start:
        return text[start:end]
    return "{}"

CognitiveCapacityRouter._extract_json = _extract_json_patch


class CognitiveLoadBalancer(LoadBalancer):
    """
    Load balancer with cognitive decision making.

    Extends LoadBalancer with:
    - Cognitive peer selection
    - Predictive overload detection
    - Learning from placement outcomes
    """

    def __init__(
        self,
        local_peer_id: str = "local",
        config: LoadBalancerConfig | None = None,
        migration_coordinator=None,
        cognitive_router=None,
    ):
        # Initialize base load balancer
        super().__init__(
            local_peer_id=local_peer_id,
            config=config,
            migration_coordinator=migration_coordinator,
        )

        # Replace capacity router with cognitive version
        self.capacity_router = CognitiveCapacityRouter(
            self.resource_monitor,
            cognitive_router=cognitive_router,
            prefer_cognitive=True,
            local_peer_id=local_peer_id,
        )

        # Add overload predictor
        self.overload_predictor = OverloadPredictor(
            self.resource_monitor,
            cognitive_router=cognitive_router,
        )

        # Track cognitive decisions
        self._prediction_history: list[OverloadPrediction] = []

    async def select_peer_for_boot(
        self,
        memory_required_mb: int = 512,
        container_name: str = "unknown",
        container_type: str = "generic",
    ) -> PeerMetrics | None:
        """
        Select best peer for container boot using cognitive analysis.
        """
        return await self.capacity_router.select_peer(
            memory_required_mb=memory_required_mb,
            container_name=container_name,
            container_type=container_type,
            prefer_local=self.config.prefer_local,
        )

    async def predict_peer_overload(
        self,
        peer_id: str,
    ) -> OverloadPrediction:
        """Predict if a peer will become overloaded."""
        # Record current metrics
        metrics = self.resource_monitor.get_peer_metrics(peer_id)
        if metrics:
            self.overload_predictor.record_metrics(peer_id, metrics)

        prediction = await self.overload_predictor.predict_overload(peer_id)
        self._prediction_history.append(prediction)

        return prediction

    async def check_all_peers_for_overload(self) -> dict[str, OverloadPrediction]:
        """Check all peers for potential overload."""
        predictions = {}
        for peer in self.resource_monitor.get_all_metrics():
            pred = await self.predict_peer_overload(peer.peer_id)
            if pred.will_overload:
                predictions[peer.peer_id] = pred
                logger.warning(
                    f"Overload predicted for {peer.peer_id}: {pred.reason}"
                )
        return predictions

    def get_decision_history(self) -> dict[str, Any]:
        """Get history of cognitive decisions."""
        router = self.capacity_router
        if isinstance(router, CognitiveCapacityRouter):
            return {
                "placements": [
                    {
                        "peer_id": d.peer_id,
                        "reason": d.reason,
                        "timestamp": d.timestamp,
                    }
                    for d in router.get_placement_history(20)
                ],
                "migrations": [
                    {
                        "should_migrate": d.should_migrate,
                        "target": d.target_peer_id,
                        "reason": d.reason,
                    }
                    for d in router.get_migration_history(20)
                ],
                "predictions": [
                    {
                        "will_overload": p.will_overload,
                        "confidence": p.confidence,
                        "reason": p.reason,
                    }
                    for p in self._prediction_history[-20:]
                ],
            }
        return {}


# Convenience function
def create_cognitive_load_balancer(
    local_peer_id: str = "local",
    migration_coordinator=None,
    prefer_local: bool = True,
) -> CognitiveLoadBalancer:
    """Create a fully configured cognitive load balancer."""
    config = LoadBalancerConfig(
        prefer_local=prefer_local,
        cpu_threshold=85.0,
        memory_threshold=85.0,
    )
    return CognitiveLoadBalancer(
        local_peer_id=local_peer_id,
        config=config,
        migration_coordinator=migration_coordinator,
    )
