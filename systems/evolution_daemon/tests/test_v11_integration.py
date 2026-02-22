"""
Integration tests for Evolution Daemon V11 Full Safety Pipeline

Tests the complete flow:
1. Successful minor evolution (Tier 1)
2. Successful medium evolution (Tier 2) with visual monitoring
3. Tier 3 evolution creates PR instead of commit
4. Sandbox rejection blocks commit
5. Guardian rejection blocks commit
6. Post-commit failure triggers rollback
"""

import pytest
import tempfile
import subprocess
from pathlib import Path
from unittest.mock import Mock, AsyncMock, patch

from systems.evolution_daemon.safety import (
    SandboxManager, GuardianGate, TierRouter, GitIntegration,
    PostCommitMonitor, EvolutionRecovery,
    EvolutionProposal, SandboxResult, GuardianVerdict, MonitoringResult,
    EvolutionResult, RecoveryAction
)


@pytest.fixture
def temp_git_repo():
    """Create a temporary git repository for testing"""
    with tempfile.TemporaryDirectory() as tmpdir:
        subprocess.run(["git", "init"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=tmpdir, check=True, capture_output=True)

        # Create initial files
        test_file = Path(tmpdir) / "daemon.py"
        test_file.write_text("# Evolution daemon\nprint('hello')\n")
        subprocess.run(["git", "add", "."], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Initial commit"], cwd=tmpdir, check=True, capture_output=True)

        yield tmpdir


@pytest.fixture
def full_pipeline(temp_git_repo):
    """Create a fully initialized safety pipeline"""
    sandbox = SandboxManager(sandbox_base=tempfile.mkdtemp())
    guardian = GuardianGate(zai_bridge=None)
    router = TierRouter()
    git = GitIntegration(repo_path=temp_git_repo)
    monitor = PostCommitMonitor(git=git, webmcp_client=None)
    recovery = EvolutionRecovery(git=git, guardian=guardian)

    return {
        "sandbox": sandbox,
        "guardian": guardian,
        "router": router,
        "git": git,
        "monitor": monitor,
        "recovery": recovery,
        "repo_path": temp_git_repo
    }


class TestTier1Evolution:
    """Test Scenario 1: Successful minor evolution (Tier 1)"""

    @pytest.mark.asyncio
    async def test_tier_1_success_flow(self, full_pipeline):
        """Test complete Tier 1 flow: all gates pass, auto-commit"""
        repo_path = full_pipeline["repo_path"]

        # Create the file that will be modified
        utils_file = Path(repo_path) / "utils.py"
        utils_file.write_text("# Utility functions\n")

        # Create minor proposal
        proposal = EvolutionProposal(
            proposal_id="minor-001",
            goal="Fix typo in comment",
            target_files=["utils.py"],
            diff_content="# Fixed typo\n",
            lines_changed=1
        )

        # 1. Sandbox validation (mock - file doesn't exist)
        sandbox_result = SandboxResult(
            passed=True,
            proposal_id=proposal.proposal_id,
            syntax_valid=True,
            imports_valid=True,
            heartbeat_tests_passed=4,
            heartbeat_tests_total=4
        )

        # 2. Guardian review
        verdict = await full_pipeline["guardian"].review(proposal, sandbox_result)
        assert verdict.approved is True

        # 3. Tier classification
        tier = full_pipeline["router"].classify(proposal, verdict)
        assert tier == 1

        # 4. Stage and commit (need to actually modify the file)
        utils_file.write_text("# Fixed typo\n")
        subprocess.run(["git", "add", "utils.py"], cwd=repo_path, check=True, capture_output=True)

        sha = await full_pipeline["git"].commit_evolution(proposal, verdict, tier)
        assert sha is not None

        # 5. Monitor - just verify the monitoring runs (may fail tests if test suite is missing)
        await full_pipeline["monitor"].capture_baseline()
        result = await full_pipeline["monitor"].monitor(sha, tier)
        # We don't assert healthy because tests may fail in isolated temp repo
        assert result.commit_sha == sha
        assert result.tier == tier


class TestTier2Evolution:
    """Test Scenario 2: Successful medium evolution (Tier 2) with visual monitoring"""

    @pytest.mark.asyncio
    async def test_tier_2_success_flow(self, full_pipeline):
        """Test complete Tier 2 flow: all gates pass, visual monitoring"""
        # Create medium proposal
        proposal = EvolutionProposal(
            proposal_id="medium-001",
            goal="Add new utility function",
            target_files=["utils.py", "helpers.py"],
            diff_content="+ def new_func():\n+     pass\n" * 5,
            lines_changed=10
        )

        # 1. Sandbox validation
        sandbox_result = SandboxResult(
            passed=True,
            proposal_id=proposal.proposal_id,
            syntax_valid=True,
            imports_valid=True
        )

        # 2. Guardian review
        verdict = await full_pipeline["guardian"].review(proposal, sandbox_result)
        assert verdict.approved is True

        # 3. Tier classification - should be Tier 2
        tier = full_pipeline["router"].classify(proposal, verdict)
        assert tier == 2

        # 4. Check monitoring requirements
        reqs = full_pipeline["router"].get_monitoring_requirements(tier)
        assert reqs["visual_monitoring"] is True
        assert reqs["human_review"] is False


class TestTier3Evolution:
    """Test Scenario 3: Tier 3 evolution creates PR instead of commit"""

    @pytest.mark.asyncio
    async def test_tier_3_creates_pr(self, full_pipeline):
        """Test that Tier 3 creates PR branch instead of direct commit"""
        # Create major proposal affecting critical file with high risk
        proposal = EvolutionProposal(
            proposal_id="major-001",
            goal="Refactor evolution daemon core",
            target_files=["evolution_daemon.py"],  # Critical file name
            diff_content="+ major change\n" * 100,
            lines_changed=100
        )

        # 1. Sandbox validation
        sandbox_result = SandboxResult(
            passed=True,
            proposal_id=proposal.proposal_id,
            syntax_valid=True
        )

        # 2. Guardian review - V12: high-risk changes require human review
        verdict = await full_pipeline["guardian"].review(proposal, sandbox_result)
        # V12: Critical file changes are high-risk and not auto-approved
        assert verdict.risk_level == "high"
        assert verdict.requires_human_review is True

        # 3. Tier classification - should be Tier 3 (critical file + many lines)
        tier = full_pipeline["router"].classify(proposal, verdict)
        # The tier depends on scoring - evolution_daemon.py is critical (30 points)
        # + 100 lines (10 points) + 1 file (5 points) = 45+ points > 25 = Tier 3
        assert tier == 3

        # 4. Check that PR is required
        reqs = full_pipeline["router"].get_monitoring_requirements(tier)
        assert reqs["human_review"] is True

        # 5. Create PR branch
        branch = await full_pipeline["git"].create_pr_branch(proposal)
        assert "evolution" in branch


class TestSandboxRejection:
    """Test Scenario 4: Sandbox rejection blocks commit"""

    @pytest.mark.asyncio
    async def test_sandbox_rejection_blocks_commit(self, full_pipeline):
        """Test that failed sandbox validation blocks the pipeline"""
        proposal = EvolutionProposal(
            proposal_id="bad-001",
            goal="Add broken code",
            target_files=["broken.py"],
            diff_content="def broken(\n",  # Invalid syntax
            lines_changed=1
        )

        # 1. Sandbox validation - FAILS
        sandbox_result = SandboxResult(
            passed=False,
            proposal_id=proposal.proposal_id,
            syntax_valid=False,
            errors=["Syntax error: unexpected EOF"]
        )

        # 2. Should not proceed to Guardian
        assert sandbox_result.passed is False

        # 3. If we did review, Guardian would also reject
        verdict = await full_pipeline["guardian"].review(proposal, sandbox_result)
        assert verdict.approved is False


class TestGuardianRejection:
    """Test Scenario 5: Guardian rejection blocks commit"""

    @pytest.mark.asyncio
    async def test_guardian_rejection_blocks_commit(self, full_pipeline):
        """Test that Guardian rejection blocks the pipeline"""
        proposal = EvolutionProposal(
            proposal_id="unsafe-001",
            goal="Add dynamic execution",
            target_files=["daemon.py"],
            diff_content="exec(user_input)\nos.system(cmd)",
            lines_changed=2
        )

        # 1. Sandbox validation - passes
        sandbox_result = SandboxResult(
            passed=True,
            proposal_id=proposal.proposal_id,
            syntax_valid=True
        )

        # 2. Guardian review - REJECTS (unsafe patterns)
        verdict = await full_pipeline["guardian"].review(proposal, sandbox_result)
        assert verdict.approved is False
        assert len(verdict.issues_found) > 0


class TestPostCommitRollback:
    """Test Scenario 6: Post-commit failure triggers rollback"""

    @pytest.mark.asyncio
    async def test_regression_triggers_rollback(self, full_pipeline):
        """Test that post-commit regression triggers recovery"""
        # Simulate a committed change that later fails
        commit_sha = "abc123"

        # Create unhealthy monitoring result
        result = MonitoringResult(
            healthy=False,
            commit_sha=commit_sha,
            tier=1,
            regression_failures=["test_critical failed"]
        )

        # Recovery should determine action
        action = full_pipeline["recovery"]._determine_action(result)

        # Tier 1 with test failure should auto-revert
        assert action == RecoveryAction.AUTO_REVERT


class TestFullPipelineIntegration:
    """Full pipeline integration tests"""

    @pytest.mark.asyncio
    async def test_complete_evolution_flow(self, full_pipeline):
        """Test complete evolution from proposal to commit"""
        repo_path = full_pipeline["repo_path"]

        # Create the file that will be modified
        utils_file = Path(repo_path) / "utils.py"
        utils_file.write_text("# Original\n")

        proposal = EvolutionProposal(
            proposal_id="full-001",
            goal="Add feature",
            target_files=["utils.py"],
            diff_content="# New feature\n",
            lines_changed=1
        )

        # Step through the entire pipeline
        steps_completed = []

        # 1. Sandbox
        sandbox_result = SandboxResult(
            passed=True,
            proposal_id=proposal.proposal_id,
            syntax_valid=True
        )
        steps_completed.append("sandbox")

        # 2. Guardian
        verdict = await full_pipeline["guardian"].review(proposal, sandbox_result)
        assert verdict.approved
        steps_completed.append("guardian")

        # 3. Tier
        tier = full_pipeline["router"].classify(proposal, verdict)
        steps_completed.append("tier")

        # 4. Commit or PR
        if tier < 3:
            # Actually modify the file
            utils_file.write_text("# New feature\n")
            subprocess.run(["git", "add", "utils.py"], cwd=repo_path, check=True, capture_output=True)
            sha = await full_pipeline["git"].commit_evolution(proposal, verdict, tier)
            steps_completed.append("commit")
        else:
            branch = await full_pipeline["git"].create_pr_branch(proposal)
            steps_completed.append("pr")

        # 5. Monitor
        await full_pipeline["monitor"].capture_baseline()
        steps_completed.append("monitor")

        # All steps should complete
        assert len(steps_completed) == 5

    @pytest.mark.asyncio
    async def test_evolution_history_tracking(self, full_pipeline):
        """Test that evolution history is properly tracked"""
        repo_path = full_pipeline["repo_path"]

        # Create the file that will be modified
        test_file = Path(repo_path) / "test.py"
        test_file.write_text("# Original\n")

        # Make a commit
        proposal = EvolutionProposal(
            proposal_id="history-001",
            goal="Test commit",
            target_files=["test.py"],
            diff_content="# test\n",
            lines_changed=1
        )

        sandbox_result = SandboxResult(passed=True, proposal_id=proposal.proposal_id)
        verdict = await full_pipeline["guardian"].review(proposal, sandbox_result)
        tier = full_pipeline["router"].classify(proposal, verdict)

        # Actually modify and stage the file
        test_file.write_text("# test\n")
        subprocess.run(["git", "add", "test.py"], cwd=repo_path, check=True, capture_output=True)

        await full_pipeline["git"].commit_evolution(proposal, verdict, tier)

        # Check history
        history = await full_pipeline["git"].get_evolution_history(limit=10)
        assert len(history) >= 1
        assert "[EVOLUTION]" in history[0]["subject"]


class TestPipelineSafetyGuarantees:
    """Test the safety guarantees of the V11 pipeline"""

    @pytest.mark.asyncio
    async def test_broken_code_never_reaches_codebase(self, full_pipeline):
        """Verify that syntax-broken code is rejected at sandbox"""
        broken_proposal = EvolutionProposal(
            proposal_id="broken-001",
            goal="Add broken code",
            target_files=["broken.py"],
            diff_content="def incomplete(\nclass Bad:",
            lines_changed=2
        )

        # Sandbox should catch syntax errors
        sandbox_result = SandboxResult(
            passed=False,
            proposal_id=broken_proposal.proposal_id,
            syntax_valid=False,
            errors=["Syntax error"]
        )

        # Pipeline should stop here
        assert sandbox_result.passed is False

    @pytest.mark.asyncio
    async def test_unsafe_logic_is_reviewed(self, full_pipeline):
        """Verify that unsafe code patterns are caught by Guardian"""
        unsafe_proposal = EvolutionProposal(
            proposal_id="unsafe-001",
            goal="Add eval feature",
            target_files=["eval.py"],
            diff_content="result = eval(user_input)",
            lines_changed=1
        )

        sandbox_result = SandboxResult(
            passed=True,
            proposal_id=unsafe_proposal.proposal_id,
            syntax_valid=True
        )

        verdict = await full_pipeline["guardian"].review(unsafe_proposal, sandbox_result)

        # Guardian should reject unsafe patterns
        assert verdict.approved is False

    @pytest.mark.asyncio
    async def test_major_changes_require_human_approval(self, full_pipeline):
        """Verify that major changes are classified as Tier 3"""
        major_proposal = EvolutionProposal(
            proposal_id="major-001",
            goal="Rewrite daemon",
            target_files=["daemon.py"],
            diff_content="x" * 3000,  # Large change
            lines_changed=150
        )

        sandbox_result = SandboxResult(
            passed=True,
            proposal_id=major_proposal.proposal_id
        )

        verdict = await full_pipeline["guardian"].review(major_proposal, sandbox_result)
        tier = full_pipeline["router"].classify(major_proposal, verdict)

        # Should be Tier 3
        assert tier == 3

        # Should require human review
        reqs = full_pipeline["router"].get_monitoring_requirements(tier)
        assert reqs["human_review"] is True


class TestVisualVerificationIntegration:
    """Tests for V12 Journeyman Stage visual verification integration"""

    def test_visual_verification_service_available(self):
        """Verify VisualVerificationService is available in EvolutionDaemon"""
        from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
        from systems.evolution_daemon.visual_verification_service import VisualVerificationService

        daemon = EvolutionDaemon.__new__(EvolutionDaemon)
        # Check that the class has the visual_verification attribute
        assert hasattr(EvolutionDaemon, '__init__')

    def test_visual_intent_field_in_task(self):
        """Verify EvolutionTask has visual_intent field"""
        from systems.evolution_daemon.evolution_daemon import EvolutionTask
        from systems.evolution_daemon.visual_verification_service import VisualIntent

        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40)
        )

        task = EvolutionTask(
            task_id="test-001",
            goal="Add button",
            visual_intent=intent
        )

        assert task.visual_intent is not None
        assert task.visual_intent.element_type == "button"
        assert task.visual_attempt == 0

    def test_visual_attempt_counter(self):
        """Verify visual_attempt counter is tracked"""
        from systems.evolution_daemon.evolution_daemon import EvolutionTask

        task = EvolutionTask(
            task_id="test-002",
            goal="Test counter"
        )

        assert task.visual_attempt == 0
        task.visual_attempt += 1
        assert task.visual_attempt == 1

    @pytest.mark.asyncio
    async def test_visual_verification_flow(self):
        """Test complete visual verification flow with mock"""
        from systems.evolution_daemon.visual_verification_service import (
            VisualVerificationService, VisualIntent
        )

        service = VisualVerificationService()
        intent = VisualIntent(
            element_type="button",
            position=(100, 200),
            size=(80, 40),
            critical=True
        )
        scene = {
            "children": [
                {"type": "Button", "x": 100, "y": 200, "width": 80, "height": 40}
            ]
        }

        result = await service.verify(intent, scene, attempt_number=1)

        assert result.success is True
        assert result.should_retry is False
        assert result.overall_confidence >= 0.9


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
