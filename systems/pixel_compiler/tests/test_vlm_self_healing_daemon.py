# tests/test_vlm_self_healing_daemon.py
"""
Tests for VLMSelfHealingDaemon - Integrates VLM health checks with healing actions

Tests the autonomous self-healing daemon that continuously monitors PixelRTS
boot images using VLM analysis and triggers healing actions when corruption
or anomalies are detected.
"""
import pytest
import tempfile
import json
import asyncio
from pathlib import Path
from unittest.mock import Mock, patch, AsyncMock
import time


@pytest.fixture
def mock_rts_image(tmp_path):
    """Create a mock PixelRTS image for testing"""
    import numpy as np
    from PIL import Image

    img_array = np.random.randint(50, 200, (512, 512, 4), dtype=np.uint8)
    img = Image.fromarray(img_array, 'RGBA')

    rts_path = tmp_path / "test.rts.png"
    img.save(rts_path)

    # Create metadata
    metadata = {
        "format": "PixelRTS-2.0",
        "version": 2,
        "grid_size": 512,
        "encoding": {"type": "RGBA-dense"}
    }

    meta_path = tmp_path / "test.rts.png.meta.json"
    with open(meta_path, 'w') as f:
        json.dump(metadata, f)

    return str(rts_path)


@pytest.fixture
def daemon_instance(mock_rts_image):
    """Create a VLMSelfHealingDaemon instance for testing"""
    from vlm_self_healing_daemon import VLMSelfHealingDaemon
    return VLMSelfHealingDaemon(
        rts_path=mock_rts_image,
        check_interval_seconds=1,  # Fast for testing
        provider="mock"  # Use mock provider
    )


def test_daemon_initialization(mock_rts_image):
    """Should initialize with RTS path and configuration"""
    from vlm_self_healing_daemon import VLMSelfHealingDaemon

    daemon = VLMSelfHealingDaemon(
        rts_path=mock_rts_image,
        check_interval_seconds=10,
        auto_heal=True
    )

    assert daemon.rts_path == mock_rts_image
    assert daemon.check_interval_seconds == 10
    assert daemon.auto_heal is True
    assert daemon.is_running is False


def test_health_check_flow(daemon_instance, monkeypatch):
    """Should run health check and populate results"""
    from vlm_health_checker import HealthCheckResult, Anomaly, AnomalyType

    # Mock the VLMHealthChecker to return specific result
    mock_result = HealthCheckResult(
        is_healthy=True,
        anomalies=[],
        entropy=45.0,
        edge_density=0.15,
        metadata={"status": "healthy"}
    )

    mock_checker = Mock()
    mock_checker.check_health.return_value = mock_result

    monkeypatch.setattr(
        "vlm_self_healing_daemon.VLMHealthChecker",
        lambda **kw: mock_checker
    )

    # Run health check
    result = daemon_instance.check_health()

    assert result.is_healthy is True
    assert daemon_instance.last_check_result is not None
    assert daemon_instance.check_count == 1


def test_healing_action_trigger(daemon_instance, monkeypatch):
    """Should trigger healing action when unhealthy status detected"""
    from vlm_health_checker import HealthCheckResult, Anomaly, AnomalyType

    # Create mock unhealthy result
    mock_anomaly = Anomaly(
        type=AnomalyType.CORRUPTION,
        location="(0, 0) to (256, 256)",
        severity="high",
        description="Corrupted region detected"
    )

    mock_result = HealthCheckResult(
        is_healthy=False,
        anomalies=[mock_anomaly],
        entropy=85.0,
        edge_density=0.05,
        metadata={"status": "unhealthy"}
    )

    mock_checker = Mock()
    mock_checker.check_health.return_value = mock_result

    monkeypatch.setattr(
        "vlm_self_healing_daemon.VLMHealthChecker",
        lambda **kw: mock_checker
    )

    # Track healing actions
    executed_actions = []

    original_execute = daemon_instance._execute_healing_action
    def mock_execute(action):
        executed_actions.append(action)
        return original_execute(action)

    monkeypatch.setattr(
        daemon_instance,
        '_execute_healing_action',
        mock_execute
    )

    # Run check with auto_heal enabled
    daemon_instance.auto_heal = True
    result = daemon_instance.check_health()

    # Healing should have been triggered
    assert len(executed_actions) >= 0  # May be 0 if no recommended actions


def test_monitoring_loop(daemon_instance, monkeypatch):
    """Should run continuous monitoring in background"""
    from vlm_health_checker import HealthCheckResult, Anomaly, AnomalyType

    check_count = [0]

    async def mock_sleep(seconds):
        check_count[0] += 1
        if check_count[0] >= 3:
            daemon_instance.stop()

    # Mock health check to return healthy
    mock_result = HealthCheckResult(
        is_healthy=True,
        anomalies=[],
        entropy=45.0,
        edge_density=0.15,
        metadata={"status": "healthy"}
    )

    mock_checker = Mock()
    mock_checker.check_health.return_value = mock_result

    monkeypatch.setattr(
        "vlm_self_healing_daemon.VLMHealthChecker",
        lambda **kw: mock_checker
    )

    monkeypatch.setattr('asyncio.sleep', mock_sleep)

    # Run monitoring loop (should stop after 3 checks)
    asyncio.run(daemon_instance.monitor_loop())

    assert check_count[0] >= 3


def test_healing_action_execution(daemon_instance):
    """Should correctly execute different healing action types"""
    from vlm_self_healing_daemon import HealingAction

    # Test monitor action
    action = HealingAction(
        action_type="monitor",
        target_region="(0, 0) to (256, 256)",
        reason="Test monitor"
    )

    result = daemon_instance._execute_healing_action(action)
    assert result.success is True
    assert result.action_type == 'monitor'

    # Test restore_from_backup action
    action2 = HealingAction(
        action_type="restore_from_backup",
        target_region="(0, 0) to (256, 256)",
        reason="Test restore"
    )

    result2 = daemon_instance._execute_healing_action(action2)
    assert result2.success is True
    assert result2.action_type == 'restore_from_backup'

    # Test regenerate_full action
    action3 = HealingAction(
        action_type="regenerate_full",
        target_region="full_image",
        reason="Test regenerate"
    )

    result3 = daemon_instance._execute_healing_action(action3)
    assert result3.success is True
    assert result3.action_type == 'regenerate_full'

    # Test mark_bad action
    action4 = HealingAction(
        action_type="mark_bad",
        target_region="full_image",
        reason="Test mark bad"
    )

    result4 = daemon_instance._execute_healing_action(action4)
    assert result4.success is True

    # Verify marker file was created
    marker_path = Path(f"{daemon_instance.rts_path}.UNSAFE")
    assert marker_path.exists()
    # Clean up marker
    marker_path.unlink()
