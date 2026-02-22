"""
WordPress Evolution Bridge Service.

Main service that coordinates:
- EvolutionAgent: Runs evolution cycles on WordPress content
- PlaywrightActionExecutor: Executes approved proposals
- WordPressMemoryProvider: Syncs posts to Memory Beams (optional)

This is the primary entry point for the WordPress Evolution integration.
"""

import argparse
import asyncio
import logging
import time
from dataclasses import dataclass, field
from typing import Optional, List, Dict, Any

from .content_analyzer import ImprovementProposal
from .evolution_agent import WordPressEvolutionAgent, EvolutionCycleResult
from .action_executor import PlaywrightActionExecutor, ExecutionResult
from .safety_config import SafetyConfig, ContentBackup, validate_proposal_safety

logger = logging.getLogger("wp_evolution_bridge")


@dataclass
class BridgeServiceConfig:
    """Configuration for the WordPress Evolution Bridge Service."""
    wp_url: str = "http://localhost:8080"
    ws_uri: str = "ws://localhost:8768"
    cycle_interval: int = 60  # seconds between cycles
    auto_execute: bool = False  # Safety: require manual approval by default
    min_confidence: float = 0.5  # Minimum confidence to consider a proposal
    safety_config: Optional[SafetyConfig] = None


@dataclass
class ServiceStats:
    """Statistics for the bridge service."""
    cycles_completed: int = 0
    proposals_generated: int = 0
    proposals_executed: int = 0
    errors: int = 0
    running: bool = False
    uptime_seconds: float = 0.0
    last_cycle_time: Optional[float] = None


class WPEvolutionBridgeService:
    """
    Bridge service coordinating WordPress Evolution.

    This service:
    1. Runs evolution cycles periodically
    2. Filters proposals by confidence
    3. Optionally executes approved proposals via Playwright
    4. Optionally syncs to Memory Beams
    """

    def __init__(
        self,
        config: BridgeServiceConfig,
        agent: Optional[WordPressEvolutionAgent] = None,
        executor: Optional[PlaywrightActionExecutor] = None,
        memory_provider: Optional[Any] = None
    ):
        self.config = config
        self._agent = agent or WordPressEvolutionAgent(wp_url=config.wp_url)
        self._executor = executor or PlaywrightActionExecutor(ws_uri=config.ws_uri)
        self._memory_provider = memory_provider

        # Create ContentBackup instance if safety config requires backups
        self._safety_config = config.safety_config or SafetyConfig()
        self._backup_manager: Optional[ContentBackup] = None
        if self._safety_config.require_backup:
            self._backup_manager = ContentBackup(self._safety_config)
            logger.info("ContentBackup manager initialized for safe modifications")

        self._running = False
        self._task: Optional[asyncio.Task] = None
        self._start_time: Optional[float] = None

        # Stats tracking
        self._cycles_completed = 0
        self._proposals_generated = 0
        self._proposals_executed = 0
        self._errors = 0
        self._last_cycle_time: Optional[float] = None

    async def start(self) -> bool:
        """Start the bridge service loop."""
        if self._running:
            logger.warning("Service already running")
            return False

        # Connect to Playwright bridge
        if not await self._executor.connect():
            logger.error("Failed to connect to Playwright bridge")
            return False

        self._running = True
        self._start_time = time.time()
        self._task = asyncio.create_task(self._service_loop())

        logger.info(
            f"WordPress Evolution Bridge started "
            f"(interval={self.config.cycle_interval}s, "
            f"auto_execute={self.config.auto_execute})"
        )
        return True

    async def stop(self):
        """Stop the bridge service."""
        if not self._running:
            return

        self._running = False

        if self._task:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass
            self._task = None

        await self._executor.disconnect()
        logger.info("WordPress Evolution Bridge stopped")

    async def _service_loop(self):
        """Main service loop running evolution cycles."""
        while self._running:
            try:
                await self.run_single_cycle()
            except Exception as e:
                logger.error(f"Cycle error: {e}")
                self._errors += 1

            # Wait for next cycle
            await asyncio.sleep(self.config.cycle_interval)

    async def run_single_cycle(self) -> Dict[str, Any]:
        """
        Run a single evolution cycle.

        Returns:
            Dict with cycle results including proposals and execution status.
        """
        self._last_cycle_time = time.time()

        # Run evolution cycle via agent
        result: EvolutionCycleResult = await self._agent.run_cycle()

        self._cycles_completed += 1
        self._proposals_generated += result.proposals_generated

        # Filter proposals by confidence
        qualified_proposals = [
            p for p in result.proposals
            if p.confidence >= self.config.min_confidence
        ]

        executed_count = 0
        if self.config.auto_execute and qualified_proposals:
            for proposal in qualified_proposals:
                exec_result = await self._execute_proposal(proposal)
                if exec_result.success:
                    executed_count += 1

        # Trigger memory sync if provider configured
        if self._memory_provider:
            await self._trigger_memory_sync()

        logger.info(
            f"Cycle {result.cycle_number}: "
            f"{result.posts_analyzed} posts, "
            f"{result.proposals_generated} proposals, "
            f"{executed_count} executed"
        )

        return {
            "cycle_number": result.cycle_number,
            "posts_analyzed": result.posts_analyzed,
            "proposals_generated": result.proposals_generated,
            "qualified_proposals": len(qualified_proposals),
            "executed": executed_count,
            "errors": len(result.errors)
        }

    async def _execute_proposal(self, proposal: ImprovementProposal) -> ExecutionResult:
        """Execute a proposal via the ActionExecutor with safety validation."""
        # Convert proposal to dict for safety validation
        proposal_dict = {
            "confidence": proposal.confidence,
            "content": proposal.proposed_content,
            "post_id": proposal.post_id,
            "improvement_type": proposal.improvement_type
        }

        # Validate proposal safety
        is_safe, reason = validate_proposal_safety(proposal_dict, self._safety_config)
        logger.info(
            f"Safety validation for post {proposal.post_id}: "
            f"safe={is_safe}, reason={reason}"
        )

        if not is_safe:
            logger.warning(f"Proposal rejected for post {proposal.post_id}: {reason}")
            return ExecutionResult(
                success=False,
                post_id=proposal.post_id,
                action=proposal.improvement_type,
                error=f"Safety validation failed: {reason}"
            )

        # Create backup before execution if required
        if self._backup_manager:
            try:
                backup_path = self._backup_manager.save(
                    post_id=proposal.post_id,
                    content=proposal.original_content,
                    metadata={
                        "improvement_type": proposal.improvement_type,
                        "confidence": proposal.confidence
                    }
                )
                logger.info(f"Backup created for post {proposal.post_id}: {backup_path}")
            except Exception as e:
                logger.error(f"Failed to create backup for post {proposal.post_id}: {e}")
                return ExecutionResult(
                    success=False,
                    post_id=proposal.post_id,
                    action=proposal.improvement_type,
                    error=f"Backup creation failed: {e}"
                )

        # Execute the proposal
        result = await self._executor.execute_proposal(proposal)

        if result.success:
            self._proposals_executed += 1
            logger.info(f"Executed proposal for post {proposal.post_id}")
        else:
            self._errors += 1
            logger.error(f"Failed to execute proposal: {result.error}")

        return result

    async def _trigger_memory_sync(self):
        """Trigger synchronization to Memory Beams."""
        if not self._memory_provider:
            return

        try:
            # WordPressMemoryProvider.sync_posts is synchronous
            # Run in executor to avoid blocking
            loop = asyncio.get_event_loop()
            await loop.run_in_executor(None, self._memory_provider.sync_posts)
            logger.debug("Memory sync completed")
        except Exception as e:
            logger.error(f"Memory sync failed: {e}")
            self._errors += 1

    def get_stats(self) -> ServiceStats:
        """Return current service statistics."""
        uptime = 0.0
        if self._start_time:
            uptime = time.time() - self._start_time

        return ServiceStats(
            cycles_completed=self._cycles_completed,
            proposals_generated=self._proposals_generated,
            proposals_executed=self._proposals_executed,
            errors=self._errors,
            running=self._running,
            uptime_seconds=uptime,
            last_cycle_time=self._last_cycle_time
        )


