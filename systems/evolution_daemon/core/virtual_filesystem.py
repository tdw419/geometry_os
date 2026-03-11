"""
Evolution Daemon - Virtual File System

Real file system operations for self-modification.

This module provides a safe abstraction layer for file operations
that the Evolution Daemon uses to modify the codebase.
"""

import logging
import subprocess
import sys
from pathlib import Path
from typing import Any

logger = logging.getLogger("evolution_daemon.vfs")


class VirtualFileSystem:
    """
    Real file system operations for self-modification.

    Provides a safe abstraction layer for:
    - Reading files from the codebase
    - Writing files with automatic backups
    - Listing files by pattern
    - Running tests
    """

    def __init__(self, root_path: str = "."):
        self.root = Path(root_path).resolve()

    async def read_file(self, path: str) -> str:
        """Read a file from the codebase"""
        full_path = self.root / path
        if not full_path.exists():
            raise FileNotFoundError(f"File not found: {path}")
        return full_path.read_text()

    async def write_file(self, path: str, content: str) -> bool:
        """Write a file to the codebase (SELF-MODIFICATION)"""
        full_path = self.root / path
        full_path.parent.mkdir(parents=True, exist_ok=True)

        # Backup original
        if full_path.exists():
            backup = full_path.with_suffix(full_path.suffix + ".bak")
            backup.write_text(full_path.read_text())
            logger.info(f"📋 Backed up: {path} -> {backup.name}")

        full_path.write_text(content)
        logger.info(f"✍️ Wrote: {path} ({len(content)} bytes)")
        return True

    async def list_files(self, pattern: str = "*.py") -> list[str]:
        """List files matching pattern"""
        return [str(p.relative_to(self.root)) for p in self.root.rglob(pattern)]

    async def run_tests(self, test_path: str = "tests/") -> dict[str, Any]:
        """Run tests and return results"""
        try:
            result = subprocess.run(
                [sys.executable, "-m", "pytest", test_path, "-v", "--tb=short"],
                capture_output=True,
                text=True,
                timeout=60,
                cwd=str(self.root)
            )
            return {
                "success": result.returncode == 0,
                "returncode": result.returncode,
                "output": result.stdout + result.stderr
            }
        except subprocess.TimeoutExpired:
            return {"success": False, "error": "Test timeout"}
        except Exception as e:
            return {"success": False, "error": str(e)}

    def file_exists(self, path: str) -> bool:
        """Check if a file exists"""
        return (self.root / path).exists()

    def get_full_path(self, path: str) -> Path:
        """Get the full path for a relative path"""
        return self.root / path
