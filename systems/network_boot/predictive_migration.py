"""
Predictive Migration - Phase 29

Time-series forecasting for proactive overload detection and pre-emptive migration.

Usage:
    from systems.network_boot.predictive_migration import (
        TimeSeriesForecaster,
        PreemptiveMigrator,
        PredictionAccuracyTracker,
        PredictiveLoadBalancer,
    )

    # Create predictive system
    forecaster = TimeSeriesForecaster(history_size=60)  # 5 min at 5s intervals
    migrator = PreemptiveMigrator(forecaster, migration_coordinator)

    # Start predictive monitoring
    await migrator.start()
"""

import asyncio
import logging
import time
from collections import deque
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.network_boot.cognitive_load_balancing import (
    CognitiveLoadBalancer,
)
from systems.network_boot.load_balancing import (
    CapacityRouter,
    PeerMetrics,
    PeerResourceMonitor,
)

logger = logging.getLogger("PredictiveMigration")


class PredictionMethod(Enum):
    """Methods for time-series prediction."""
    LINEAR = "linear"              # Simple linear regression
    EXPONENTIAL = "exponential"    # Exponential smoothing
    MOVING_AVG = "moving_avg"      # Moving average
    COGNITIVE = "cognitive"        # LLM-based prediction


@dataclass
class MetricSample:
    """Single metric sample for time-series analysis."""
    timestamp: float
    cpu_percent: float
    memory_percent: float
    container_count: int


@dataclass
class TrendAnalysis:
    """Result of trend analysis on a metric series."""
    metric_name: str
    current_value: float
    trend_direction: float  # -1 (down), 0 (stable), +1 (up)
    trend_rate: float       # Change per second
    predicted_value_30s: float
    predicted_value_60s: float
    confidence: float
    method: PredictionMethod


@dataclass
class PredictionResult:
    """Complete prediction result for a peer."""
    peer_id: str
    will_overload: bool
    predicted_time_seconds: float | None
    cpu_trend: TrendAnalysis | None = None
    memory_trend: TrendAnalysis | None = None
    confidence: float = 0.0
    method: PredictionMethod = PredictionMethod.LINEAR
    timestamp: float = field(default_factory=time.time)

    @property
    def urgency(self) -> str:
        """Get urgency level for migration."""
        if not self.will_overload:
            return "none"
        if self.predicted_time_seconds is None:
            return "unknown"
        if self.predicted_time_seconds < 30:
            return "critical"
        if self.predicted_time_seconds < 60:
            return "high"
        if self.predicted_time_seconds < 120:
            return "medium"
        return "low"


@dataclass
class PredictionAccuracy:
    """Tracks prediction accuracy over time."""
    prediction_id: str
    peer_id: str
    predicted_overload: bool
    predicted_time: float | None
    actual_overload: bool
    actual_time: float | None
    prediction_timestamp: float
    verification_timestamp: float

    @property
    def was_correct(self) -> bool:
        """Check if prediction was correct."""
        return self.predicted_overload == self.actual_overload

    @property
    def time_error_seconds(self) -> float | None:
        """Get time prediction error."""
        if self.predicted_time is None or self.actual_time is None:
            return None
        return abs(self.predicted_time - self.actual_time)


