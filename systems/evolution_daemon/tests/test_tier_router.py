"""Unit tests for TierRouter"""

import pytest

from systems.evolution_daemon.safety import (
    TierRouter, EvolutionProposal, GuardianVerdict, BehavioralMonitor
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


# ==================== Behavioral Integration Tests ====================

@pytest.fixture
def behavioral_monitor():
    """Create a BehavioralMonitor instance for testing"""
    return BehavioralMonitor(anomaly_threshold=0.7)


@pytest.fixture
def tier_router_with_monitor(behavioral_monitor):
    """Create a TierRouter instance with behavioral monitor"""
    return TierRouter(behavioral_monitor=behavioral_monitor)


class TestTierRouterBehavioralIntegration:
    """Tests for TierRouter behavioral integration"""

    def test_classify_with_behavior_no_monitor_returns_same_as_classify(
        self, tier_router, minor_proposal, low_risk_verdict
    ):
        """Test classify_with_behavior without monitor returns same tier as classify"""
        agent_id = "test-agent"
        tier_with_behavior = tier_router.classify_with_behavior(
            minor_proposal, low_risk_verdict, agent_id
        )
        tier_without = tier_router.classify(minor_proposal, low_risk_verdict)
        assert tier_with_behavior == tier_without == 1

    def test_classify_with_behavior_normal_agent_no_tier_change(
        self, tier_router_with_monitor, minor_proposal, low_risk_verdict
    ):
        """Test classify_with_behavior with normal agent (no tier change)"""
        agent_id = "normal-agent"
        # Record some normal events (not enough to be anomalous)
        for i in range(5):
            tier_router_with_monitor._behavioral_monitor.record_event(
                agent_id, "file_read", {"path": f"/safe/path/{i}"}
            )

        tier = tier_router_with_monitor.classify_with_behavior(
            minor_proposal, low_risk_verdict, agent_id
        )
        # Normal behavior should return same tier as code classification
        assert tier == 1

    def test_classify_with_behavior_suspicious_agent_tier_elevation(
        self, tier_router_with_monitor, minor_proposal, low_risk_verdict
    ):
        """Test classify_with_behavior with suspicious agent causes tier elevation"""
        agent_id = "suspicious-agent"
        # Record some events and then set entropy score to anomalous level
        tier_router_with_monitor._behavioral_monitor.record_event(
            agent_id, "file_read", {"path": "/etc/passwd"}
        )

        # Manually set entropy score to be anomalous (> 0.7)
        profile = tier_router_with_monitor._behavioral_monitor.get_profile(agent_id)
        profile.entropy_score = 0.8  # Above threshold

        tier = tier_router_with_monitor.classify_with_behavior(
            minor_proposal, low_risk_verdict, agent_id
        )
        # Suspicious agent should elevate to tier 3
        assert tier == 3

    def test_get_behavior_tier_no_monitor_returns_1(self, tier_router):
        """Test _get_behavior_tier returns 1 when no monitor configured"""
        tier = tier_router._get_behavior_tier("any-agent")
        assert tier == 1

    def test_get_behavior_tier_anomalous_returns_3(
        self, tier_router_with_monitor
    ):
        """Test _get_behavior_tier returns 3 for anomalous agent"""
        agent_id = "anomalous-agent"
        # Record an event and set entropy to be anomalous
        tier_router_with_monitor._behavioral_monitor.record_event(
            agent_id, "file_read", {"path": "/etc/passwd"}
        )
        profile = tier_router_with_monitor._behavioral_monitor.get_profile(agent_id)
        profile.entropy_score = 0.8  # Above threshold, triggers anomalous

        tier = tier_router_with_monitor._get_behavior_tier(agent_id)
        assert tier == 3

    def test_get_behavior_tier_medium_suspicion_returns_2(
        self, tier_router_with_monitor
    ):
        """Test _get_behavior_tier returns 2 for medium suspicion (entropy > 0.5, < 0.7)"""
        agent_id = "medium-agent"
        # Record events that will result in medium entropy (between 0.5 and 0.7)
        # Need to manipulate the score to be in the medium range
        monitor = tier_router_with_monitor._behavioral_monitor

        # Record moderate number of events
        for i in range(20):
            monitor.record_event(agent_id, "file_read", {"path": f"/file_{i}"})

        # Get the profile and manually set entropy to be in medium range
        profile = monitor.get_profile(agent_id)
        # The actual score depends on the calculation, so let's verify
        # _get_behavior_tier returns 2 if entropy > 0.5 and agent not anomalous

        # Create scenario where entropy is between 0.5 and 0.7
        # This is tricky - let's mock the profile directly
        monitor._profiles[agent_id].entropy_score = 0.6

        tier = tier_router_with_monitor._get_behavior_tier(agent_id)
        assert tier == 2, f"Expected tier 2 for entropy 0.6, got {tier}"

    def test_get_behavior_tier_normal_returns_1(
        self, tier_router_with_monitor
    ):
        """Test _get_behavior_tier returns 1 for normal agent"""
        agent_id = "normal-agent"
        # Record a few normal events
        for i in range(3):
            tier_router_with_monitor._behavioral_monitor.record_event(
                agent_id, "file_read", {"path": f"/safe/path/{i}"}
            )

        tier = tier_router_with_monitor._get_behavior_tier(agent_id)
        assert tier == 1

    def test_max_code_and_behavior_tier_logic(
        self, tier_router_with_monitor, minor_proposal, medium_proposal, low_risk_verdict
    ):
        """Test that max(code_tier, behavior_tier) logic is applied correctly"""
        agent_id = "suspicious-agent"

        # Make agent suspicious (tier 2 behavior)
        monitor = tier_router_with_monitor._behavioral_monitor
        monitor._profiles[agent_id] = monitor.get_profile(agent_id)
        monitor._profiles[agent_id].entropy_score = 0.6  # Will give behavior tier 2

        # Code tier 1 + behavior tier 2 = final tier 2
        tier = tier_router_with_monitor.classify_with_behavior(
            minor_proposal, low_risk_verdict, agent_id
        )
        assert tier == 2

        # Code tier 2 + behavior tier 2 = final tier 2
        tier = tier_router_with_monitor.classify_with_behavior(
            medium_proposal, low_risk_verdict, agent_id
        )
        assert tier == 2

    def test_behavior_tier_3_overrides_code_tier_1(
        self, tier_router_with_monitor, minor_proposal, low_risk_verdict
    ):
        """Test behavior tier 3 overrides even tier 1 code classification"""
        agent_id = "very-suspicious-agent"

        # Make agent anomalous by setting high entropy score
        tier_router_with_monitor._behavioral_monitor.record_event(
            agent_id, "file_read", {"path": "/etc/passwd"}
        )
        profile = tier_router_with_monitor._behavioral_monitor.get_profile(agent_id)
        profile.entropy_score = 0.8  # Above threshold

        # Verify agent is anomalous
        assert tier_router_with_monitor._behavioral_monitor.is_anomalous(agent_id)

        # Code tier would be 1 (minor proposal), but behavior tier is 3
        tier = tier_router_with_monitor.classify_with_behavior(
            minor_proposal, low_risk_verdict, agent_id
        )
        assert tier == 3

    def test_integration_with_existing_classify_method(
        self, tier_router_with_monitor, minor_proposal, medium_proposal,
        major_proposal, low_risk_verdict
    ):
        """Test that classify_with_behavior integrates properly with existing classify"""
        agent_id = "test-agent"

        # Test without behavioral concerns - should match classify()
        tier_minor = tier_router_with_monitor.classify_with_behavior(
            minor_proposal, low_risk_verdict, agent_id
        )
        tier_medium = tier_router_with_monitor.classify_with_behavior(
            medium_proposal, low_risk_verdict, agent_id
        )
        tier_major = tier_router_with_monitor.classify_with_behavior(
            major_proposal, low_risk_verdict, agent_id
        )

        assert tier_minor == 1
        assert tier_medium == 2
        assert tier_major == 3

        # Verify classification history is updated
        history = tier_router_with_monitor.get_classification_history()
        assert "minor-001" in history
        assert "medium-001" in history
        assert "major-001" in history


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
