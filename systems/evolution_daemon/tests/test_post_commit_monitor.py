"""Unit tests for PostCommitMonitor and EvolutionRecovery"""

import pytest
import tempfile
import subprocess
from pathlib import Path
from unittest.mock import Mock, AsyncMock, patch

from systems.evolution_daemon.safety import (
    PostCommitMonitor, EvolutionRecovery, MonitoringResult,
    GitIntegration, GuardianGate, RecoveryAction
)


@pytest.fixture
def temp_git_repo():
    """Create a temporary git repository for testing"""
    with tempfile.TemporaryDirectory() as tmpdir:
        subprocess.run(["git", "init"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=tmpdir, check=True, capture_output=True)

        test_file = Path(tmpdir) / "test.py"
        test_file.write_text("# Initial\n")
        subprocess.run(["git", "add", "test.py"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Initial"], cwd=tmpdir, check=True, capture_output=True)

        yield tmpdir


@pytest.fixture
def git_integration(temp_git_repo):
    """Create GitIntegration with temp repo"""
    return GitIntegration(repo_path=temp_git_repo)


@pytest.fixture
def guardian_gate():
    """Create GuardianGate without ZAI bridge"""
    return GuardianGate(zai_bridge=None)


@pytest.fixture
def mock_webmcp():
    """Create a mock WebMCP client"""
    mock = Mock()
    mock.connected = False
    return mock


@pytest.fixture
def monitor(git_integration, mock_webmcp):
    """Create PostCommitMonitor instance"""
    return PostCommitMonitor(git=git_integration, webmcp_client=mock_webmcp)


@pytest.fixture
def recovery(git_integration, guardian_gate):
    """Create EvolutionRecovery instance"""
    return EvolutionRecovery(git=git_integration, guardian=guardian_gate)


class TestPostCommitMonitor:
    """Tests for PostCommitMonitor class"""

    def test_initialization(self, monitor):
        """Test that monitor initializes correctly"""
        assert monitor.git is not None
        assert monitor._baseline == {}
        assert monitor._monitoring_history == []

    @pytest.mark.asyncio
    async def test_capture_baseline(self, monitor):
        """Test baseline capture"""
        baseline = await monitor.capture_baseline()

        assert "timestamp" in baseline
        assert "commit_sha" in baseline
        assert "branch" in baseline

    @pytest.mark.asyncio
    async def test_capture_visual_heartbeat_no_webmcp(self, monitor):
        """Test visual heartbeat when WebMCP not available"""
        result = await monitor.capture_visual_heartbeat()

        assert result["available"] is False

    @pytest.mark.asyncio
    async def test_check_performance_metrics(self, monitor):
        """Test performance metrics collection"""
        metrics = await monitor.check_performance_metrics()

        assert "timestamp" in metrics
        assert "cpu_percent" in metrics
        assert "memory_percent" in metrics
        assert "warnings" in metrics

    @pytest.mark.asyncio
    async def test_compare_visual_state_unavailable(self, monitor):
        """Test visual comparison when not available"""
        current = {"available": False}
        baseline = {"available": False}

        healthy, anomalies = await monitor.compare_visual_state(current, baseline)
        assert healthy is True  # Can't compare, assume OK

    @pytest.mark.asyncio
    async def test_monitor_tier_1(self, monitor, git_integration):
        """Test Tier 1 monitoring"""
        sha = await git_integration.get_current_sha()
        result = await monitor.monitor_tier_1(sha)

        assert result.commit_sha == sha
        assert result.tier == 1
        assert isinstance(result.healthy, bool)

    @pytest.mark.asyncio
    async def test_monitor_tier_2(self, monitor, git_integration):
        """Test Tier 2 monitoring"""
        sha = await git_integration.get_current_sha()
        result = await monitor.monitor_tier_2(sha)

        assert result.commit_sha == sha
        assert result.tier == 2

    @pytest.mark.asyncio
    async def test_monitor_routing(self, monitor, git_integration):
        """Test that monitor() routes to correct tier"""
        sha = await git_integration.get_current_sha()

        result1 = await monitor.monitor(sha, tier=1)
        assert result1.tier == 1

        result2 = await monitor.monitor(sha, tier=2)
        assert result2.tier == 2

    @pytest.mark.asyncio
    async def test_monitoring_history(self, monitor, git_integration):
        """Test that results are stored in history"""
        sha = await git_integration.get_current_sha()
        await monitor.monitor(sha, tier=1)

        history = monitor.get_monitoring_history()
        assert len(history) == 1


class TestMonitoringResult:
    """Tests for MonitoringResult dataclass"""

    def test_issues_property(self):
        """Test that issues property aggregates all issue lists"""
        result = MonitoringResult(
            healthy=False,
            commit_sha="abc123",
            tier=2,
            regression_failures=["test1 failed"],
            visual_anomalies=["color changed"],
            performance_degradations=["CPU high"]
        )

        issues = result.issues
        assert len(issues) == 3
        assert "test1 failed" in issues
        assert "color changed" in issues
        assert "CPU high" in issues

    def test_healthy_result_has_no_issues(self):
        """Test that healthy result has no issues"""
        result = MonitoringResult(
            healthy=True,
            commit_sha="abc123",
            tier=1
        )

        assert result.issues == []


class TestEvolutionRecovery:
    """Tests for EvolutionRecovery class"""

    def test_initialization(self, recovery):
        """Test that recovery initializes correctly"""
        assert recovery.git is not None
        assert recovery.guardian is not None
        assert recovery._evolution_paused is False
        assert recovery._pause_reason is None

    def test_determine_action_critical(self, recovery):
        """Test action determination for critical issues"""
        result = MonitoringResult(
            healthy=False,
            commit_sha="abc123",
            tier=1,
            regression_failures=["security vulnerability detected"]
        )

        action = recovery._determine_action(result)
        assert action.value == "escalate"

    def test_determine_action_tier1_test_failure(self, recovery):
        """Test action for Tier 1 test failure"""
        result = MonitoringResult(
            healthy=False,
            commit_sha="abc123",
            tier=1,
            regression_failures=["test failed"]
        )

        action = recovery._determine_action(result)
        assert action.value == "auto_revert"

    def test_determine_action_visual_anomaly(self, recovery):
        """Test action for visual anomalies"""
        result = MonitoringResult(
            healthy=False,
            commit_sha="abc123",
            tier=2,
            visual_anomalies=["missing UI element"]
        )

        action = recovery._determine_action(result)
        assert action.value == "alert_pause"

    @pytest.mark.asyncio
    async def test_pause_evolution_loop(self, recovery):
        """Test pausing evolution loop"""
        await recovery.pause_evolution_loop("Test pause")

        paused, reason = recovery.is_paused()
        assert paused is True
        assert reason == "Test pause"

    @pytest.mark.asyncio
    async def test_resume_evolution_loop(self, recovery):
        """Test resuming evolution loop"""
        await recovery.pause_evolution_loop("Test pause")
        await recovery.resume_evolution_loop()

        paused, reason = recovery.is_paused()
        assert paused is False
        assert reason is None

    @pytest.mark.asyncio
    async def test_handle_regression(self, recovery):
        """Test handling a regression"""
        result = MonitoringResult(
            healthy=False,
            commit_sha="abc123",
            tier=1,
            regression_failures=["test failed"]
        )

        action = await recovery.handle_regression("abc123", result)
        assert action in [RecoveryAction.AUTO_REVERT, RecoveryAction.ALERT_PAUSE, RecoveryAction.ESCALATE]

    def test_recovery_history(self, recovery):
        """Test that recoveries are stored in history"""
        recovery._record_recovery("abc123", RecoveryAction.AUTO_REVERT, True)

        history = recovery.get_recovery_history()
        assert len(history) == 1
        assert history[0]["commit_sha"] == "abc123"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
