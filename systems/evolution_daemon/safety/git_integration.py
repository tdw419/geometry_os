"""
Evolution Daemon V11 - Git Integration

Provides git operations for atomic commits, branching, and rollback.
Every evolution is tracked in git history with structured commit messages.

Key Features:
- Structured commit messages with metadata
- Automatic rollback capability
- PR branch creation for Tier 3 changes
- Evolution history tracking
"""

import asyncio
import logging
import subprocess
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from .data_structures import EvolutionProposal, GuardianVerdict

logger = logging.getLogger("evolution_daemon.git")


class GitIntegration:
    """
    Git operations for evolution tracking and rollback.

    All evolutions are committed with structured messages that include:
    - [EVOLUTION] tag for easy filtering
    - Tier classification
    - Guardian approval status
    - Risk level
    - Files affected
    - Change summary
    """

    EVOLUTION_TAG = "[EVOLUTION]"
    EVOLUTION_BRANCH_PREFIX = "evolution"

    def __init__(self, repo_path: str = "."):
        """
        Initialize Git integration.

        Args:
            repo_path: Path to the git repository root
        """
        self.repo_path = Path(repo_path).resolve()
        self._verify_git_repo()

    def _verify_git_repo(self):
        """Verify we're in a git repository"""
        git_dir = self.repo_path / ".git"
        if not git_dir.exists():
            raise RuntimeError(f"Not a git repository: {self.repo_path}")

    def _run_git(self, *args: str, check: bool = True) -> Tuple[bool, str]:
        """
        Run a git command.

        Args:
            *args: Git command arguments
            check: Raise exception on failure

        Returns:
            Tuple of (success, output)
        """
        try:
            result = subprocess.run(
                ["git"] + list(args),
                cwd=str(self.repo_path),
                capture_output=True,
                text=True,
                timeout=30
            )

            if check and result.returncode != 0:
                logger.error(f"Git command failed: git {' '.join(args)}")
                logger.error(f"stderr: {result.stderr}")
                return False, result.stderr

            return result.returncode == 0, result.stdout.strip()

        except subprocess.TimeoutExpired:
            logger.error("Git command timed out")
            return False, "timeout"
        except Exception as e:
            logger.error(f"Git command error: {e}")
            return False, str(e)

    async def commit_evolution(
        self,
        proposal: EvolutionProposal,
        verdict: GuardianVerdict,
        tier: int
    ) -> str:
        """
        Create a structured commit for an evolution.

        Args:
            proposal: The evolution proposal
            verdict: Guardian's review verdict
            tier: Tier classification (1, 2, or 3)

        Returns:
            Commit SHA
        """
        logger.info(f"📝 Creating evolution commit for: {proposal.proposal_id}")

        # Stage files
        for target_file in proposal.target_files:
            success, output = self._run_git("add", target_file, check=False)
            if not success:
                logger.warning(f"Could not stage {target_file}: {output}")

        # Build commit message
        commit_message = self._build_commit_message(proposal, verdict, tier)

        # Commit
        success, output = self._run_git(
            "commit", "-m", commit_message,
            "--no-verify",  # Skip pre-commit hooks for speed
            check=False
        )

        if not success:
            logger.error(f"Commit failed: {output}")
            raise RuntimeError(f"Failed to commit evolution: {output}")

        # Get commit SHA
        success, sha = self._run_git("rev-parse", "HEAD", check=False)
        if success:
            logger.info(f"✅ Created commit: {sha[:8]}")
            return sha
        else:
            raise RuntimeError("Could not get commit SHA")

    def _build_commit_message(
        self,
        proposal: EvolutionProposal,
        verdict: GuardianVerdict,
        tier: int
    ) -> str:
        """Build structured commit message"""
        lines = [
            f"{self.EVOLUTION_TAG} {proposal.goal}",
            "",
            f"Tier: {tier}",
            f"Guardian: {'approved' if verdict.approved else 'rejected'}",
            f"Risk: {verdict.risk_level}",
            f"Files: {', '.join(proposal.target_files)}",
            "",
            "Changes:",
        ]

        # Add diff summary lines
        diff_lines = proposal.diff_content.split('\n')
        change_lines = [
            f"- {line}" for line in diff_lines
            if line.startswith(('+', '-')) and not line.startswith(('+++', '---'))
        ][:10]  # Limit to 10 lines

        lines.extend(change_lines)

        if len(diff_lines) > 10:
            lines.append(f"- ... ({len(diff_lines) - 10} more lines)")

        lines.extend([
            "",
            f"Co-Authored-By: Evolution Daemon <daemon@geometry-os>"
        ])

        return '\n'.join(lines)

    async def create_pr_branch(
        self,
        proposal: EvolutionProposal,
        base_commit: Optional[str] = None
    ) -> str:
        """
        Create a PR branch for Tier 3 changes requiring human review.

        Args:
            proposal: The evolution proposal
            base_commit: Optional base commit SHA

        Returns:
            Branch name
        """
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        branch_name = f"{self.EVOLUTION_BRANCH_PREFIX}/{proposal.proposal_id}_{timestamp}"

        logger.info(f"🌿 Creating PR branch: {branch_name}")

        # Create branch
        if base_commit:
            success, output = self._run_git(
                "checkout", "-b", branch_name, base_commit,
                check=False
            )
        else:
            success, output = self._run_git(
                "checkout", "-b", branch_name,
                check=False
            )

        if not success:
            logger.error(f"Failed to create branch: {output}")
            raise RuntimeError(f"Failed to create PR branch: {output}")

        logger.info(f"✅ Created branch: {branch_name}")
        return branch_name

    async def rollback(self, commit_sha: str) -> bool:
        """
        Rollback to a previous commit.

        Args:
            commit_sha: SHA of commit to rollback to

        Returns:
            True if rollback succeeded
        """
        logger.warning(f"🔄 Rolling back to commit: {commit_sha[:8]}")

        # Create revert commit
        success, output = self._run_git(
            "revert", "--no-commit", commit_sha,
            check=False
        )

        if not success:
            # Try hard reset if revert fails
            logger.warning("Revert failed, trying reset...")
            success, output = self._run_git(
                "reset", "--hard", f"{commit_sha}^",
                check=False
            )

            if success:
                logger.info(f"✅ Reset to before {commit_sha[:8]}")
                return True
            else:
                logger.error(f"Rollback failed: {output}")
                return False

        # Commit the revert
        revert_message = f"{self.EVOLUTION_TAG} Rollback {commit_sha[:8]}\n\nAutomatic rollback due to detected regression."
        success, output = self._run_git(
            "commit", "-m", revert_message,
            check=False
        )

        if success:
            logger.info(f"✅ Rolled back commit: {commit_sha[:8]}")
            return True
        else:
            logger.error(f"Failed to commit rollback: {output}")
            return False

    async def get_evolution_history(self, limit: int = 20) -> List[Dict]:
        """
        Get history of evolution commits.

        Args:
            limit: Maximum number of commits to return

        Returns:
            List of commit info dicts
        """
        success, output = self._run_git(
            "log", f"--grep={self.EVOLUTION_TAG}",
            f"-{limit}", "--oneline", "--format=%H|%s|%ci",
            check=False
        )

        if not success:
            return []

        commits = []
        for line in output.strip().split('\n'):
            if '|' in line:
                parts = line.split('|', 2)
                if len(parts) >= 3:
                    commits.append({
                        "sha": parts[0],
                        "subject": parts[1],
                        "date": parts[2],
                    })

        return commits

    async def get_current_sha(self) -> str:
        """Get current HEAD commit SHA"""
        success, sha = self._run_git("rev-parse", "HEAD", check=False)
        if success:
            return sha
        return ""

    async def get_current_branch(self) -> str:
        """Get current branch name"""
        success, branch = self._run_git("branch", "--show-current", check=False)
        if success:
            return branch
        return "unknown"

    async def has_uncommitted_changes(self) -> bool:
        """Check if there are uncommitted changes"""
        success, output = self._run_git("status", "--porcelain", check=False)
        if success:
            return len(output.strip()) > 0
        return False

    async def stash_changes(self) -> bool:
        """Stash current changes"""
        success, output = self._run_git("stash", check=False)
        return success

    async def unstash_changes(self) -> bool:
        """Unstash previously stashed changes"""
        success, output = self._run_git("stash", "pop", check=False)
        return success

    async def diff_stats(self, commit_sha: str) -> Dict:
        """Get diff statistics for a commit"""
        success, output = self._run_git(
            "show", "--stat", "--format=", commit_sha,
            check=False
        )

        if not success:
            return {}

        # Parse output for file changes
        stats = {"files_changed": 0, "insertions": 0, "deletions": 0}

        for line in output.strip().split('\n'):
            if 'changed' in line and 'insertion' in line:
                # Parse summary line like: "3 files changed, 10 insertions(+), 5 deletions(-)"
                parts = line.split(',')
                for part in parts:
                    part = part.strip()
                    if 'file' in part:
                        stats['files_changed'] = int(part.split()[0])
                    elif 'insertion' in part:
                        stats['insertions'] = int(part.split()[0])
                    elif 'deletion' in part:
                        stats['deletions'] = int(part.split()[0])

        return stats
