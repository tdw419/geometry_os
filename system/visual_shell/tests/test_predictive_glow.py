"""
Tests for Predictive Glow (Phase 37)

Tests predictive overlays for overload warnings.
"""

import pytest
import time

from systems.visual_shell.predictive_glow import (
    PredictiveGlow,
    GlowIndicator,
    OverloadWarning,
)


class TestGlowIndicator:
    """Tests for GlowIndicator."""

    def test_indicator_types(self):
        assert PredictiveGlow.PREDICTED_OVERLOAD.value == "predicted_overload"
        assert PredictiveGlow.ATTENTION_REQUIRED.value == "attention"
        assert PredictiveGlow.CRITICAL.value == "critical"

    def test_indicator_creation(self):
        indicator = GlowIndicator(
            indicator_type=PredictiveGlow.PREDICTED_OVERLOAD,
            peer_id="peer-1",
            severity=PredictiveGlow.ATTENTION_REQUIRED,
            confidence=0.85,
            message="CPU at 85%",
        )
        assert indicator.indicator_type == PredictiveGlow.PREDICTED_OVERLOAD
        assert indicator.peer_id == "peer-1"
        assert indicator.severity == PredictiveGlow.ATTENTION_REQUIRED
        assert indicator.confidence == 0.85

    def test_indicator_with_warning(self):
        indicator = GlowIndicator(
            indicator_type=PredictiveGlow.ATTENTION_REQUIRED,
            peer_id="peer-1",
            severity=PredictiveGlow.ATTENTION_REQUIRED,
            confidence=0.9,
            message="High memory usage",
        )
        warning = OverloadWarning(
            warning_id="warn-1",
            peer_id="peer-1",
            severity=PredictiveGlow.CRITICAL,
            message="Critical overload predicted",
            confidence=0.95,
            predicted_at=time.time(),
        )
        assert warning.warning_id == "warn-1"
        assert warning.peer_id == "peer-1"
        assert warning.severity == PredictiveGlow.CRITICAL
        assert warning.message == "Critical overload predicted"
        assert warning.confidence == 0.95
        assert warning.predicted_at is not None
        assert isinstance(warning, OverloadWarning)


        assert isinstance(indicator, GlowIndicator)
        assert isinstance(warnings[0], OverloadWarning)


        assert isinstance(warnings[0], OverloadWarning)
        assert len(warnings) == 1
        assert warnings[0].peer_id == "peer-1"
        assert warnings[0].severity == PredictiveGlow.CRITICAL
        assert warnings[0].message == "Critical overload"
        assert warnings[1].predicted_at is not None
        assert len(overlay._indicators) == 0
        assert len(overlay._warnings) == 1
    @pytest.mark.asyncio
    async def test_highlight_nonexistent_peer(self, overlay):
        overlay.highlight_peer(
            peer_id="nonexistent",
            duration=1.0,
        )
        assert len(overlay._indicators) == 0
        assert len(overlay._warnings) == 0

    @pytest.mark.asyncio
    async def test_get_indicators(self, overlay):
        for i in range(3):
            overlay.highlight_peer(
                peer_id=f"peer-{i}",
                severity=PredictiveGlow.ATTENTION_REQUIRED,
                confidence=0.8,
                message=f"Warning {i}",
            )
        assert len(overlay._indicators) == 3
        assert len(overlay._warnings) == 3
    @pytest.mark.asyncio
    async def test_get_warnings(self, overlay):
        overlay.highlight_peer("peer-1")
        warnings = overlay.get_warnings("peer-1")
        assert len(warnings) == 1
        assert warnings[0].peer_id == "peer-1"

    @pytest.mark.asyncio
    async def test_get_stats(self, overlay):
        stats = overlay.get_stats()
        assert stats["running"] is True
        assert stats["indicator_count"] == 0
        assert stats["warning_count"] == 1
        assert stats["visible_count"] == 0
        assert stats["total_warnings"] == 0


