"""
Tests for Predictive Migration (Phase 29)

Tests time-series forecasting and pre-emptive migration capabilities.
"""

import asyncio
import time

import pytest

from systems.network_boot.load_balancing import (
    PeerMetrics,
    PeerResourceMonitor,
)
from systems.network_boot.predictive_migration import (
    MetricSample,
    PredictionAccuracy,
    PredictionAccuracyTracker,
    PredictionMethod,
    PredictionResult,
    PredictiveLoadBalancer,
    PreemptiveMigrator,
    TimeSeriesForecaster,
    TrendAnalysis,
    create_predictive_load_balancer,
)


class TestMetricSample:
    """Tests for MetricSample dataclass."""

    def test_sample_creation(self):
        sample = MetricSample(
            timestamp=time.time(),
            cpu_percent=50.0,
            memory_percent=60.0,
            container_count=3,
        )
        assert sample.cpu_percent == 50.0
        assert sample.memory_percent == 60.0
        assert sample.container_count == 3


class TestTrendAnalysis:
    """Tests for TrendAnalysis dataclass."""

    def test_trend_creation(self):
        trend = TrendAnalysis(
            metric_name="cpu_percent",
            current_value=60.0,
            trend_direction=1,
            trend_rate=0.5,
            predicted_value_30s=75.0,
            predicted_value_60s=90.0,
            confidence=0.85,
            method=PredictionMethod.LINEAR,
        )
        assert trend.trend_direction == 1
        assert trend.trend_rate == 0.5
        assert trend.predicted_value_60s == 90.0


class TestPredictionResult:
    """Tests for PredictionResult dataclass."""

    def test_result_no_overload(self):
        result = PredictionResult(
            peer_id="peer-1",
            will_overload=False,
            predicted_time_seconds=None,
            confidence=0.8,
        )
        assert result.will_overload is False
        assert result.urgency == "none"

    def test_result_critical_urgency(self):
        result = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=15.0,
            confidence=0.9,
        )
        assert result.urgency == "critical"

    def test_result_high_urgency(self):
        result = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=45.0,
            confidence=0.8,
        )
        assert result.urgency == "high"

    def test_result_medium_urgency(self):
        result = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=90.0,
            confidence=0.7,
        )
        assert result.urgency == "medium"

    def test_result_low_urgency(self):
        result = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=150.0,
            confidence=0.6,
        )
        assert result.urgency == "low"


class TestPredictionAccuracy:
    """Tests for PredictionAccuracy dataclass."""

    def test_correct_prediction(self):
        accuracy = PredictionAccuracy(
            prediction_id="pred-1",
            peer_id="peer-1",
            predicted_overload=True,
            predicted_time=60.0,
            actual_overload=True,
            actual_time=55.0,
            prediction_timestamp=time.time() - 60,
            verification_timestamp=time.time(),
        )
        assert accuracy.was_correct is True
        assert accuracy.time_error_seconds == 5.0

    def test_incorrect_prediction(self):
        accuracy = PredictionAccuracy(
            prediction_id="pred-2",
            peer_id="peer-1",
            predicted_overload=True,
            predicted_time=60.0,
            actual_overload=False,
            actual_time=None,
            prediction_timestamp=time.time() - 60,
            verification_timestamp=time.time(),
        )
        assert accuracy.was_correct is False


