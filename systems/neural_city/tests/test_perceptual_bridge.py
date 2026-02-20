"""Tests for PerceptualBridge V16 - Visual Anomaly Detection."""

import pytest
from unittest.mock import Mock, patch, AsyncMock
import asyncio


class TestPerceptualBridge:
    """Test suite for PerceptualBridge anomaly detection."""

    def test_detect_kernel_panic_text(self):
        """Should detect kernel panic in extracted text."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "Kernel panic - not syncing: VFS: Unable to mount root fs"

        result = detector.scan(text)

        assert result.status.value == "CRITICAL"
        assert "panic" in result.matched_pattern.lower()

    def test_detect_error_text(self):
        """Should detect ERROR patterns as WARNING."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "ERROR: Failed to initialize device"

        result = detector.scan(text)

        assert result.status.value == "WARNING"
        assert "error" in result.matched_pattern.lower()

    def test_healthy_text_returns_healthy(self):
        """Should return HEALTHY for normal output."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "System initialized successfully\nLoading drivers..."

        result = detector.scan(text)

        assert result.status.value == "HEALTHY"

    def test_multiple_anomalies_returns_highest_severity(self):
        """Should return CRITICAL if both panic and error detected."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "ERROR: something wrong\nKernel panic - not syncing"

        result = detector.scan(text)

        assert result.status.value == "CRITICAL"

    def test_empty_text_returns_healthy(self):
        """Should return HEALTHY for empty input."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()

        result = detector.scan("")

        assert result.status.value == "HEALTHY"

    def test_case_insensitive_detection(self):
        """Should detect patterns regardless of case."""
        from systems.neural_city.perceptual_bridge import AnomalyDetector

        detector = AnomalyDetector()
        text = "KERNEL PANIC - Not Syncing"

        result = detector.scan(text)

        assert result.status.value == "CRITICAL"