class TimeSeriesForecaster:
    """
    Time-series forecasting for resource metrics.

    Supports multiple prediction methods:
    - Linear regression for simple trends
    - Exponential smoothing for noisy data
    - Moving average for stable patterns
    - Cognitive (LLM) for complex patterns
    """

    def __init__(
        self,
        history_size: int = 60,  # 60 samples at 5s = 5 minutes
        sample_interval: float = 5.0,
        overload_threshold_cpu: float = 90.0,
        overload_threshold_memory: float = 90.0,
        prediction_method: PredictionMethod = PredictionMethod.LINEAR,
    ):
        self.history_size = history_size
        self.sample_interval = sample_interval
        self.overload_threshold_cpu = overload_threshold_cpu
        self.overload_threshold_memory = overload_threshold_memory
        self.prediction_method = prediction_method

        # History per peer: peer_id -> deque of MetricSample
        self._history: dict[str, deque] = {}

    def record_sample(self, peer_id: str, metrics: PeerMetrics):
        """Record a metric sample for a peer."""
        if peer_id not in self._history:
            self._history[peer_id] = deque(maxlen=self.history_size)

        sample = MetricSample(
            timestamp=time.time(),
            cpu_percent=metrics.cpu_percent,
            memory_percent=metrics.memory_percent,
            container_count=metrics.container_count,
        )
        self._history[peer_id].append(sample)

    def get_history(self, peer_id: str) -> list[MetricSample]:
        """Get metric history for a peer."""
        if peer_id not in self._history:
            return []
        return list(self._history[peer_id])

    def predict(self, peer_id: str) -> PredictionResult:
        """
        Generate prediction for a peer.

        Returns prediction about whether and when the peer will overload.
        """
        history = self.get_history(peer_id)

        if len(history) < 3:
            return PredictionResult(
                peer_id=peer_id,
                will_overload=False,
                predicted_time_seconds=None,
                confidence=0.0,
                method=self.prediction_method,
            )

        # Analyze CPU trend
        cpu_trend = self._analyze_trend(
            [(s.timestamp, s.cpu_percent) for s in history],
            "cpu_percent",
        )

        # Analyze memory trend
        memory_trend = self._analyze_trend(
            [(s.timestamp, s.memory_percent) for s in history],
            "memory_percent",
        )

        # Determine if overload predicted
        will_overload = False
        predicted_time = None

        # Check CPU prediction
        if cpu_trend.predicted_value_60s > self.overload_threshold_cpu:
            will_overload = True
            cpu_time = self._estimate_time_to_threshold(
                cpu_trend,
                self.overload_threshold_cpu,
            )
            if predicted_time is None or (cpu_time and cpu_time < predicted_time):
                predicted_time = cpu_time

        # Check memory prediction
        if memory_trend.predicted_value_60s > self.overload_threshold_memory:
            will_overload = True
            mem_time = self._estimate_time_to_threshold(
                memory_trend,
                self.overload_threshold_memory,
            )
            if predicted_time is None or (mem_time and mem_time < predicted_time):
                predicted_time = mem_time

        # Calculate confidence based on trend consistency
        confidence = self._calculate_confidence(cpu_trend, memory_trend, history)

        return PredictionResult(
            peer_id=peer_id,
            will_overload=will_overload,
            predicted_time_seconds=predicted_time,
            cpu_trend=cpu_trend,
            memory_trend=memory_trend,
            confidence=confidence,
            method=self.prediction_method,
        )

    def _analyze_trend(
        self,
        data: list[tuple[float, float]],
        metric_name: str,
    ) -> TrendAnalysis:
        """Analyze trend in time-series data."""
        if len(data) < 2:
            return TrendAnalysis(
                metric_name=metric_name,
                current_value=data[-1][1] if data else 0,
                trend_direction=0,
                trend_rate=0,
                predicted_value_30s=data[-1][1] if data else 0,
                predicted_value_60s=data[-1][1] if data else 0,
                confidence=0,
                method=self.prediction_method,
            )

        # Use selected prediction method
        if self.prediction_method == PredictionMethod.LINEAR:
            return self._linear_regression(data, metric_name)
        elif self.prediction_method == PredictionMethod.EXPONENTIAL:
            return self._exponential_smoothing(data, metric_name)
        elif self.prediction_method == PredictionMethod.MOVING_AVG:
            return self._moving_average(data, metric_name)
        else:
            return self._linear_regression(data, metric_name)

    def _linear_regression(
        self,
        data: list[tuple[float, float]],
        metric_name: str,
    ) -> TrendAnalysis:
        """Simple linear regression for trend prediction."""
        n = len(data)
        if n < 2:
            current = data[-1][1] if data else 0
            return TrendAnalysis(
                metric_name=metric_name,
                current_value=current,
                trend_direction=0,
                trend_rate=0,
                predicted_value_30s=current,
                predicted_value_60s=current,
                confidence=0,
                method=PredictionMethod.LINEAR,
            )

        # Convert to relative time
        t0 = data[0][0]
        x = [d[0] - t0 for d in data]
        y = [d[1] for d in data]

        # Calculate linear regression
        sum_x = sum(x)
        sum_y = sum(y)
        sum_xy = sum(xi * yi for xi, yi in zip(x, y))
        sum_xx = sum(xi * xi for xi in x)

        denominator = n * sum_xx - sum_x * sum_x
        if denominator == 0:
            slope = 0
            intercept = sum_y / n
        else:
            slope = (n * sum_xy - sum_x * sum_y) / denominator
            intercept = (sum_y - slope * sum_x) / n

        current_value = y[-1]
        trend_direction = 1 if slope > 0.1 else (-1 if slope < -0.1 else 0)
        trend_rate = slope  # Change per second

        # Predict future values
        current_time = x[-1]
        predicted_30s = intercept + slope * (current_time + 30)
        predicted_60s = intercept + slope * (current_time + 60)

        # Clamp predictions to reasonable range
        predicted_30s = max(0, min(100, predicted_30s))
        predicted_60s = max(0, min(100, predicted_60s))

        # Calculate R² for confidence
        y_mean = sum_y / n
        ss_tot = sum((yi - y_mean) ** 2 for yi in y)
        ss_res = sum((yi - (intercept + slope * xi)) ** 2 for xi, yi in zip(x, y))
        r_squared = 1 - (ss_res / ss_tot) if ss_tot > 0 else 0

        return TrendAnalysis(
            metric_name=metric_name,
            current_value=current_value,
            trend_direction=trend_direction,
            trend_rate=trend_rate,
            predicted_value_30s=predicted_30s,
            predicted_value_60s=predicted_60s,
            confidence=max(0, min(1, r_squared)),
            method=PredictionMethod.LINEAR,
        )

    def _exponential_smoothing(
        self,
        data: list[tuple[float, float]],
        metric_name: str,
        alpha: float = 0.3,
    ) -> TrendAnalysis:
        """Exponential smoothing for trend prediction."""
        if len(data) < 2:
            current = data[-1][1] if data else 0
            return TrendAnalysis(
                metric_name=metric_name,
                current_value=current,
                trend_direction=0,
                trend_rate=0,
                predicted_value_30s=current,
                predicted_value_60s=current,
                confidence=0,
                method=PredictionMethod.EXPONENTIAL,
            )

        values = [d[1] for d in data]

        # Simple exponential smoothing
        smoothed = values[0]
        for v in values[1:]:
            smoothed = alpha * v + (1 - alpha) * smoothed

        # Estimate trend from smoothed values
        recent_smooth = []
        s = values[0]
        for v in values:
            s = alpha * v + (1 - alpha) * s
            recent_smooth.append(s)

        # Trend from last few smoothed values
        if len(recent_smooth) >= 3:
            trend = (recent_smooth[-1] - recent_smooth[-3]) / (2 * self.sample_interval)
        else:
            trend = 0

        current_value = values[-1]
        trend_direction = 1 if trend > 0.1 else (-1 if trend < -0.1 else 0)

        # Predict future values (exponential decay of trend)
        predicted_30s = current_value + trend * 30 * 0.8  # Decay factor
        predicted_60s = current_value + trend * 60 * 0.6

        predicted_30s = max(0, min(100, predicted_30s))
        predicted_60s = max(0, min(100, predicted_60s))

        return TrendAnalysis(
            metric_name=metric_name,
            current_value=current_value,
            trend_direction=trend_direction,
            trend_rate=trend,
            predicted_value_30s=predicted_30s,
            predicted_value_60s=predicted_60s,
            confidence=0.6,  # Moderate confidence for exponential
            method=PredictionMethod.EXPONENTIAL,
        )

    def _moving_average(
        self,
        data: list[tuple[float, float]],
        metric_name: str,
        window: int = 5,
    ) -> TrendAnalysis:
        """Moving average for trend prediction."""
        if len(data) < 2:
            current = data[-1][1] if data else 0
            return TrendAnalysis(
                metric_name=metric_name,
                current_value=current,
                trend_direction=0,
                trend_rate=0,
                predicted_value_30s=current,
                predicted_value_60s=current,
                confidence=0,
                method=PredictionMethod.MOVING_AVG,
            )

        values = [d[1] for d in data]

        # Calculate moving average
        if len(values) < window:
            ma = sum(values) / len(values)
        else:
            ma = sum(values[-window:]) / window

        # Calculate trend from MA difference
        if len(values) >= window * 2:
            prev_ma = sum(values[-window*2:-window]) / window
            trend = (ma - prev_ma) / (window * self.sample_interval)
        else:
            trend = 0

        current_value = values[-1]
        trend_direction = 1 if trend > 0.1 else (-1 if trend < -0.1 else 0)

        # Predict using trend continuation
        predicted_30s = ma + trend * 30
        predicted_60s = ma + trend * 60

        predicted_30s = max(0, min(100, predicted_30s))
        predicted_60s = max(0, min(100, predicted_60s))

        return TrendAnalysis(
            metric_name=metric_name,
            current_value=current_value,
            trend_direction=trend_direction,
            trend_rate=trend,
            predicted_value_30s=predicted_30s,
            predicted_value_60s=predicted_60s,
            confidence=0.5,
            method=PredictionMethod.MOVING_AVG,
        )

    def _estimate_time_to_threshold(
        self,
        trend: TrendAnalysis,
        threshold: float,
    ) -> float | None:
        """Estimate time until threshold is reached."""
        if trend.trend_rate <= 0:
            return None  # Not trending up

        remaining = threshold - trend.current_value
        if remaining <= 0:
            return 0  # Already at or above threshold

        return remaining / trend.trend_rate

    def _calculate_confidence(
        self,
        cpu_trend: TrendAnalysis,
        memory_trend: TrendAnalysis,
        history: list[MetricSample],
    ) -> float:
        """Calculate overall confidence in prediction."""
        # Base confidence on:
        # 1. Amount of data
        # 2. Trend consistency (R²)
        # 3. Agreement between CPU and memory trends

        data_factor = min(1.0, len(history) / 12)  # Full confidence at 1 min of data
        cpu_confidence = cpu_trend.confidence
        mem_confidence = memory_trend.confidence

        # Agreement factor
        if cpu_trend.trend_direction == memory_trend.trend_direction:
            agreement = 1.0
        else:
            agreement = 0.7

        return data_factor * ((cpu_confidence + mem_confidence) / 2) * agreement