class TestTimeSeriesForecaster:
    """Tests for TimeSeriesForecaster."""

    @pytest.fixture
    def forecaster(self):
        return TimeSeriesForecaster(
            history_size=60,
            prediction_method=PredictionMethod.LINEAR,
        )

    def test_forecaster_creation(self, forecaster):
        assert forecaster.history_size == 60
        assert forecaster.prediction_method == PredictionMethod.LINEAR

    def test_record_sample(self, forecaster):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
            container_count=3,
        )

        forecaster.record_sample("peer-1", metrics)

        history = forecaster.get_history("peer-1")
        assert len(history) == 1
        assert history[0].cpu_percent == 50.0

    def test_record_multiple_samples(self, forecaster):
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
        )

        for i in range(10):
            forecaster.record_sample("peer-1", metrics)

        history = forecaster.get_history("peer-1")
        assert len(history) == 10

    def test_history_size_limit(self, forecaster):
        forecaster = TimeSeriesForecaster(history_size=5)
        metrics = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
        )

        for i in range(10):
            forecaster.record_sample("peer-1", metrics)

        history = forecaster.get_history("peer-1")
        assert len(history) == 5

    def test_predict_insufficient_data(self, forecaster):
        result = forecaster.predict("unknown-peer")

        assert result.will_overload is False
        assert result.confidence == 0.0

    def test_predict_stable_metrics(self, forecaster):
        # Record stable metrics
        for i in range(10):
            forecaster.record_sample("peer-1", PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=50.0,
                memory_percent=60.0,
            ))

        result = forecaster.predict("peer-1")

        assert result.will_overload is False
        assert result.cpu_trend is not None
        assert result.memory_trend is not None

    def test_predict_rising_cpu(self, forecaster):
        # Record rising CPU metrics
        for cpu in [50, 55, 60, 65, 70, 75, 80, 85, 88, 92]:
            forecaster.record_sample("peer-1", PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=float(cpu),
                memory_percent=50.0,
            ))

        result = forecaster.predict("peer-1")

        # Should predict overload
        assert result.will_overload is True
        assert result.cpu_trend.trend_direction == 1
        assert result.predicted_time_seconds is not None

    def test_predict_rising_memory(self, forecaster):
        # Record rising memory metrics
        for mem in [50, 55, 60, 65, 70, 75, 80, 85, 88, 92]:
            forecaster.record_sample("peer-1", PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=50.0,
                memory_percent=float(mem),
            ))

        result = forecaster.predict("peer-1")

        assert result.will_overload is True
        assert result.memory_trend.trend_direction == 1

    def test_linear_regression(self, forecaster):
        # Create linear trend data
        data = [(i, 50.0 + i * 2) for i in range(10)]

        trend = forecaster._linear_regression(
            [(0, d[0]) for d in data],  # timestamps (relative)
            "test_metric",
        )

        # Actually test with proper format
        timestamps = list(range(10))
        values = [50.0 + i * 2 for i in range(10)]
        formatted_data = list(zip(timestamps, values))

        trend = forecaster._linear_regression(formatted_data, "cpu")

        assert trend.trend_direction == 1
        assert trend.current_value == 68.0  # Last value

    def test_exponential_smoothing(self, forecaster):
        data = [(i, 50.0 + (i % 3) * 5) for i in range(10)]

        trend = forecaster._exponential_smoothing(data, "test")

        assert trend.method == PredictionMethod.EXPONENTIAL
        assert trend.current_value >= 0

    def test_moving_average(self, forecaster):
        data = [(i, 50.0 + i) for i in range(10)]

        trend = forecaster._moving_average(data, "test")

        assert trend.method == PredictionMethod.MOVING_AVG


class TestPredictionAccuracyTracker:
    """Tests for PredictionAccuracyTracker."""

    @pytest.fixture
    def tracker(self):
        return PredictionAccuracyTracker(verification_delay=0.1)

    def test_record_prediction(self, tracker):
        prediction = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=60.0,
            confidence=0.8,
        )

        pred_id = tracker.record_prediction(prediction)
        assert pred_id is not None
        assert tracker._total_predictions == 1

    def test_verify_correct_prediction(self, tracker):
        # Record prediction that will be correct
        prediction = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=60.0,
            confidence=0.8,
        )
        tracker.record_prediction(prediction)

        # Wait for verification delay
        time.sleep(0.15)

        # Verify with overloaded metrics
        current = {
            "peer-1": PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=95.0,
                memory_percent=60.0,
            )
        }

        tracker.verify_predictions(current)

        assert len(tracker._completed) == 1
        assert tracker._completed[0].was_correct is True

    def test_verify_incorrect_prediction(self, tracker):
        # Predict overload but metrics stay stable
        prediction = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=60.0,
            confidence=0.8,
        )
        tracker.record_prediction(prediction)

        time.sleep(0.15)

        # Verify with stable metrics (no overload)
        current = {
            "peer-1": PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=50.0,
                memory_percent=60.0,
            )
        }

        tracker.verify_predictions(current)

        assert len(tracker._completed) == 1
        assert tracker._completed[0].was_correct is False

    def test_accuracy_statistics(self, tracker):
        # Record multiple predictions
        for i in range(4):
            prediction = PredictionResult(
                peer_id=f"peer-{i}",
                will_overload=i < 2,  # First 2 predict overload
                predicted_time_seconds=60.0,
                confidence=0.8,
            )
            tracker.record_prediction(prediction)

        time.sleep(0.15)

        # Verify: first 2 overloaded, last 2 didn't
        current = {}
        for i in range(4):
            current[f"peer-{i}"] = PeerMetrics(
                peer_id=f"peer-{i}",
                hostname=f"peer{i}.local",
                cpu_percent=95.0 if i < 2 else 50.0,
                memory_percent=50.0,
            )

        tracker.verify_predictions(current)

        stats = tracker.get_statistics()
        assert stats["verified"] == 4
        assert stats["accuracy_rate"] == 1.0  # All correct
        assert stats["true_positives"] == 2
        assert stats["true_negatives"] == 2


