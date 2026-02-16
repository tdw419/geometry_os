"""
Evolution Daemon V11 - Post-Commit Monitor & Recovery

Monitors system health after commits and provides automated recovery.

PostCommitMonitor:
- Capture baseline metrics before commit
- Run regression tests after commit
- Compare visual state (Tier 2+)
- Check performance metrics (Tier 2+)

EvolutionRecovery:
- Handle detected regressions
- Auto-revert when appropriate
- Alert Guardian for review
- Pause evolution loop if needed
"""

import asyncio
import logging
import time
from dataclasses import dataclass, field
from datetime import datetime
from typing import Dict, List, Optional, Tuple, Any

from .data_structures import MonitoringResult, RecoveryAction, GuardianVerdict
from .git_integration import GitIntegration
from .guardian_gate import GuardianGate

logger = logging.getLogger("evolution_daemon.monitor")


class PostCommitMonitor:
    """
    Monitors system health after evolution commits.

    Tier-based monitoring:
    - Tier 1: Regression tests only
    - Tier 2: + Visual heartbeat + Performance check
    - Tier 3: + Full integration tests (runs as PR checks)
    """

    def __init__(self, git: GitIntegration, webmcp_client=None):
        """
        Initialize the post-commit monitor.

        Args:
            git: GitIntegration instance for rollback operations
            webmcp_client: WebMCPClient for visual monitoring (optional)
        """
        self.git = git
        self.webmcp = webmcp_client
        self._baseline: Dict[str, Any] = {}
        self._monitoring_history: List[MonitoringResult] = []

    async def capture_baseline(self) -> Dict:
        """
        Capture baseline metrics before commit.

        Returns:
            Dict of baseline metrics
        """
        baseline = {
            "timestamp": datetime.now().isoformat(),
            "commit_sha": await self.git.get_current_sha(),
            "branch": await self.git.get_current_branch(),
        }

        # Capture test baseline
        test_result = await self._run_tests()
        baseline["tests_passing"] = test_result.get("passed", 0)
        baseline["tests_total"] = test_result.get("total", 0)

        # Capture visual baseline if available
        if self.webmcp and self.webmcp.connected:
            baseline["visual_state"] = await self._capture_visual_state()

        # Capture performance baseline
        baseline["performance"] = await self._capture_performance_metrics()

        self._baseline = baseline
        logger.info(f"📊 Captured baseline at {baseline['commit_sha'][:8]}")
        return baseline

    async def run_regression_tests(self) -> Tuple[bool, List[str]]:
        """
        Run regression test suite.

        Returns:
            Tuple of (passed, list_of_failures)
        """
        import subprocess
        import sys

        failures = []

        try:
            result = subprocess.run(
                [sys.executable, "-m", "pytest",
                 "systems/evolution_daemon/tests/",
                 "-v", "--tb=short", "-x"],
                capture_output=True,
                text=True,
                timeout=120,
                cwd=str(self.git.repo_path)
            )

            # Parse failures from output
            if result.returncode != 0:
                for line in result.stdout.split('\n'):
                    if 'FAILED' in line:
                        failures.append(line.strip())

            passed = result.returncode == 0
            logger.info(f"{'✅' if passed else '❌'} Regression tests: {'passed' if passed else f'{len(failures)} failed'}")
            return passed, failures

        except subprocess.TimeoutExpired:
            logger.error("Regression tests timed out")
            return False, ["Test suite timeout"]
        except Exception as e:
            logger.error(f"Failed to run regression tests: {e}")
            return False, [str(e)]

    async def capture_visual_heartbeat(self) -> Dict:
        """
        Capture current visual state of the OS.

        Returns:
            Dict with visual state information
        """
        if not self.webmcp or not self.webmcp.connected:
            return {"available": False, "reason": "WebMCP not connected"}

        try:
            state = await self.webmcp.get_os_state()
            bounds = await self.webmcp.get_map_bounds()

            return {
                "available": True,
                "state": state,
                "bounds": bounds,
                "timestamp": datetime.now().isoformat()
            }
        except Exception as e:
            logger.warning(f"Could not capture visual heartbeat: {e}")
            return {"available": False, "reason": str(e)}

    async def compare_visual_state(
        self,
        current: Dict,
        baseline: Dict
    ) -> Tuple[bool, List[str]]:
        """
        Compare current visual state against baseline.

        Args:
            current: Current visual state
            baseline: Baseline visual state

        Returns:
            Tuple of (healthy, list_of_anomalies)
        """
        anomalies = []

        if not current.get("available") or not baseline.get("available"):
            return True, []  # Can't compare, assume OK

        # Check for missing UI elements
        current_elements = set(current.get("state", {}).get("elements", []))
        baseline_elements = set(baseline.get("state", {}).get("elements", []))

        missing = baseline_elements - current_elements
        if missing:
            anomalies.append(f"Missing UI elements: {missing}")

        # Check for unexpected errors visible on map
        state = current.get("state", {})
        if "error" in str(state).lower():
            anomalies.append("Error message visible on map")

        # Check agent positions (if available)
        current_agents = state.get("agents", {})
        baseline_agents = baseline.get("state", {}).get("agents", {})

        for agent_id, pos in baseline_agents.items():
            if agent_id in current_agents:
                curr_pos = current_agents[agent_id]
                # Check for sudden large jumps (anomaly)
                if isinstance(pos, dict) and isinstance(curr_pos, dict):
                    dx = abs(curr_pos.get("x", 0) - pos.get("x", 0))
                    dy = abs(curr_pos.get("y", 0) - pos.get("y", 0))
                    if dx > 500 or dy > 500:
                        anomalies.append(f"Agent {agent_id} position anomaly: ({dx}, {dy})")

        healthy = len(anomalies) == 0
        return healthy, anomalies

    async def check_performance_metrics(self) -> Dict:
        """
        Check performance metrics.

        Returns:
            Dict with performance information
        """
        import psutil

        metrics = {
            "timestamp": datetime.now().isoformat(),
            "cpu_percent": psutil.cpu_percent(interval=1),
            "memory_percent": psutil.virtual_memory().percent,
            "disk_percent": psutil.disk_usage('/').percent,
        }

        # Check for concerning levels
        warnings = []
        if metrics["cpu_percent"] > 90:
            warnings.append(f"High CPU: {metrics['cpu_percent']}%")
        if metrics["memory_percent"] > 90:
            warnings.append(f"High memory: {metrics['memory_percent']}%")
        if metrics["disk_percent"] > 90:
            warnings.append(f"High disk: {metrics['disk_percent']}%")

        metrics["warnings"] = warnings
        return metrics

    async def monitor_tier_1(self, commit_sha: str) -> MonitoringResult:
        """
        Tier 1 monitoring: Regression tests only.

        Args:
            commit_sha: SHA of commit to monitor

        Returns:
            MonitoringResult
        """
        logger.info(f"🔍 Tier 1 monitoring for {commit_sha[:8]}")

        # Run regression tests
        tests_passed, failures = await self.run_regression_tests()

        result = MonitoringResult(
            healthy=tests_passed,
            commit_sha=commit_sha,
            tier=1,
            regression_tests_passed=tests_passed,
            regression_failures=failures
        )

        self._monitoring_history.append(result)
        return result

    async def monitor_tier_2(self, commit_sha: str) -> MonitoringResult:
        """
        Tier 2 monitoring: Tests + Visual + Performance.

        Args:
            commit_sha: SHA of commit to monitor

        Returns:
            MonitoringResult
        """
        logger.info(f"🔍 Tier 2 monitoring for {commit_sha[:8]}")

        # 1. Run regression tests
        tests_passed, failures = await self.run_regression_tests()

        # 2. Capture and compare visual state
        current_visual = await self.capture_visual_heartbeat()
        baseline_visual = self._baseline.get("visual_state", {})
        visual_healthy, visual_anomalies = await self.compare_visual_state(
            current_visual, baseline_visual
        )

        # 3. Check performance
        perf = await self.check_performance_metrics()
        perf_healthy = len(perf.get("warnings", [])) == 0

        # Determine overall health
        healthy = tests_passed and visual_healthy and perf_healthy

        result = MonitoringResult(
            healthy=healthy,
            commit_sha=commit_sha,
            tier=2,
            regression_tests_passed=tests_passed,
            regression_failures=failures,
            visual_healthy=visual_healthy,
            visual_anomalies=visual_anomalies,
            performance_ok=perf_healthy,
            performance_degradations=perf.get("warnings", []),
            details={
                "visual": current_visual,
                "performance": perf
            }
        )

        self._monitoring_history.append(result)
        return result

    async def monitor(self, commit_sha: str, tier: int) -> MonitoringResult:
        """
        Run appropriate monitoring for tier.

        Args:
            commit_sha: SHA of commit to monitor
            tier: Monitoring tier (1, 2, or 3)

        Returns:
            MonitoringResult
        """
        if tier == 1:
            return await self.monitor_tier_1(commit_sha)
        elif tier == 2:
            return await self.monitor_tier_2(commit_sha)
        else:
            # Tier 3: Full monitoring (same as Tier 2 for now)
            return await self.monitor_tier_2(commit_sha)

    async def _run_tests(self) -> Dict:
        """Run quick test suite for baseline capture"""
        import subprocess
        import sys

        try:
            result = subprocess.run(
                [sys.executable, "-m", "pytest",
                 "systems/evolution_daemon/heartbeat_tests/",
                 "-v", "--tb=no", "-q"],
                capture_output=True,
                text=True,
                timeout=60,
                cwd=str(self.git.repo_path)
            )

            # Parse test counts
            output = result.stdout + result.stderr
            passed = output.count(" passed")
            total = output.count("::test")  # Count test functions

            return {"passed": passed, "total": max(total, passed)}

        except Exception as e:
            logger.warning(f"Could not run tests for baseline: {e}")
            return {"passed": 0, "total": 0}

    async def _capture_visual_state(self) -> Dict:
        """Capture visual state for baseline"""
        return await self.capture_visual_heartbeat()

    async def _capture_performance_metrics(self) -> Dict:
        """Capture performance metrics for baseline"""
        return await self.check_performance_metrics()

    def get_monitoring_history(self, limit: int = 10) -> List[MonitoringResult]:
        """Get recent monitoring results"""
        return self._monitoring_history[-limit:]


