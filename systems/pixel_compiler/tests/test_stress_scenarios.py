"""Tests for stress test scenarios."""
import pytest
from systems.pixel_compiler.a2a_load_test.stress_scenarios import (
    StressScenario,
    StressProfile,
    FailureMode
)


class TestStressScenario:
    """Tests for stress test scenarios."""

    def test_stress_scenario_defaults(self):
        """Stress scenario has sensible defaults."""
        scenario = StressScenario(name="default")

        assert scenario.name == "default"
        assert scenario.agent_count == 100
        assert scenario.duration_sec == 60
        assert scenario.message_rate_per_sec == 10
        assert scenario.failure_mode == FailureMode.NONE

    def test_stress_scenario_custom(self):
        """Stress scenario accepts custom parameters."""
        scenario = StressScenario(
            name="extreme",
            agent_count=1000,
            duration_sec=300,
            message_rate_per_sec=100,
            failure_mode=FailureMode.RANDOM_DISCONNECT,
            failure_rate=0.01
        )

        assert scenario.agent_count == 1000
        assert scenario.duration_sec == 300
        assert scenario.failure_mode == FailureMode.RANDOM_DISCONNECT


class TestStressProfile:
    """Tests for stress test profiles."""

    def test_quick_profile(self):
        """Quick profile for fast validation."""
        profile = StressProfile.QUICK

        assert profile.agent_count == 50
        assert profile.duration_sec == 30

    def test_standard_profile(self):
        """Standard profile for CI."""
        profile = StressProfile.STANDARD

        assert profile.agent_count == 200
        assert profile.duration_sec == 60

    def test_extreme_profile(self):
        """Extreme profile for scale limits."""
        profile = StressProfile.EXTREME

        assert profile.agent_count == 1000
        assert profile.duration_sec == 120


class TestFailureMode:
    """Tests for failure mode enum."""

    def test_failure_modes_exist(self):
        """All failure modes are defined."""
        assert FailureMode.NONE.value == "none"
        assert FailureMode.RANDOM_DISCONNECT.value == "random_disconnect"
        assert FailureMode.MESSAGE_DROP.value == "message_drop"
        assert FailureMode.NETWORK_LATENCY.value == "network_latency"
        assert FailureMode.SLOW_CONSUMER.value == "slow_consumer"
