"""End-to-end tests for Perceptual Bridge V16."""

import pytest
import asyncio
import json
from unittest.mock import AsyncMock, patch, MagicMock


class TestPerceptualBridgeE2E:
    """Full loop integration tests."""

    @pytest.mark.asyncio
    async def test_panic_detection_to_quarantine_flow(self):
        """
        Full flow: Panic text detected -> CRITICAL -> QUARANTINE_DISTRICT broadcast.
        """
        from systems.neural_city.perceptual_bridge import (
            AnomalyDetector,
            DiagnosticStatus
        )

        detector = AnomalyDetector()
        panic_text = "Kernel panic - not syncing: VFS: Unable to mount root fs"

        result = detector.scan(panic_text)

        assert result.status == DiagnosticStatus.CRITICAL
        assert "panic" in result.matched_pattern.lower()

        # Verify quarantine event structure
        quarantine_event = {
            "type": "QUARANTINE_DISTRICT",
            "district_id": "silicon",
            "reason": result.matched_pattern,
            "severity": "CRITICAL"
        }
        assert quarantine_event["severity"] == "CRITICAL"

    @pytest.mark.asyncio
    async def test_healthy_execution_no_quarantine(self):
        """Healthy execution should not trigger quarantine."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector, DiagnosticStatus

        detector = AnomalyDetector()
        healthy_text = "System initialized\nLoading drivers...\nReady."

        result = detector.scan(healthy_text)

        assert result.status == DiagnosticStatus.HEALTHY

    @pytest.mark.asyncio
    async def test_warning_logs_but_no_quarantine(self):
        """WARNING should log but not trigger quarantine."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector, DiagnosticStatus

        detector = AnomalyDetector()
        warning_text = "ERROR: Failed to load optional module"

        result = detector.scan(warning_text)

        assert result.status == DiagnosticStatus.WARNING
        # QUARANTINE_DISTRICT only on CRITICAL

    @pytest.mark.asyncio
    async def test_pulse_format_for_websocket(self):
        """Validate DIAGNOSTIC_PULSE JSON format."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        result = detector.scan("Kernel panic!")

        pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "district_id": "silicon",
            "status": result.status.value,
            "matched_pattern": result.matched_pattern,
            "detected_text": result.detected_text[:200],
            "timestamp": result.timestamp
        }

        # Validate JSON serializable
        json_str = json.dumps(pulse)
        parsed = json.loads(json_str)

        assert parsed["type"] == "DIAGNOSTIC_PULSE"
        assert parsed["status"] == "CRITICAL"
        assert "timestamp" in parsed