class EvolutionRecovery:
    """
    Handles recovery actions when regressions are detected.

    Recovery actions:
    - AUTO_REVERT: Immediately rollback the commit
    - ALERT_PAUSE: Alert Guardian, pause evolutions
    - ESCALATE: Human notification required
    """

    def __init__(self, git: GitIntegration, guardian: GuardianGate):
        """
        Initialize recovery handler.

        Args:
            git: GitIntegration for rollback operations
            guardian: GuardianGate for alerting
        """
        self.git = git
        self.guardian = guardian
        self._recovery_history: List[Dict] = []
        self._evolution_paused = False
        self._pause_reason: Optional[str] = None

    async def handle_regression(
        self,
        commit_sha: str,
        result: MonitoringResult
    ) -> RecoveryAction:
        """
        Handle a detected regression.

        Args:
            commit_sha: SHA of problematic commit
            result: Monitoring result that triggered recovery

        Returns:
            RecoveryAction taken
        """
        logger.warning(f"🚨 Handling regression from commit {commit_sha[:8]}")
        logger.warning(f"   Issues: {result.issues}")

        # Determine recovery action based on severity
        action = self._determine_action(result)

        if action == RecoveryAction.AUTO_REVERT:
            success = await self.git.rollback(commit_sha)
            if success:
                logger.info(f"✅ Auto-reverted commit {commit_sha[:8]}")
                self._record_recovery(commit_sha, action, success=True)
                return action
            else:
                # Fall back to alert
                logger.error("Auto-revert failed, escalating")
                action = RecoveryAction.ESCALATE

        if action == RecoveryAction.ALERT_PAUSE:
            await self.alert_guardian(result)
            await self.pause_evolution_loop(f"Regression detected: {result.issues}")

        if action == RecoveryAction.ESCALATE:
            await self._escalate_to_human(commit_sha, result)

        self._record_recovery(commit_sha, action, success=True)
        return action

    def _determine_action(self, result: MonitoringResult) -> RecoveryAction:
        """Determine appropriate recovery action"""
        issues = result.issues

        # Check severity of issues
        critical_patterns = [
            "security", "injection", "exploit", "vulnerability",
            "crash", "segfault", "memory leak", "data loss"
        ]

        for issue in issues:
            issue_lower = issue.lower()
            for pattern in critical_patterns:
                if pattern in issue_lower:
                    return RecoveryAction.ESCALATE

        # Test failures but no critical issues - try auto-revert
        if result.regression_failures and not result.visual_anomalies:
            if result.tier == 1:
                return RecoveryAction.AUTO_REVERT

        # Visual anomalies - alert and pause
        if result.visual_anomalies:
            return RecoveryAction.ALERT_PAUSE

        # Performance degradation - alert
        if result.performance_degradations:
            return RecoveryAction.ALERT_PAUSE

        # Default to alert for safety
        return RecoveryAction.ALERT_PAUSE

    async def alert_guardian(self, result: MonitoringResult):
        """Alert Guardian agent about the regression"""
        logger.warning(f"⚠️ Alerting Guardian about regression")

        # Log detailed alert
        alert_message = f"""
        REGRESSION DETECTED

        Commit: {result.commit_sha[:8]}
        Tier: {result.tier}

        Test Failures: {result.regression_failures}
        Visual Anomalies: {result.visual_anomalies}
        Performance Issues: {result.performance_degradations}

        Action Required: Review and determine if rollback is needed.
        """

        logger.warning(alert_message)

        # In a full implementation, this would:
        # - Create a GitHub issue
        # - Send notification
        # - Update metrics

    async def pause_evolution_loop(self, reason: str):
        """Pause the evolution loop"""
        self._evolution_paused = True
        self._pause_reason = reason
        logger.warning(f"⏸️ Evolution loop paused: {reason}")

    async def resume_evolution_loop(self):
        """Resume the evolution loop"""
        self._evolution_paused = False
        self._pause_reason = None
        logger.info("▶️ Evolution loop resumed")

    def is_paused(self) -> Tuple[bool, Optional[str]]:
        """Check if evolution loop is paused"""
        return self._evolution_paused, self._pause_reason

    async def _escalate_to_human(self, commit_sha: str, result: MonitoringResult):
        """Escalate to human review"""
        logger.critical(f"🔴 ESCALATING TO HUMAN: {commit_sha[:8]}")

        # Log escalation
        escalation_message = f"""
        ═══════════════════════════════════════
        HUMAN REVIEW REQUIRED

        Commit: {commit_sha}
        Time: {datetime.now().isoformat()}

        Issues Detected:
        {chr(10).join(f'- {i}' for i in result.issues)}

        This change requires human review before proceeding.
        ═══════════════════════════════════════
        """

        logger.critical(escalation_message)

        # In a full implementation:
        # - Send email/Slack notification
        # - Create GitHub issue with "critical" label
        # - Block further evolutions until resolved

        await self.pause_evolution_loop("Human review required")

    def _record_recovery(self, commit_sha: str, action: RecoveryAction, success: bool):
        """Record recovery action for history"""
        self._recovery_history.append({
            "commit_sha": commit_sha,
            "action": action.value,
            "success": success,
            "timestamp": datetime.now().isoformat()
        })

    def get_recovery_history(self, limit: int = 10) -> List[Dict]:
        """Get recent recovery actions"""
        return self._recovery_history[-limit:]
