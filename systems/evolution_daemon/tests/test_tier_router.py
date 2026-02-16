"""Unit tests for TierRouter"""

import pytest

from systems.evolution_daemon.safety import (
    TierRouter, EvolutionProposal, GuardianVerdict
)


@pytest.fixture
def tier_router():
    """Create a TierRouter instance"""
    return TierRouter()


@pytest.fixture
def minor_proposal():
    """Create a minor change proposal (Tier 1)"""
    return EvolutionProposal(
        proposal_id="minor-001",
        goal="Fix typo in comment",
        target_files=["utils.py"],
        diff_content="# fix typo\n",
        lines_changed=1
    )


@pytest.fixture
def medium_proposal():
    """Create a medium change proposal (Tier 2)"""
    return EvolutionProposal(
        proposal_id="medium-001",
        goal="Add new utility function",
        target_files=["utils.py", "helpers.py"],
        diff_content="+ def new_func():\n+     pass\n" * 10,
        lines_changed=20
    )


@pytest.fixture
def major_proposal():
    """Create a major change proposal (Tier 3)"""
    return EvolutionProposal(
        proposal_id="major-001",
        goal="Refactor evolution daemon",
        target_files=["systems/evolution_daemon/evolution_daemon.py"],
        diff_content="+ major change\n" * 100,
        lines_changed=100
    )


@pytest.fixture
def low_risk_verdict():
    """Create a low risk guardian verdict"""
    return GuardianVerdict(
        approved=True,
        proposal_id="test",
        risk_level="low",
        issues_found=[]
    )


@pytest.fixture
def high_risk_verdict():
    """Create a high risk guardian verdict"""
    return GuardianVerdict(
        approved=True,
        proposal_id="test",
        risk_level="high",
        issues_found=["potential issue"],
        requires_human_review=True
    )


class TestTierRouter:
    """Tests for TierRouter class"""

    def test_initialization(self, tier_router):
        """Test that TierRouter initializes correctly"""
        assert tier_router.TIER_1_THRESHOLD == 10
        assert tier_router.TIER_2_THRESHOLD == 25
        assert tier_router._classification_history == {}

    def test_classify_tier_1(self, tier_router, minor_proposal, low_risk_verdict):
        """Test classification of Tier 1 (minor) changes"""
        tier = tier_router.classify(minor_proposal, low_risk_verdict)
        assert tier == 1

    def test_classify_tier_2(self, tier_router, medium_proposal, low_risk_verdict):
        """Test classification of Tier 2 (medium) changes"""
        tier = tier_router.classify(medium_proposal, low_risk_verdict)
        assert tier == 2

    def test_classify_tier_3(self, tier_router, major_proposal, low_risk_verdict):
        """Test classification of Tier 3 (major) changes"""
        tier = tier_router.classify(major_proposal, low_risk_verdict)
        assert tier == 3

    def test_classify_high_risk_override(self, tier_router, minor_proposal, high_risk_verdict):
        """Test that high risk overrides to Tier 3"""
        tier = tier_router.classify(minor_proposal, high_risk_verdict)
        assert tier == 3  # Human review required

    def test_calculate_score_lines(self, tier_router, minor_proposal, low_risk_verdict):
        """Test score calculation for lines changed"""
        score = tier_router.calculate_score(minor_proposal, low_risk_verdict)
        # 1 line / 10 = 0 points for lines
        # 1 file = 5 points
        # Total should be around 5
        assert score >= 0
        assert score < 20

    def test_calculate_score_critical_file(self, tier_router, low_risk_verdict):
        """Test score calculation for critical files"""
        critical_proposal = EvolutionProposal(
            proposal_id="critical-001",
            goal="Modify daemon",
            target_files=["evolution_daemon.py"],
            diff_content="+ change",
            lines_changed=5
        )

        score = tier_router.calculate_score(critical_proposal, low_risk_verdict)
        # Critical file adds 30 points
        assert score >= 30

    def test_calculate_score_guardian_risk(self, tier_router, minor_proposal):
        """Test score calculation with different guardian risk levels"""
        low_verdict = GuardianVerdict(approved=True, proposal_id="test", risk_level="low")
        medium_verdict = GuardianVerdict(approved=True, proposal_id="test", risk_level="medium")
        high_verdict = GuardianVerdict(approved=True, proposal_id="test", risk_level="high")

        low_score = tier_router.calculate_score(minor_proposal, low_verdict)
        medium_score = tier_router.calculate_score(minor_proposal, medium_verdict)
        high_score = tier_router.calculate_score(minor_proposal, high_verdict)

        assert high_score > medium_score > low_score

    def test_get_tier_description(self, tier_router):
        """Test tier description retrieval"""
        desc1 = tier_router.get_tier_description(1)
        desc2 = tier_router.get_tier_description(2)
        desc3 = tier_router.get_tier_description(3)

        assert "Minor" in desc1
        assert "Medium" in desc2
        assert "Major" in desc3

    def test_get_monitoring_requirements(self, tier_router):
        """Test monitoring requirements for each tier"""
        req1 = tier_router.get_monitoring_requirements(1)
        req2 = tier_router.get_monitoring_requirements(2)
        req3 = tier_router.get_monitoring_requirements(3)

        # Tier 1: basic monitoring
        assert req1["regression_tests"] is True
        assert req1["visual_monitoring"] is False
        assert req1["human_review"] is False

        # Tier 2: visual monitoring
        assert req2["visual_monitoring"] is True
        assert req2["human_review"] is False

        # Tier 3: human review
        assert req3["human_review"] is True

    def test_classification_history(self, tier_router, minor_proposal, low_risk_verdict):
        """Test that classifications are stored in history"""
        tier_router.classify(minor_proposal, low_risk_verdict)

        history = tier_router.get_classification_history()
        assert "minor-001" in history
        assert history["minor-001"] == 1

    def test_tier_stats(self, tier_router, minor_proposal, medium_proposal, major_proposal, low_risk_verdict):
        """Test tier statistics"""
        tier_router.classify(minor_proposal, low_risk_verdict)
        tier_router.classify(medium_proposal, low_risk_verdict)
        tier_router.classify(major_proposal, low_risk_verdict)

        stats = tier_router.get_tier_stats()
        assert stats[1] == 1
        assert stats[2] == 1
        assert stats[3] == 1


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