class PredictionAccuracyTracker:
    """
    Tracks prediction accuracy over time.

    Records predictions and verifies them against actual outcomes.
    """

    def __init__(self, verification_delay: float = 60.0):
        self.verification_delay = verification_delay

        # Pending verifications: prediction_id -> (prediction, verify_time)
        self._pending: dict[str, tuple[PredictionResult, float]] = {}

        # Completed verifications
        self._completed: list[PredictionAccuracy] = []

        # Statistics
        self._total_predictions = 0
        self._correct_predictions = 0

    def record_prediction(self, prediction: PredictionResult) -> str:
        """Record a prediction for later verification."""
        prediction_id = f"{prediction.peer_id}-{int(time.time() * 1000)}"

        self._pending[prediction_id] = (
            prediction,
            time.time() + self.verification_delay,
        )
        self._total_predictions += 1

        return prediction_id

    def verify_predictions(self, current_metrics: dict[str, PeerMetrics]):
        """
        Verify pending predictions against current state.

        Args:
            current_metrics: Current metrics by peer_id
        """
        now = time.time()
        to_verify = []

        for pred_id, (prediction, verify_time) in list(self._pending.items()):
            if now >= verify_time:
                to_verify.append(pred_id)

        for pred_id in to_verify:
            prediction, _ = self._pending.pop(pred_id)

            peer_id = prediction.peer_id
            if peer_id not in current_metrics:
                continue

            metrics = current_metrics[peer_id]

            # Check if overload actually happened
            actual_overload = (
                metrics.cpu_percent > 90 or
                metrics.memory_percent > 90
            )

            accuracy = PredictionAccuracy(
                prediction_id=pred_id,
                peer_id=peer_id,
                predicted_overload=prediction.will_overload,
                predicted_time=prediction.predicted_time_seconds,
                actual_overload=actual_overload,
                actual_time=None,  # Would need to track when overload occurred
                prediction_timestamp=prediction.timestamp,
                verification_timestamp=now,
            )

            self._completed.append(accuracy)

            if accuracy.was_correct:
                self._correct_predictions += 1

    @property
    def accuracy_rate(self) -> float:
        """Get current accuracy rate."""
        if self._total_predictions == 0:
            return 0.0
        return self._correct_predictions / self._total_predictions

    def get_statistics(self) -> dict[str, Any]:
        """Get accuracy statistics."""
        if not self._completed:
            return {
                "total_predictions": self._total_predictions,
                "verified": 0,
                "accuracy_rate": 0.0,
                "true_positives": 0,
                "false_positives": 0,
                "true_negatives": 0,
                "false_negatives": 0,
            }

        tp = sum(1 for a in self._completed if a.predicted_overload and a.actual_overload)
        fp = sum(1 for a in self._completed if a.predicted_overload and not a.actual_overload)
        tn = sum(1 for a in self._completed if not a.predicted_overload and not a.actual_overload)
        fn = sum(1 for a in self._completed if not a.predicted_overload and a.actual_overload)

        return {
            "total_predictions": self._total_predictions,
            "verified": len(self._completed),
            "accuracy_rate": self.accuracy_rate,
            "true_positives": tp,
            "false_positives": fp,
            "true_negatives": tn,
            "false_negatives": fn,
            "precision": tp / (tp + fp) if (tp + fp) > 0 else 0,
            "recall": tp / (tp + fn) if (tp + fn) > 0 else 0,
        }


