#!/usr/bin/env python3
"""
Distributed Catalog Scanner Swarm
==================================

Production-grade multi-agent system for distributed catalog scanning.
Uses A2A coordination primitives for sector claiming and result aggregation.

Architecture:
- ScannerAgent: Claims map sectors, scans for .rts.png files
- ProcessorAgent: Validates and extracts metadata from findings
- CoordinatorAgent: Aggregates results, manages global catalog

Protocol: A2A (Agent-to-Agent) via WebSocket
Coordination: Distributed locks for sector claiming
"""

import asyncio
import json
import os
import sys
import logging
from pathlib import Path
from dataclasses import dataclass, field, asdict
from typing import List, Dict, Optional, Set, Any
from datetime import datetime
import websockets

# Add project root to path
PROJECT_ROOT = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

from systems.pixel_compiler.catalog.catalog_scanner import CatalogScanner, CatalogEntry

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(name)s] %(message)s')
logger = logging.getLogger(__name__)


@dataclass
class Sector:
    """Represents a sector of the search space."""
    id: str
    path: str
    status: str = "unclaimed"  # unclaimed, claimed, scanned, failed
    claimed_by: Optional[str] = None
    file_count: int = 0
    entries: List[Dict] = field(default_factory=list)


@dataclass
class SwarmMetrics:
    """Swarm performance metrics."""
    sectors_scanned: int = 0
    files_found: int = 0
    errors: int = 0
    start_time: Optional[str] = None
    end_time: Optional[str] = None


class CatalogScannerAgent:
    """
    Production scanner agent that claims sectors and scans for .rts.png files.
    Uses A2A locks for coordination.
    """

    def __init__(
        self,
        agent_id: str,
        a2a_url: str = "ws://localhost:8766/a2a",
        scan_paths: Optional[List[str]] = None
    ):
        self.agent_id = agent_id
        self.agent_type = "scanner"
        self.a2a_url = a2a_url
        self.ws = None
        self.running = False

        # Sector management
        self.sectors: Dict[str, Sector] = {}
        self.claimed_sectors: Set[str] = set()

        # Scanner
        scan_paths = scan_paths or ["."]
        self.scanner = CatalogScanner(watch_paths=scan_paths, use_vision=False)

        # Metrics
        self.metrics = SwarmMetrics()

    async def connect(self):
        """Connect to A2A router."""
        logger.info(f"[{self.agent_id}] Connecting to A2A router at {self.a2a_url}")

        self.ws = await websockets.connect(self.a2a_url, subprotocols=["a2a"])

        # Register with A2A
        await self.ws.send(json.dumps({
            "type": "register",
            "agent_id": self.agent_id,
            "agent_type": self.agent_type
        }))

        response = await self.ws.recv()
        msg = json.loads(response)

        if msg.get("type") == "ack":
            logger.info(f"[{self.agent_id}] Registered with A2A router")
            return True
        else:
            logger.error(f"[{self.agent_id}] Registration failed: {msg}")
            return False

    async def claim_sector(self, sector_id: str) -> bool:
        """Claim a sector for scanning using A2A lock."""
        await self.ws.send(json.dumps({
            "type": "lock_request",
            "lock_id": f"sector:{sector_id}",
            "agent_id": self.agent_id,
            "timeout": 30
        }))

        # Router sends lock_granted asynchronously, but we also get an 'ack' for the request
        response = await self.ws.recv()
        msg = json.loads(response)

        if msg.get("type") == "ack" and msg.get("granted"):
            self.claimed_sectors.add(sector_id)
            logger.info(f"[{self.agent_id}] Claimed sector: {sector_id}")
            return True
        
        # If not granted immediately, it might be granted later (lock_granted), 
        # but for this simple swarm we just skip if not immediate.
        return False

    async def release_sector(self, sector_id: str):
        """Release a claimed sector."""
        await self.ws.send(json.dumps({
            "type": "lock_release",
            "lock_id": f"sector:{sector_id}",
            "agent_id": self.agent_id
        }))

        self.claimed_sectors.discard(sector_id)
        logger.info(f"[{self.agent_id}] Released sector: {sector_id}")

    def create_sectors(self, paths: List[str]) -> List[Sector]:
        """Divide paths into sectors for distributed scanning."""
        sectors = []
        for i, path in enumerate(paths):
            sector_id = f"sector-{i:04d}"
            sectors.append(Sector(
                id=sector_id,
                path=str(Path(path).resolve())
            ))
            self.sectors[sector_id] = sectors[-1]
        return sectors

    async def scan_sector(self, sector: Sector) -> List[CatalogEntry]:
        """Scan a single sector for .rts.png files."""
        logger.info(f"[{self.agent_id}] Scanning sector: {sector.path}")

        sector.status = "scanning"
        entries = []

        try:
            # Scan the sector path
            original_paths = self.scanner.watch_paths
            self.scanner.watch_paths = [Path(sector.path)]
            entries = self.scanner.scan()
            self.scanner.watch_paths = original_paths

            sector.file_count = len(entries)
            sector.entries = [asdict(e) for e in entries]
            sector.status = "scanned"

            logger.info(f"[{self.agent_id}] Found {len(entries)} files in {sector.path}")
            self.metrics.files_found += len(entries)

        except Exception as e:
            logger.error(f"[{self.agent_id}] Error scanning {sector.path}: {e}")
            sector.status = "failed"
            self.metrics.errors += 1

        return entries

    async def broadcast_findings(self, sector: Sector):
        """Broadcast scan results to coordinator."""
        await self.ws.send(json.dumps({
            "type": "broadcast",
            "from_agent": self.agent_id,
            "message_type": "sector_scanned",
            "payload": {
                "sector_id": sector.id,
                "path": sector.path,
                "file_count": sector.file_count,
                "entries": sector.entries,
                "timestamp": datetime.now().isoformat()
            }
        }))

    async def run(self, scan_paths: List[str]):
        """Main agent loop."""
        logger.info(f"[{self.agent_id}] Starting distributed catalog scan")
        self.metrics.start_time = datetime.now().isoformat()

        if not await self.connect():
            return

        self.running = True
        sectors = self.create_sectors(scan_paths)

        logger.info(f"[{self.agent_id}] Created {len(sectors)} sectors to scan")

        for sector in sectors:
            if not self.running:
                break

            # Try to claim the sector
            if await self.claim_sector(sector.id):
                try:
                    # Scan it
                    await self.scan_sector(sector)
                    self.metrics.sectors_scanned += 1

                    # Broadcast results
                    await self.broadcast_findings(sector)

                finally:
                    # Release the sector
                    await self.release_sector(sector.id)
            else:
                logger.info(f"[{self.agent_id}] Sector {sector.id} already claimed, skipping")

        self.metrics.end_time = datetime.now().isoformat()
        logger.info(f"[{self.agent_id}] Scan complete: {self.metrics.sectors_scanned} sectors, {self.metrics.files_found} files")

        await self.ws.close()

    def stop(self):
        """Stop the agent."""
        self.running = False


