"""
Phase 57: Predictive Simulation (The Dreaming Kernel)

The Dream Engine manages the Shadow Substrate, a parallel world where 
mutations are tested for geometric coherence before being committed.
"""

import logging
import shutil
from pathlib import Path

from .data_structures import ASCIIFrame, EvolutionProposal
from .sandbox_manager import SandboxManager

logger = logging.getLogger("evolution_daemon.dream_engine")

class ShadowSubstrate:
    """
    Manages the .geometry/dream_scene/ directory.
    A mirror of the real .geometry/ascii_scene/ but for simulations.
    """

    DREAM_SCENE_DIR = ".geometry/dream_scene"

    def __init__(self, project_root: Path | None = None):
        self.project_root = project_root or Path.cwd()
        self.dream_path = self.project_root / self.DREAM_SCENE_DIR
        self._ensure_substrate()

    def _ensure_substrate(self):
        """Ensure the dream scene directory exists."""
        self.dream_path.mkdir(parents=True, exist_ok=True)
        # Seed it with current real scene if empty
        real_scene = self.project_root / ".geometry/ascii_scene"
        if real_scene.exists() and not any(self.dream_path.iterdir()):
            for item in real_scene.iterdir():
                if item.is_file():
                    try:
                        shutil.copy2(item, self.dream_path / item.name)
                    except Exception as e:
                        logger.warning(f"Failed to copy {item.name} to dream scene: {e}")

    def clear(self):
        """Clear all dream fragments."""
        if not self.dream_path.exists():
            return
        for item in self.dream_path.iterdir():
            if item.is_file():
                try:
                    item.unlink()
                except Exception as e:
                    logger.warning(f"Failed to delete dream fragment {item.name}: {e}")

    def get_fragments_path(self) -> Path:
        """Get the path to shell_fragments.ascii in the dream substrate."""
        return self.dream_path / "shell_fragments.ascii"


class DreamEngine:
    """
    Coordinates with SandboxManager to run a single "Dream Frame" after mutation.
    """

    def __init__(
        self,
        sandbox_manager: SandboxManager,
        project_root: Path | None = None
    ):
        self.sandbox_manager = sandbox_manager
        self.project_root = project_root or Path.cwd()
        self.shadow_substrate = ShadowSubstrate(self.project_root)

    async def simulate_dream(self, proposal: EvolutionProposal) -> tuple[ASCIIFrame | None, float]:
        """
        Run a single 'Dream Frame' simulation for a proposal.
        
        Returns:
            Tuple of (Dream Frame, Preemptive Reflex Score)
        """
        logger.info(f"🌙 Starting Dream Simulation for {proposal.proposal_id}")

        # 1. Create sandbox for simulation
        sandbox_path = await self.sandbox_manager.create_sandbox(proposal)

        try:
            # 2. Apply proposal to sandbox
            if proposal.diff_content:
                success = await self.sandbox_manager.apply_diff(sandbox_path, proposal.diff_content)
                if not success:
                    logger.warning("Failed to apply diff for dream simulation")
                    return None, 1.0 # Maximum penalty for failed diff

            # 3. Run code in 'Dream Mode'
            # This requires updating SandboxManager to support dream mode execution
            dream_frame = await self.sandbox_manager.run_dream_frame(
                sandbox_path,
                self.shadow_substrate.dream_path
            )

            if not dream_frame:
                logger.warning("Dream simulation failed to produce a frame")
                return None, 1.0

            # 4. Predict fracture using Ouroboros Spine logic (via FractureDetector)
            # We assume FractureDetector is available and will be updated
            from .fracture_detector import FractureDetector
            fd = FractureDetector()
            reflex_score = fd.predict_fracture(dream_frame)

            logger.info(f"✨ Dream Simulation complete. Reflex Score: {reflex_score:.2f}")
            return dream_frame, reflex_score

        except Exception as e:
            logger.error(f"Dream simulation error: {e}")
            return None, 1.0
        finally:
            # Always cleanup sandbox
            await self.sandbox_manager.cleanup(sandbox_path)
