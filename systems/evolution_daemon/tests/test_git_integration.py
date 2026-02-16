"""Unit tests for GitIntegration"""

import pytest
import tempfile
import subprocess
from pathlib import Path

from systems.evolution_daemon.safety import (
    GitIntegration, EvolutionProposal, GuardianVerdict
)


@pytest.fixture
def temp_git_repo():
    """Create a temporary git repository for testing"""
    with tempfile.TemporaryDirectory() as tmpdir:
        # Initialize git repo
        subprocess.run(["git", "init"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.email", "test@test.com"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "config", "user.name", "Test User"], cwd=tmpdir, check=True, capture_output=True)

        # Create initial commit
        test_file = Path(tmpdir) / "test.py"
        test_file.write_text("# Initial content\n")
        subprocess.run(["git", "add", "test.py"], cwd=tmpdir, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Initial commit"], cwd=tmpdir, check=True, capture_output=True)

        yield tmpdir


@pytest.fixture
def git_integration(temp_git_repo):
    """Create a GitIntegration instance with temp repo"""
    return GitIntegration(repo_path=temp_git_repo)


@pytest.fixture
def sample_proposal():
    """Create a sample evolution proposal"""
    return EvolutionProposal(
        proposal_id="test-001",
        goal="Fix a bug",
        target_files=["test.py"],
        diff_content="+ # Fixed\n",
        lines_changed=1
    )


@pytest.fixture
def sample_verdict():
    """Create a sample guardian verdict"""
    return GuardianVerdict(
        approved=True,
        proposal_id="test-001",
        risk_level="low"
    )


class TestGitIntegration:
    """Tests for GitIntegration class"""

    def test_initialization(self, git_integration):
        """Test that GitIntegration initializes correctly"""
        assert git_integration.repo_path is not None
        assert git_integration.EVOLUTION_TAG == "[EVOLUTION]"

    @pytest.mark.asyncio
    async def test_get_current_sha(self, git_integration):
        """Test getting current commit SHA"""
        sha = await git_integration.get_current_sha()
        assert sha is not None
        assert len(sha) == 40  # Full SHA

    @pytest.mark.asyncio
    async def test_get_current_branch(self, git_integration):
        """Test getting current branch name"""
        branch = await git_integration.get_current_branch()
        assert branch in ["master", "main"]

    @pytest.mark.asyncio
    async def test_has_uncommitted_changes_false(self, git_integration):
        """Test checking for uncommitted changes when clean"""
        has_changes = await git_integration.has_uncommitted_changes()
        assert has_changes is False

    @pytest.mark.asyncio
    async def test_has_uncommitted_changes_true(self, git_integration, temp_git_repo):
        """Test checking for uncommitted changes when dirty"""
        # Modify a file
        test_file = Path(temp_git_repo) / "test.py"
        test_file.write_text("# Modified\n")

        has_changes = await git_integration.has_uncommitted_changes()
        assert has_changes is True

    @pytest.mark.asyncio
    async def test_commit_evolution(self, git_integration, sample_proposal, sample_verdict, temp_git_repo):
        """Test creating an evolution commit"""
        # Modify the file first
        test_file = Path(temp_git_repo) / "test.py"
        test_file.write_text("# Initial content\n# Fixed\n")

        sha = await git_integration.commit_evolution(sample_proposal, sample_verdict, tier=1)

        assert sha is not None
        assert len(sha) == 40

    @pytest.mark.asyncio
    async def test_create_pr_branch(self, git_integration, sample_proposal):
        """Test creating a PR branch"""
        branch_name = await git_integration.create_pr_branch(sample_proposal)

        assert branch_name is not None
        assert "evolution" in branch_name
        assert "test-001" in branch_name

    @pytest.mark.asyncio
    async def test_get_evolution_history(self, git_integration, sample_proposal, sample_verdict, temp_git_repo):
        """Test getting evolution commit history"""
        # Create an evolution commit
        test_file = Path(temp_git_repo) / "test.py"
        test_file.write_text("# Initial content\n# Fixed\n")
        await git_integration.commit_evolution(sample_proposal, sample_verdict, tier=1)

        history = await git_integration.get_evolution_history(limit=10)

        assert len(history) >= 1
        assert "[EVOLUTION]" in history[0]["subject"]

    def test_build_commit_message(self, git_integration, sample_proposal, sample_verdict):
        """Test commit message formatting"""
        message = git_integration._build_commit_message(sample_proposal, sample_verdict, tier=1)

        assert "[EVOLUTION]" in message
        assert "Fix a bug" in message
        assert "Tier: 1" in message
        assert "Guardian: approved" in message
        assert "Risk: low" in message
        assert "Co-Authored-By: Evolution Daemon" in message


class TestGitRollback:
    """Tests for git rollback functionality"""

    @pytest.mark.asyncio
    async def test_rollback_creates_revert(self, git_integration, sample_proposal, sample_verdict, temp_git_repo):
        """Test that rollback creates a revert commit"""
        # Create initial commit
        test_file = Path(temp_git_repo) / "test.py"
        test_file.write_text("# Initial content\n# Fixed\n")
        sha = await git_integration.commit_evolution(sample_proposal, sample_verdict, tier=1)

        # Add another change
        test_file.write_text("# Initial content\n# Fixed\n# More changes\n")
        subprocess.run(["git", "add", "test.py"], cwd=temp_git_repo, check=True, capture_output=True)
        subprocess.run(["git", "commit", "-m", "Another commit"], cwd=temp_git_repo, check=True, capture_output=True)

        # Rollback the evolution commit
        success = await git_integration.rollback(sha)

        assert success is True


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
