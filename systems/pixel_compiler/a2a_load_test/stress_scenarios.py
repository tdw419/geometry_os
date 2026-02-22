"""Stress test scenarios for A2A scale testing."""
from dataclasses import dataclass, field
from enum import Enum
from typing import Optional


class FailureMode(Enum):
    """Failure injection modes for stress testing."""
    NONE = "none"
    RANDOM_DISCONNECT = "random_disconnect"
    MESSAGE_DROP = "message_drop"
    NETWORK_LATENCY = "network_latency"
    SLOW_CONSUMER = "slow_consumer"


@dataclass
class StressScenario:
    """Configuration for a stress test scenario."""
    name: str
    agent_count: int = 100
    duration_sec: int = 60
    message_rate_per_sec: int = 10
    message_size_bytes: int = 256
    failure_mode: FailureMode = FailureMode.NONE
    failure_rate: float = 0.0  # 0.0 to 1.0
    topology: str = "mesh"
    ramp_up_sec: int = 5
    ramp_down_sec: int = 5
    collect_metrics: bool = True
    metrics_interval_ms: int = 100


@dataclass
class StressProfile:
    """Predefined stress test profiles."""
    name: str
    agent_count: int
    duration_sec: int
    message_rate_per_sec: int
    description: str

    # Predefined profiles (set after class definition)
    QUICK = None
    STANDARD = None
    EXTREME = None
    ENDURANCE = None


# Define profiles after class
StressProfile.QUICK = StressProfile(
    name="quick",
    agent_count=50,
    duration_sec=30,
    message_rate_per_sec=10,
    description="Quick validation for CI"
)

StressProfile.STANDARD = StressProfile(
    name="standard",
    agent_count=200,
    duration_sec=60,
    message_rate_per_sec=50,
    description="Standard test for regression"
)

StressProfile.EXTREME = StressProfile(
    name="extreme",
    agent_count=1000,
    duration_sec=120,
    message_rate_per_sec=100,
    description="Push system to limits"
)

StressProfile.ENDURANCE = StressProfile(
    name="endurance",
    agent_count=100,
    duration_sec=600,  # 10 minutes
    message_rate_per_sec=20,
    description="Long-running stability test"
)
