"""Unit tests for GuardianGate"""

import pytest

from systems.evolution_daemon.safety import (
    GuardianGate, EvolutionProposal, SandboxResult, GuardianVerdict
)


@pytest.fixture
def guardian_gate():
    """Create a GuardianGate instance without ZAI bridge"""
    return GuardianGate(zai_bridge=None)


@pytest.fixture
def sample_proposal():
    """Create a sample evolution proposal"""
    return EvolutionProposal(
        proposal_id="test-001",
        goal="Fix a bug",
        target_files=["daemon.py"],
        diff_content="+ fix line\n- old line",
        lines_changed=2
    )


@pytest.fixture
def passing_sandbox_result():
    """Create a passing sandbox result"""
    return SandboxResult(
        passed=True,
        proposal_id="test-001",
        syntax_valid=True,
        imports_valid=True,
        heartbeat_tests_passed=4,
        heartbeat_tests_total=4
    )


class TestGuardianGate:
    """Tests for GuardianGate class"""

    def test_initialization(self, guardian_gate):
        """Test that GuardianGate initializes correctly"""
        assert guardian_gate.zai_bridge is None
        assert guardian_gate._review_history == []

    @pytest.mark.asyncio
    async def test_review_safe_proposal(self, guardian_gate, sample_proposal, passing_sandbox_result):
        """Test review of a safe proposal"""
        verdict = await guardian_gate.review(sample_proposal, passing_sandbox_result)

        assert verdict.approved is True
        assert verdict.risk_level in ["low", "medium"]
        assert verdict.confidence > 0

    @pytest.mark.asyncio
    async def test_review_unsafe_proposal(self, guardian_gate, passing_sandbox_result):
        """Test review of a proposal with unsafe patterns"""
        unsafe_proposal = EvolutionProposal(
            proposal_id="test-002",
            goal="Add dynamic execution",
            target_files=["daemon.py"],
            diff_content="exec(user_input)\nos.system(command)",
            lines_changed=2
        )

        verdict = await guardian_gate.review(unsafe_proposal, passing_sandbox_result)

        assert verdict.approved is False
        assert len(verdict.issues_found) > 0

    @pytest.mark.asyncio
    async def test_review_failed_sandbox(self, guardian_gate, sample_proposal):
        """Test review when sandbox validation failed"""
        failed_sandbox = SandboxResult(
            passed=False,
            proposal_id="test-001",
            errors=["Syntax error on line 1"]
        )

        verdict = await guardian_gate.review(sample_proposal, failed_sandbox)

        assert verdict.approved is False

    @pytest.mark.asyncio
    async def test_escalation_patterns(self, guardian_gate, passing_sandbox_result):
        """Test detection of escalation patterns"""
        escalate_proposal = EvolutionProposal(
            proposal_id="test-003",
            goal="Add cleanup feature",
            target_files=["cleanup.py"],
            diff_content="delete_all()\ntruncate_table()",
            lines_changed=2
        )

        verdict = await guardian_gate.review(escalate_proposal, passing_sandbox_result)

        # Should detect escalation patterns
        assert any("escalation" in issue.lower() for issue in verdict.issues_found)

    def test_check_rejection_patterns(self, guardian_gate):
        """Test pattern checking directly"""
        proposal = EvolutionProposal(
            proposal_id="test",
            goal="test",
            target_files=[],
            diff_content="exec(code)\neval(user_input)",
            lines_changed=2
        )

        issues = guardian_gate._check_rejection_patterns(proposal)

        assert len(issues) == 2
        assert any("exec(" in i for i in issues)
        assert any("eval(" in i for i in issues)

    def test_analyze_scope_critical_file(self, guardian_gate):
        """Test scope analysis for critical files"""
        proposal = EvolutionProposal(
            proposal_id="test",
            goal="Modify daemon",
            target_files=["systems/evolution_daemon/evolution_daemon.py"],
            diff_content="change",
            lines_changed=5
        )

        scope = guardian_gate._analyze_scope(proposal)
        assert scope == "high"

    def test_analyze_scope_large_change(self, guardian_gate):
        """Test scope analysis for large changes"""
        proposal = EvolutionProposal(
            proposal_id="test",
            goal="Big refactor",
            target_files=["utils.py"],
            diff_content="x" * 5000,  # Large diff
            lines_changed=150
        )

        scope = guardian_gate._analyze_scope(proposal)
        assert scope == "high"

    @pytest.mark.asyncio
    async def test_review_history(self, guardian_gate, sample_proposal, passing_sandbox_result):
        """Test that reviews are added to history"""
        await guardian_gate.review(sample_proposal, passing_sandbox_result)
        await guardian_gate.review(sample_proposal, passing_sandbox_result)

        history = guardian_gate.get_review_history()
        assert len(history) == 2

    @pytest.mark.asyncio
    async def test_request_architect_review(self, guardian_gate, sample_proposal):
        """Test architect review request"""
        result = await guardian_gate.request_architect_review(sample_proposal)
        assert result is True  # Should succeed (logs warning)


class TestGuardianVerdict:
    """Tests for GuardianVerdict dataclass"""

    def test_high_risk_requires_human_review(self):
        """Test that high risk triggers human review flag"""
        verdict = GuardianVerdict(
            approved=True,
            proposal_id="test",
            risk_level="high"
        )

        assert verdict.requires_human_review is True

    def test_low_risk_no_human_review(self):
        """Test that low risk doesn't require human review"""
        verdict = GuardianVerdict(
            approved=True,
            proposal_id="test",
            risk_level="low"
        )

        assert verdict.requires_human_review is False


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
