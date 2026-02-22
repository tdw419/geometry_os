"""
Evolution Daemon V13 - Data Structures Tests

Tests for V13 predictive health and metabolism data structures.
"""
import pytest
from dataclasses import fields
from systems.evolution_daemon.safety.data_structures import (
    HealthPrediction,
    MetabolismState,
    ThrottleLevel
)


class TestHealthPrediction:
    def test_health_prediction_has_required_fields(self):
        prediction = HealthPrediction(
            rts_path="/path/to/file.rts.png",
            predicted_health_score=0.85,
            confidence=0.92,
            predicted_at="2026-02-16T12:00:00",
            horizon_hours=24,
            recommended_action="defragment"
        )
        assert prediction.rts_path == "/path/to/file.rts.png"
        assert prediction.predicted_health_score == 0.85
        assert prediction.confidence == 0.92

    def test_health_prediction_action_is_optional(self):
        prediction = HealthPrediction(
            rts_path="/path/to/file.rts.png",
            predicted_health_score=0.95,
            confidence=0.98,
            predicted_at="2026-02-16T12:00:00",
            horizon_hours=24
        )
        assert prediction.recommended_action is None


class TestMetabolismState:
    def test_metabolism_state_has_resource_fields(self):
        state = MetabolismState(
            cpu_percent=45.0,
            memory_available_mb=2048,
            gpu_percent=30.0,
            throttle_level=ThrottleLevel.NONE
        )
        assert state.cpu_percent == 45.0
        assert state.memory_available_mb == 2048
        assert state.throttle_level == ThrottleLevel.NONE

    def test_throttle_level_values(self):
        assert ThrottleLevel.NONE.value == "none"
        assert ThrottleLevel.MODERATE.value == "moderate"
        assert ThrottleLevel.AGGRESSIVE.value == "aggressive"