def create_cli_parser() -> argparse.ArgumentParser:
    """Create CLI argument parser."""
    parser = argparse.ArgumentParser(
        description="WordPress Evolution Bridge Service",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter
    )

    parser.add_argument(
        "--wp-url",
        default="http://localhost:8080",
        help="WordPress base URL"
    )
    parser.add_argument(
        "--ws-uri",
        default="ws://localhost:8768",
        help="Playwright bridge WebSocket URI"
    )
    parser.add_argument(
        "--interval",
        type=int,
        default=60,
        help="Cycle interval in seconds"
    )
    parser.add_argument(
        "--auto-execute",
        action="store_true",
        help="Automatically execute approved proposals (WARNING: modifies content)"
    )
    parser.add_argument(
        "--min-confidence",
        type=float,
        default=0.5,
        help="Minimum confidence threshold for proposals"
    )
    parser.add_argument(
        "--single-cycle",
        action="store_true",
        help="Run a single cycle and exit"
    )
    parser.add_argument(
        "--verbose", "-v",
        action="store_true",
        help="Enable verbose logging"
    )

    return parser


async def main_async(args: argparse.Namespace):
    """Async main entry point."""
    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
    )

    config = BridgeServiceConfig(
        wp_url=args.wp_url,
        ws_uri=args.ws_uri,
        cycle_interval=args.interval,
        auto_execute=args.auto_execute,
        min_confidence=args.min_confidence
    )

    service = WPEvolutionBridgeService(config)

    if args.single_cycle:
        # Run one cycle and exit
        result = await service.run_single_cycle()
        print(f"Cycle completed: {result}")
        return

    # Run continuous service
    if not await service.start():
        logger.error("Failed to start service")
        return 1

    try:
        # Keep running until interrupted
        while service._running:
            await asyncio.sleep(1)
    except KeyboardInterrupt:
        logger.info("Shutting down...")
    finally:
        await service.stop()


def main():
    """CLI entry point."""
    parser = create_cli_parser()
    args = parser.parse_args()

    return asyncio.run(main_async(args))


if __name__ == "__main__":
    exit(main() or 0)