class PreemptiveMigrator:
    """
    Triggers pre-emptive migrations based on overload predictions.

    Monitors predictions and initiates migration when:
    - Overload is predicted with high confidence
    - Time to overload is below threshold
    - Migration target is available
    """

    def __init__(
        self,
        forecaster: TimeSeriesForecaster,
        resource_monitor: PeerResourceMonitor,
        migration_coordinator=None,
        capacity_router: CapacityRouter | None = None,
        urgency_threshold: str = "medium",  # critical, high, medium, low
        min_prediction_confidence: float = 0.6,
    ):
        self.forecaster = forecaster
        self.resource_monitor = resource_monitor
        self.migration_coordinator = migration_coordinator
        self.capacity_router = capacity_router
        self.urgency_threshold = urgency_threshold
        self.min_prediction_confidence = min_prediction_confidence

        self.accuracy_tracker = PredictionAccuracyTracker()

        self._running = False
        self._monitor_task: asyncio.Task | None = None
        self._migration_callbacks: list[Callable] = []

        # Track recent predictions
        self._recent_predictions: dict[str, PredictionResult] = {}

    def add_migration_callback(self, callback: Callable):
        """Add callback for when pre-emptive migration is triggered."""
        self._migration_callbacks.append(callback)

    async def start(self, interval: float = 5.0):
        """Start predictive monitoring."""
        if self._running:
            return

        self._running = True
        self._monitor_task = asyncio.create_task(self._monitor_loop(interval))
        logger.info("Started preemptive migration monitoring")

    async def stop(self):
        """Stop predictive monitoring."""
        self._running = False
        if self._monitor_task:
            self._monitor_task.cancel()
            try:
                await self._monitor_task
            except asyncio.CancelledError:
                pass
        logger.info("Stopped preemptive migration monitoring")

    async def _monitor_loop(self, interval: float):
        """Main monitoring loop."""
        while self._running:
            try:
                await self._check_predictions()
                await asyncio.sleep(interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Error in prediction loop: {e}")
                await asyncio.sleep(1.0)

    async def _check_predictions(self):
        """Check all peers for predicted overload."""
        urgency_order = {"critical": 0, "high": 1, "medium": 2, "low": 3, "none": 4, "unknown": 5}
        threshold_level = urgency_order.get(self.urgency_threshold, 2)

        for peer in self.resource_monitor.get_all_metrics():
            # Record sample
            self.forecaster.record_sample(peer.peer_id, peer)

            # Generate prediction
            prediction = self.forecaster.predict(peer.peer_id)
            self._recent_predictions[peer.peer_id] = prediction

            # Record for accuracy tracking
            self.accuracy_tracker.record_prediction(prediction)

            # Check if migration needed
            prediction_level = urgency_order.get(prediction.urgency, 5)

            if prediction_level <= threshold_level and prediction.confidence >= self.min_prediction_confidence:
                logger.warning(
                    f"Pre-emptive migration triggered for {peer.peer_id}: "
                    f"overload predicted in {prediction.predicted_time_seconds:.0f}s "
                    f"(confidence: {prediction.confidence:.0%})"
                )

                # Notify callbacks
                for callback in self._migration_callbacks:
                    try:
                        await callback(peer, prediction)
                    except Exception as e:
                        logger.error(f"Migration callback error: {e}")

                # Trigger migration if coordinator available
                if self.migration_coordinator and self.capacity_router:
                    await self._initiate_preemptive_migration(peer, prediction)

        # Verify past predictions
        current = {p.peer_id: p for p in self.resource_monitor.get_all_metrics()}
        self.accuracy_tracker.verify_predictions(current)

    async def _initiate_preemptive_migration(
        self,
        source_peer: PeerMetrics,
        prediction: PredictionResult,
    ):
        """Initiate pre-emptive migration from predicted-to-overload peer."""
        # Find target
        target = await self.capacity_router.find_migration_target(
            source_peer.peer_id,
            memory_required_mb=512,
        )

        if not target:
            logger.warning(
                f"No migration target available for pre-emptive migration from {source_peer.peer_id}"
            )
            return

        logger.info(
            f"Pre-emptive migration: {source_peer.peer_id} -> {target.peer_id} "
            f"(predicted overload in {prediction.predicted_time_seconds:.0f}s)"
        )

        # Actual migration would be triggered here
        # await self.migration_coordinator.migrate(...)

    def get_prediction(self, peer_id: str) -> PredictionResult | None:
        """Get most recent prediction for a peer."""
        return self._recent_predictions.get(peer_id)

    def get_all_predictions(self) -> dict[str, PredictionResult]:
        """Get all recent predictions."""
        return self._recent_predictions.copy()

    def get_accuracy_stats(self) -> dict[str, Any]:
        """Get prediction accuracy statistics."""
        return self.accuracy_tracker.get_statistics()


class PredictiveLoadBalancer(CognitiveLoadBalancer):
    """
    Complete predictive load balancer.

    Combines:
    - Cognitive decision making (from CognitiveLoadBalancer)
    - Time-series forecasting (TimeSeriesForecaster)
    - Pre-emptive migration (PreemptiveMigrator)
    - Accuracy tracking (PredictionAccuracyTracker)
    """

    def __init__(
        self,
        local_peer_id: str = "local",
        config=None,
        migration_coordinator=None,
        cognitive_router=None,
        prediction_method: PredictionMethod = PredictionMethod.LINEAR,
    ):
        # Initialize base cognitive load balancer
        super().__init__(
            local_peer_id=local_peer_id,
            config=config,
            migration_coordinator=migration_coordinator,
            cognitive_router=cognitive_router,
        )

        # Add predictive components
        self.forecaster = TimeSeriesForecaster(
            prediction_method=prediction_method,
        )

        self.preemptive_migrator = PreemptiveMigrator(
            forecaster=self.forecaster,
            resource_monitor=self.resource_monitor,
            migration_coordinator=migration_coordinator,
            capacity_router=self.capacity_router,
        )

    async def start(self):
        """Start all monitoring."""
        await super().start()
        await self.preemptive_migrator.start()

    async def stop(self):
        """Stop all monitoring."""
        await self.preemptive_migrator.stop()
        await super().stop()

    def get_prediction(self, peer_id: str) -> PredictionResult | None:
        """Get prediction for a peer."""
        return self.preemptive_migrator.get_prediction(peer_id)

    def get_cluster_predictions(self) -> dict[str, PredictionResult]:
        """Get predictions for all peers."""
        return self.preemptive_migrator.get_all_predictions()

    def get_prediction_accuracy(self) -> dict[str, Any]:
        """Get prediction accuracy statistics."""
        return self.preemptive_migrator.get_accuracy_stats()

    def get_status(self) -> dict[str, Any]:
        """Get complete status including predictions."""
        status = super().get_cluster_status()

        # Add prediction data
        predictions = self.get_cluster_predictions()
        accuracy = self.get_prediction_accuracy()

        status["predictions"] = {
            peer_id: {
                "will_overload": p.will_overload,
                "predicted_time": p.predicted_time_seconds,
                "urgency": p.urgency,
                "confidence": p.confidence,
            }
            for peer_id, p in predictions.items()
        }

        status["prediction_accuracy"] = accuracy

        return status


# Convenience function
def create_predictive_load_balancer(
    local_peer_id: str = "local",
    migration_coordinator=None,
    prefer_local: bool = True,
    prediction_method: PredictionMethod = PredictionMethod.LINEAR,
) -> PredictiveLoadBalancer:
    """Create a fully configured predictive load balancer."""
    from systems.network_boot.load_balancing import LoadBalancerConfig

    config = LoadBalancerConfig(
        prefer_local=prefer_local,
    )

    return PredictiveLoadBalancer(
        local_peer_id=local_peer_id,
        config=config,
        migration_coordinator=migration_coordinator,
        prediction_method=prediction_method,
    )