class TestPreemptiveMigrator:
    """Tests for PreemptiveMigrator."""

    @pytest.fixture
    def forecaster(self):
        return TimeSeriesForecaster()

    @pytest.fixture
    def monitor(self):
        monitor = PeerResourceMonitor(local_peer_id="local")
        return monitor

    @pytest.fixture
    def migrator(self, forecaster, monitor):
        return PreemptiveMigrator(
            forecaster=forecaster,
            resource_monitor=monitor,
        )

    def test_migrator_creation(self, migrator):
        assert migrator.forecaster is not None
        assert migrator.resource_monitor is not None
        assert migrator.accuracy_tracker is not None

    def test_add_callback(self, migrator):
        callback_called = []

        async def callback(peer, prediction):
            callback_called.append(peer.peer_id)

        migrator.add_migration_callback(callback)
        assert len(migrator._migration_callbacks) == 1

    @pytest.mark.asyncio
    async def test_start_stop(self, migrator):
        await migrator.start(interval=0.1)
        assert migrator._running is True

        await asyncio.sleep(0.2)

        await migrator.stop()
        assert migrator._running is False

    @pytest.mark.asyncio
    async def test_prediction_recording(self, migrator, monitor, forecaster):
        # Add peer with rising metrics
        monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
        ))

        callback_triggered = []

        async def callback(peer, prediction):
            callback_triggered.append((peer.peer_id, prediction.will_overload))

        migrator.add_migration_callback(callback)
        migrator.min_prediction_confidence = 0.1  # Lower threshold

        # Record samples showing rising trend
        for cpu in [50, 60, 70, 80, 85, 90, 92, 94]:
            forecaster.record_sample("peer-1", PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=float(cpu),
                memory_percent=50.0,
            ))

        await migrator._check_predictions()

        # Should have prediction
        assert "peer-1" in migrator._recent_predictions

    def test_get_prediction(self, migrator):
        migrator._recent_predictions["peer-1"] = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=60.0,
        )

        result = migrator.get_prediction("peer-1")
        assert result is not None
        assert result.will_overload is True

    def test_get_all_predictions(self, migrator):
        migrator._recent_predictions["peer-1"] = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=60.0,
        )
        migrator._recent_predictions["peer-2"] = PredictionResult(
            peer_id="peer-2",
            will_overload=False,
            predicted_time_seconds=None,
        )

        all_preds = migrator.get_all_predictions()
        assert len(all_preds) == 2


class TestPredictiveLoadBalancer:
    """Tests for PredictiveLoadBalancer."""

    @pytest.fixture
    def load_balancer(self):
        return PredictiveLoadBalancer(
            local_peer_id="test-local",
        )

    def test_load_balancer_creation(self, load_balancer):
        assert load_balancer.resource_monitor is not None
        assert load_balancer.forecaster is not None
        assert load_balancer.preemptive_migrator is not None

    @pytest.mark.asyncio
    async def test_start_stop(self, load_balancer):
        await load_balancer.start()
        assert load_balancer._running is True

        await asyncio.sleep(0.1)

        await load_balancer.stop()
        assert load_balancer._running is False

    def test_get_prediction(self, load_balancer):
        # Add prediction
        load_balancer.preemptive_migrator._recent_predictions["peer-1"] = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=60.0,
        )

        result = load_balancer.get_prediction("peer-1")
        assert result is not None

    def test_get_cluster_predictions(self, load_balancer):
        load_balancer.preemptive_migrator._recent_predictions["peer-1"] = PredictionResult(
            peer_id="peer-1",
            will_overload=True,
            predicted_time_seconds=60.0,
        )

        predictions = load_balancer.get_cluster_predictions()
        assert "peer-1" in predictions

    def test_get_status(self, load_balancer):
        # Add a peer
        load_balancer.resource_monitor.update_peer_metrics(PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
        ))

        status = load_balancer.get_status()

        assert "predictions" in status
        assert "prediction_accuracy" in status


class TestCreatePredictiveLoadBalancer:
    """Tests for create_predictive_load_balancer function."""

    def test_create_defaults(self):
        lb = create_predictive_load_balancer()

        assert lb.local_peer_id == "local"
        assert lb.forecaster is not None
        assert lb.preemptive_migrator is not None

    def test_create_with_options(self):
        lb = create_predictive_load_balancer(
            local_peer_id="custom-local",
            prefer_local=False,
            prediction_method=PredictionMethod.EXPONENTIAL,
        )

        assert lb.local_peer_id == "custom-local"
        assert lb.config.prefer_local is False


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
