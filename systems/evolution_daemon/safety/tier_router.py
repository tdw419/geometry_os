"""
Evolution Daemon V11 - Tier Router

Classifies evolution proposals into tiers based on their risk profile.
This determines the level of post-commit monitoring required.

Tier 1: Minor changes, auto-commit with basic monitoring
Tier 2: Medium changes, auto-commit with visual monitoring
Tier 3: Major changes, requires human review (PR)
"""

import logging
from typing import Dict

from .data_structures import EvolutionProposal, GuardianVerdict

logger = logging.getLogger("evolution_daemon.tier_router")


class TierRouter:
    """
    Routes evolution proposals to appropriate tiers based on risk assessment.

    Scoring factors:
    - Lines changed: +1 per 10 lines
    - Files affected: +5 per file
    - Critical file touched: +10 to +30 per file
    - Guardian risk: low=+0, medium=+5, high=+10

    Tier thresholds:
    - Tier 1: ≤10 points (minor, auto-commit)
    - Tier 2: ≤25 points (medium, + visual monitoring)
    - Tier 3: >25 points (major, requires PR)
    """

    # Critical files and their risk scores
    CRITICAL_FILES: Dict[str, int] = {
        "evolution_daemon.py": 30,
        "zai_bridge.py": 20,
        "zai_agent_integration.py": 20,
        "area_agent.py": 15,
        "guardian_gate.py": 15,
        "sandbox_manager.py": 15,
        "post_commit_monitor.py": 10,
        "git_integration.py": 10,
        "tier_router.py": 10,
        "vfs_*.py": 10,
    }

    # Tier thresholds
    TIER_1_THRESHOLD = 10
    TIER_2_THRESHOLD = 25

    def __init__(self):
        self._classification_history: Dict[str, int] = {}

    def calculate_score(
        self,
        proposal: EvolutionProposal,
        verdict: GuardianVerdict
    ) -> int:
        """
        Calculate risk score for a proposal.

        Args:
            proposal: The evolution proposal
            verdict: Guardian's review verdict

        Returns:
            Risk score (higher = more risky)
        """
        score = 0

        # 1. Lines changed: +1 per 10 lines
        lines_score = proposal.lines_changed // 10
        score += lines_score
        logger.debug(f"Lines score: {lines_score} ({proposal.lines_changed} lines)")

        # 2. Files affected: +5 per file
        files_score = len(proposal.target_files) * 5
        score += files_score
        logger.debug(f"Files score: {files_score} ({len(proposal.target_files)} files)")

        # 3. Critical file touched: +10 to +30 per file
        critical_score = 0
        for target_file in proposal.target_files:
            filename = target_file.split("/")[-1]

            # Check exact match
            if filename in self.CRITICAL_FILES:
                critical_score += self.CRITICAL_FILES[filename]
            else:
                # Check wildcard patterns
                for pattern, points in self.CRITICAL_FILES.items():
                    if "*" in pattern:
                        prefix = pattern.replace("*", "")
                        if filename.startswith(prefix):
                            critical_score += points
                            break

        score += critical_score
        logger.debug(f"Critical files score: {critical_score}")

        # 4. Guardian risk level
        risk_scores = {"low": 0, "medium": 5, "high": 10}
        guardian_score = risk_scores.get(verdict.risk_level, 0)
        score += guardian_score
        logger.debug(f"Guardian risk score: {guardian_score} ({verdict.risk_level})")

        # 5. Issues found by Guardian
        issues_score = min(len(verdict.issues_found) * 2, 10)  # Cap at 10
        score += issues_score
        logger.debug(f"Issues score: {issues_score} ({len(verdict.issues_found)} issues)")

        logger.info(f"Total risk score: {score}")
        return score

    def classify(
        self,
        proposal: EvolutionProposal,
        verdict: GuardianVerdict
    ) -> int:
        """
        Classify a proposal into a tier.

        Args:
            proposal: The evolution proposal
            verdict: Guardian's review verdict

        Returns:
            Tier number (1, 2, or 3)
        """
        score = self.calculate_score(proposal, verdict)

        if score <= self.TIER_1_THRESHOLD:
            tier = 1
        elif score <= self.TIER_2_THRESHOLD:
            tier = 2
        else:
            tier = 3

        # Override to Tier 3 if explicitly required
        if verdict.requires_human_review:
            tier = 3
            logger.info("Tier 3 override: human review required")

        # Store classification
        self._classification_history[proposal.proposal_id] = tier

        tier_names = {1: "Minor", 2: "Medium", 3: "Major"}
        logger.info(f"📊 Classified as Tier {tier} ({tier_names[tier]}) - Score: {score}")

        return tier

    def get_tier_description(self, tier: int) -> str:
        """Get human-readable description of a tier"""
        descriptions = {
            1: "Minor changes - Auto-commit with basic monitoring",
            2: "Medium changes - Auto-commit with visual monitoring",
            3: "Major changes - Requires human review (PR)",
        }
        return descriptions.get(tier, "Unknown tier")

    def get_monitoring_requirements(self, tier: int) -> Dict:
        """Get monitoring requirements for a tier"""
        requirements = {
            1: {
                "regression_tests": True,
                "visual_monitoring": False,
                "performance_check": False,
                "human_review": False,
            },
            2: {
                "regression_tests": True,
                "visual_monitoring": True,
                "performance_check": True,
                "human_review": False,
            },
            3: {
                "regression_tests": True,
                "visual_monitoring": True,
                "performance_check": True,
                "human_review": True,
            },
        }
        return requirements.get(tier, requirements[1])

    def get_classification_history(self) -> Dict[str, int]:
        """Get all classifications made"""
        return self._classification_history.copy()

    def get_tier_stats(self) -> Dict[int, int]:
        """Get statistics on tier classifications"""
        stats = {1: 0, 2: 0, 3: 0}
        for tier in self._classification_history.values():
            stats[tier] = stats.get(tier, 0) + 1
        return stats
