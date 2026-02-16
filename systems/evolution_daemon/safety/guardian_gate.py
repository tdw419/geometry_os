"""
Evolution Daemon V11 - Guardian Gate

The Guardian is an AI-powered code review gate that evaluates proposed
changes for safety, correctness, and alignment with Geometry OS principles.

Review Criteria:
- Security vulnerabilities (injection, XSS, etc.)
- Logic errors or unhandled edge cases
- Breaking changes to interfaces
- Alignment with Geometry OS principles
"""

import logging
from typing import Optional, List

from .data_structures import EvolutionProposal, SandboxResult, GuardianVerdict

logger = logging.getLogger("evolution_daemon.guardian")


class GuardianGate:
    """
    AI-powered code review gate for evolution proposals.

    The Guardian acts as the second stage of validation (after sandbox)
    and provides intelligent review of proposed changes.
    """

    # Criteria that trigger automatic rejection
    REJECTION_PATTERNS = [
        "exec(",          # Dynamic code execution
        "eval(",          # Dynamic code evaluation
        "__import__(",    # Dynamic imports
        "subprocess.call(",  # Shell commands (use run instead)
        "os.system(",     # Shell commands
        "pickle.loads(",  # Unsafe deserialization
        "yaml.load(",     # Unsafe YAML (use safe_load)
    ]

    # Patterns that require human review
    ESCALATION_PATTERNS = [
        "delete_all",     # Mass deletion
        "drop_table",     # Database operations
        "truncate",       # Data truncation
        "shutdown",       # System shutdown
        "format_drive",   # Disk operations
    ]

    def __init__(self, zai_bridge=None):
        """
        Initialize the Guardian Gate.

        Args:
            zai_bridge: ZAIIntegration instance for AI-powered review.
                       If None, uses rule-based review only.
        """
        self.zai_bridge = zai_bridge
        self._review_history: List[GuardianVerdict] = []

    async def review(
        self,
        proposal: EvolutionProposal,
        sandbox_result: SandboxResult
    ) -> GuardianVerdict:
        """
        Review a proposed evolution for safety and correctness.

        Args:
            proposal: The evolution proposal to review
            sandbox_result: Results from sandbox validation

        Returns:
            GuardianVerdict with approval decision and reasoning
        """
        logger.info(f"🔍 Guardian reviewing proposal: {proposal.proposal_id}")

        issues_found = []
        recommendations = []
        risk_level = "low"
        approved = True

        # 1. Check for automatic rejection patterns
        rejection_issues = self._check_rejection_patterns(proposal)
        if rejection_issues:
            issues_found.extend(rejection_issues)
            approved = False
            risk_level = "high"
            logger.warning(f"❌ Guardian rejected: {rejection_issues}")

        # 2. Check for escalation patterns
        escalation_issues = self._check_escalation_patterns(proposal)
        if escalation_issues:
            issues_found.extend(escalation_issues)
            risk_level = "high"

        # 3. Check sandbox results
        if not sandbox_result.passed:
            issues_found.append("Sandbox validation failed")
            approved = False

        if sandbox_result.errors:
            issues_found.extend(sandbox_result.errors[:3])  # Limit to 3

        # 4. Analyze change scope
        scope_risk = self._analyze_scope(proposal)
        if scope_risk == "high":
            risk_level = "high"
        elif scope_risk == "medium" and risk_level != "high":
            risk_level = "medium"

        # 5. AI-powered review (if available)
        if self.zai_bridge and not self.zai_bridge.is_mock_mode:
            ai_review = await self._ai_review(proposal)
            if ai_review:
                issues_found.extend(ai_review.get("issues", []))
                recommendations.extend(ai_review.get("recommendations", []))
                if ai_review.get("risk_level"):
                    risk_level = ai_review["risk_level"]
                if ai_review.get("approved") is False:
                    approved = False

        # Create verdict
        verdict = GuardianVerdict(
            approved=approved,
            proposal_id=proposal.proposal_id,
            risk_level=risk_level,
            confidence=self._calculate_confidence(issues_found, sandbox_result),
            issues_found=issues_found,
            recommendations=recommendations,
            reasoning=self._generate_reasoning(approved, issues_found, risk_level)
        )

        self._review_history.append(verdict)
        logger.info(f"{'✅' if approved else '❌'} Guardian verdict: {verdict.risk_level} risk, {len(issues_found)} issues")

        return verdict

    def _check_rejection_patterns(self, proposal: EvolutionProposal) -> List[str]:
        """Check for patterns that trigger automatic rejection"""
        issues = []
        content = proposal.diff_content.lower()

        for pattern in self.REJECTION_PATTERNS:
            if pattern.lower() in content:
                issues.append(f"Unsafe pattern detected: {pattern}")

        return issues

    def _check_escalation_patterns(self, proposal: EvolutionProposal) -> List[str]:
        """Check for patterns that require human review"""
        issues = []
        content = proposal.diff_content.lower()

        for pattern in self.ESCALATION_PATTERNS:
            if pattern.lower() in content:
                issues.append(f"Escalation pattern detected: {pattern} - requires human review")

        return issues

    def _analyze_scope(self, proposal: EvolutionProposal) -> str:
        """Analyze the scope of changes to determine risk level"""
        # High risk if changing critical files
        critical_files = {
            "evolution_daemon.py": "high",
            "zai_bridge.py": "high",
            "guardian_gate.py": "medium",
            "sandbox_manager.py": "medium",
        }

        for target_file in proposal.target_files:
            filename = target_file.split("/")[-1]
            if filename in critical_files:
                return critical_files[filename]

        # Check lines changed
        if proposal.lines_changed > 100:
            return "high"
        elif proposal.lines_changed > 30:
            return "medium"

        return "low"

    async def _ai_review(self, proposal: EvolutionProposal) -> Optional[dict]:
        """
        Perform AI-powered review using Z.ai bridge.

        Returns dict with: issues, recommendations, risk_level, approved
        """
        if not self.zai_bridge:
            return None

        try:
            prompt = f"""
            Review this code change proposal for the Geometry OS evolution daemon.

            Goal: {proposal.goal}
            Target files: {proposal.target_files}
            Changes:
            ```
            {proposal.diff_content[:2000]}
            ```

            Check for:
            1. Security vulnerabilities
            2. Logic errors or edge cases
            3. Breaking changes to interfaces
            4. Alignment with self-modifying OS principles

            Respond in JSON format:
            {{
                "approved": true/false,
                "risk_level": "low"|"medium"|"high",
                "issues": ["issue1", "issue2"],
                "recommendations": ["rec1", "rec2"]
            }}
            """

            response = await self.zai_bridge.chat("guardian", prompt)

            # Parse JSON response
            import json
            # Extract JSON from response
            if "```json" in response:
                json_str = response.split("```json")[1].split("```")[0]
            elif "{" in response:
                start = response.index("{")
                end = response.rindex("}") + 1
                json_str = response[start:end]
            else:
                return None

            return json.loads(json_str)

        except Exception as e:
            logger.warning(f"AI review failed: {e}")
            return None

    def _calculate_confidence(
        self,
        issues: List[str],
        sandbox_result: SandboxResult
    ) -> float:
        """Calculate confidence in the verdict"""
        base_confidence = 0.9

        # Reduce for each issue found
        base_confidence -= len(issues) * 0.1

        # Boost if sandbox passed with good test coverage
        if sandbox_result.passed:
            base_confidence += 0.1
        if sandbox_result.heartbeat_pass_rate > 0.8:
            base_confidence += 0.05

        return max(0.1, min(1.0, base_confidence))

    def _generate_reasoning(
        self,
        approved: bool,
        issues: List[str],
        risk_level: str
    ) -> str:
        """Generate human-readable reasoning for the verdict"""
        if approved:
            if not issues:
                return "No issues found. Changes are safe to proceed."
            else:
                return f"Approved with {len(issues)} minor issues. Risk level: {risk_level}"
        else:
            return f"Rejected due to {len(issues)} issues. Risk level: {risk_level}. Issues: {'; '.join(issues[:3])}"

    async def request_architect_review(self, proposal: EvolutionProposal) -> bool:
        """
        Request human architect review for high-risk changes.

        This is called for Tier 3 changes that require human approval.

        Args:
            proposal: The proposal requiring human review

        Returns:
            True if review request was sent successfully
        """
        logger.info(f"📧 Requesting architect review for: {proposal.proposal_id}")

        # In a real implementation, this would:
        # 1. Create a GitHub PR
        # 2. Send notification to maintainers
        # 3. Log the request for tracking

        # For now, just log it
        logger.warning(
            f"ARCHITECT REVIEW REQUIRED for {proposal.proposal_id}\n"
            f"Goal: {proposal.goal}\n"
            f"Files: {proposal.target_files}\n"
            f"Lines changed: {proposal.lines_changed}"
        )

        return True

    def get_review_history(self, limit: int = 10) -> List[GuardianVerdict]:
        """Get recent review history"""
        return self._review_history[-limit:]
