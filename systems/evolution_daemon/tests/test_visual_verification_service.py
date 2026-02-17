"""
Journeyman Stage - Visual Verification Service Tests

Tests for AI self-verification of visual modifications.
"""
import pytest


class TestCriticalityLevel:
    """Tests for CriticalityLevel enum"""

    def test_criticality_level_has_exact(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.EXACT.value == "exact"

    def test_criticality_level_has_tolerant(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.TOLERANT.value == "tolerant"

    def test_criticality_level_has_relaxed(self):
        from systems.evolution_daemon.visual_verification_service import CriticalityLevel
        assert CriticalityLevel.RELAXED.value == "relaxed"