async def run_swarm(num_agents: int = 3, scan_paths: Optional[List[str]] = None):
    """
    Run a swarm of catalog scanner agents.

    Args:
        num_agents: Number of scanner agents to spawn
        scan_paths: Directories to scan (defaults to project root)
    """
    if scan_paths is None:
        # Default: scan the project root
        scan_paths = [str(PROJECT_ROOT)]

    # Expand paths to subdirectories for better distribution
    expanded_paths = []
    for path in scan_paths:
        p = Path(path)
        if p.is_dir():
            for child in p.iterdir():
                if child.is_dir() and not child.name.startswith('.'):
                    expanded_paths.append(str(child))

    if not expanded_paths:
        expanded_paths = scan_paths

    logger.info(f"Starting swarm with {num_agents} agents to scan {len(expanded_paths)} paths")

    # Create agents
    agents = [
        CatalogScannerAgent(
            agent_id=f"scanner-{i:02d}",
            a2a_url="ws://localhost:8766/a2a",
            scan_paths=scan_paths
        )
        for i in range(num_agents)
    ]

    # Run all agents concurrently
    tasks = [agent.run(expanded_paths) for agent in agents]
    await asyncio.gather(*tasks, return_exceptions=True)

    # Aggregate metrics
    total_scanned = sum(a.metrics.sectors_scanned for a in agents)
    total_files = sum(a.metrics.files_found for a in agents)
    total_errors = sum(a.metrics.errors for a in agents)

    print("\n" + "="*50)
    print("  SWARM SCAN COMPLETE")
    print("="*50)
    print(f"  Agents:          {num_agents}")
    print(f"  Sectors Scanned: {total_scanned}")
    print(f"  Files Found:     {total_files}")
    print(f"  Errors:          {total_errors}")
    print("="*50 + "\n")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Distributed Catalog Scanner Swarm")
    parser.add_argument("--agents", type=int, default=3, help="Number of scanner agents")
    parser.add_argument("--paths", nargs="+", help="Directories to scan")
    parser.add_argument("--dry-run", action="store_true", help="Show what would be scanned")

    args = parser.parse_args()

    if args.dry_run:
        paths = args.paths or [str(PROJECT_ROOT)]
        print(f"Would scan with {args.agents} agents:")
        for p in paths:
            print(f"  - {p}")
    else:
        asyncio.run(run_swarm(num_agents=args.agents, scan_paths=args.paths))
