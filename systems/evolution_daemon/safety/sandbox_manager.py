"""
Evolution Daemon V11 - Sandbox Manager

Provides isolated sandbox environments for testing proposed code changes
before they are allowed into the main codebase.

The sandbox:
1. Creates isolated copies of affected files
2. Applies proposed diffs
3. Validates syntax and imports
4. Runs heartbeat tests (smoke tests for critical functionality)
5. Cleans up after validation
"""

import ast
import asyncio
import importlib.util
import logging
import os
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Any

from .data_structures import ASCIIFrame, EvolutionProposal, SandboxResult

logger = logging.getLogger("evolution_daemon.sandbox")


class SandboxManager:
    """
    Manages isolated sandbox environments for code validation.

    Each sandbox is a temporary directory where proposed changes can be
    safely tested without affecting the main codebase.
    """

    SANDBOX_DIR = "/tmp/evolution_sandbox"
    SANDBOX_TIMEOUT = 30  # seconds

    def __init__(self, sandbox_base: str | None = None):
        self.sandbox_base = Path(sandbox_base or self.SANDBOX_DIR)
        self.sandbox_base.mkdir(parents=True, exist_ok=True)
        self._active_sandboxes: list[str] = []

    async def create_sandbox(self, proposal: EvolutionProposal) -> str:
        """
        Create an isolated sandbox directory for testing a proposal.

        Args:
            proposal: The evolution proposal to test

        Returns:
            Path to the sandbox directory
        """
        sandbox_path = self.sandbox_base / f"sandbox_{proposal.proposal_id}"
        sandbox_path.mkdir(parents=True, exist_ok=True)

        # Copy relevant files to sandbox
        for target_file in proposal.target_files:
            src = Path(target_file)
            if src.exists():
                dst = sandbox_path / target_file
                dst.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(src, dst)
                logger.info(f"📁 Copied {target_file} to sandbox")

        self._active_sandboxes.append(str(sandbox_path))
        logger.info(f"🏗️ Created sandbox: {sandbox_path}")
        return str(sandbox_path)

    async def apply_diff(self, sandbox_path: str, diff: str) -> bool:
        """
        Apply a unified diff to files in the sandbox.

        Args:
            sandbox_path: Path to sandbox directory
            diff: Unified diff content

        Returns:
            True if diff was applied successfully
        """
        try:
            # Write diff to temp file
            diff_file = Path(sandbox_path) / "changes.patch"
            diff_file.write_text(diff)

            # Apply using patch command
            result = subprocess.run(
                ["patch", "-p1", "--dry-run", "-i", str(diff_file)],
                cwd=sandbox_path,
                capture_output=True,
                text=True,
                timeout=10
            )

            if result.returncode != 0:
                logger.warning(f"Diff dry-run failed: {result.stderr}")
                return False

            # Actually apply the patch
            result = subprocess.run(
                ["patch", "-p1", "-i", str(diff_file)],
                cwd=sandbox_path,
                capture_output=True,
                text=True,
                timeout=10
            )

            if result.returncode == 0:
                logger.info("✅ Applied diff to sandbox")
                return True
            else:
                logger.error(f"Failed to apply diff: {result.stderr}")
                return False

        except subprocess.TimeoutExpired:
            logger.error("Diff application timed out")
            return False
        except Exception as e:
            logger.error(f"Error applying diff: {e}")
            return False

    async def validate_syntax(self, sandbox_path: str) -> tuple[bool, list[str]]:
        """
        Validate Python syntax of all .py files in sandbox.

        Args:
            sandbox_path: Path to sandbox directory

        Returns:
            Tuple of (all_valid, list_of_errors)
        """
        errors = []
        sandbox = Path(sandbox_path)

        for py_file in sandbox.rglob("*.py"):
            try:
                content = py_file.read_text()
                ast.parse(content)
                logger.debug(f"✅ Syntax valid: {py_file.name}")
            except SyntaxError as e:
                error_msg = f"{py_file.name}:{e.lineno}: {e.msg}"
                errors.append(error_msg)
                logger.warning(f"❌ Syntax error: {error_msg}")

        return len(errors) == 0, errors

    async def validate_imports(self, sandbox_path: str) -> tuple[bool, list[str]]:
        """
        Validate that all imports in sandbox files can be resolved.

        Args:
            sandbox_path: Path to sandbox directory

        Returns:
            Tuple of (all_valid, list_of_errors)
        """
        errors = []
        sandbox = Path(sandbox_path)

        # Add sandbox to path temporarily
        original_path = sys.path.copy()
        sys.path.insert(0, str(sandbox))

        try:
            for py_file in sandbox.rglob("*.py"):
                try:
                    content = py_file.read_text()
                    tree = ast.parse(content)

                    for node in ast.walk(tree):
                        if isinstance(node, ast.Import):
                            for alias in node.names:
                                self._check_import(alias.name, str(py_file), errors)
                        elif isinstance(node, ast.ImportFrom):
                            if node.module:
                                self._check_import(node.module, str(py_file), errors)

                except Exception as e:
                    errors.append(f"{py_file.name}: {str(e)}")

        finally:
            sys.path = original_path

        return len(errors) == 0, errors

    def _check_import(self, module_name: str, file_path: str, errors: list[str]):
        """Check if a module can be imported"""
        # Skip relative imports and known external modules
        if module_name.startswith('.'):
            return

        # Skip stdlib and common packages
        known_packages = {
            'asyncio', 'json', 'logging', 'os', 'sys', 'pathlib',
            'typing', 'dataclasses', 'datetime', 'subprocess', 'tempfile',
            'shutil', 'traceback', 'abc', 'collections', 'functools',
            'itertools', 're', 'time', 'uuid', 'enum', 'copy', 'io',
            'contextlib', 'threading', 'queue', 'socket', 'struct',
            'websockets', 'requests', 'aiohttp', 'pytest', 'numpy', 'PIL'
        }

        top_level = module_name.split('.')[0]
        if top_level in known_packages:
            return

        # Try to find the module
        spec = importlib.util.find_spec(module_name)
        if spec is None:
            errors.append(f"{file_path}: Cannot resolve import '{module_name}'")

    async def run_heartbeat_tests(self, sandbox_path: str) -> tuple[int, int]:
        """
        Run heartbeat tests (smoke tests) in the sandbox.

        Heartbeat tests verify critical functionality:
        - Can core modules be imported?
        - Can Z.ai bridge connect?
        - Can WebSocket server start?
        - Do VFS operations work?

        Args:
            sandbox_path: Path to sandbox directory

        Returns:
            Tuple of (passed_count, total_count)
        """
        heartbeat_dir = Path(__file__).parent.parent / "heartbeat_tests"

        if not heartbeat_dir.exists():
            logger.warning("No heartbeat tests directory found")
            return 0, 0

        passed = 0
        total = 0

        # Run each heartbeat test
        for test_file in heartbeat_dir.glob("test_*.py"):
            total += 1
            try:
                result = subprocess.run(
                    [sys.executable, "-m", "pytest", str(test_file), "-v", "-x"],
                    capture_output=True,
                    text=True,
                    timeout=self.SANDBOX_TIMEOUT,
                    cwd=sandbox_path
                )

                if result.returncode == 0:
                    passed += 1
                    logger.info(f"✅ Heartbeat passed: {test_file.name}")
                else:
                    logger.warning(f"❌ Heartbeat failed: {test_file.name}")

            except subprocess.TimeoutExpired:
                logger.error(f"⏱️ Heartbeat timeout: {test_file.name}")
            except Exception as e:
                logger.error(f"❌ Heartbeat error: {test_file.name}: {e}")

        return passed, total

    async def cleanup(self, sandbox_path: str):
        """
        Remove a sandbox directory.

        Args:
            sandbox_path: Path to sandbox to remove
        """
        try:
            shutil.rmtree(sandbox_path)
            if sandbox_path in self._active_sandboxes:
                self._active_sandboxes.remove(sandbox_path)
            logger.info(f"🧹 Cleaned up sandbox: {sandbox_path}")
        except Exception as e:
            logger.error(f"Failed to cleanup sandbox: {e}")

    async def validate(self, proposal: EvolutionProposal) -> SandboxResult:
        """
        Run full validation pipeline on a proposal.

        This is the main entry point for sandbox validation:
        1. Create sandbox
        2. Apply diff
        3. Validate syntax
        4. Validate imports
        5. Run heartbeat tests
        6. Cleanup

        Args:
            proposal: The evolution proposal to validate

        Returns:
            SandboxResult with validation outcome
        """
        import time
        start_time = time.time()

        sandbox_path = None
        errors = []
        warnings = []

        try:
            # 1. Create sandbox
            sandbox_path = await self.create_sandbox(proposal)

            # 2. Apply diff (if provided)
            if proposal.diff_content:
                diff_applied = await self.apply_diff(sandbox_path, proposal.diff_content)
                if not diff_applied:
                    errors.append("Failed to apply diff to sandbox")
                    return SandboxResult(
                        passed=False,
                        proposal_id=proposal.proposal_id,
                        syntax_valid=False,
                        errors=errors,
                        sandbox_path=sandbox_path
                    )

            # 3. Validate syntax
            syntax_ok, syntax_errors = await self.validate_syntax(sandbox_path)
            if not syntax_ok:
                errors.extend(syntax_errors)

            # 4. Validate imports
            imports_ok, import_errors = await self.validate_imports(sandbox_path)
            if not imports_ok:
                warnings.extend(import_errors)

            # 5. Run heartbeat tests
            hb_passed, hb_total = await self.run_heartbeat_tests(sandbox_path)

            # Determine overall pass/fail
            passed = syntax_ok and (hb_total == 0 or hb_passed == hb_total)

            duration_ms = int((time.time() - start_time) * 1000)

            return SandboxResult(
                passed=passed,
                proposal_id=proposal.proposal_id,
                syntax_valid=syntax_ok,
                imports_valid=imports_ok,
                heartbeat_tests_passed=hb_passed,
                heartbeat_tests_total=hb_total,
                errors=errors,
                warnings=warnings,
                sandbox_path=sandbox_path,
                duration_ms=duration_ms
            )

        except Exception as e:
            logger.error(f"Sandbox validation failed: {e}")
            errors.append(str(e))
            return SandboxResult(
                passed=False,
                proposal_id=proposal.proposal_id,
                errors=errors,
                sandbox_path=sandbox_path
            )

        finally:
            # Always cleanup
            if sandbox_path:
                await self.cleanup(sandbox_path)

    async def run_dream_frame(self, sandbox_path: str, dream_scene_path: Path) -> ASCIIFrame | None:
        """
        Run the code in the sandbox in 'Dream Mode'.

        This wires the ASCII renderers to write to the dream scene path
        instead of the real scene path.
        """
        import time

        from .data_structures import ASCIIFrame

        logger.info(f"🔮 Executing Dream Frame in sandbox: {sandbox_path}")

        # 1. Prepare environment for Dream Mode
        env = os.environ.copy()
        env["GEOMETRY_DREAM_MODE"] = "1"
        env["GEOMETRY_ASCII_SCENE_DIR"] = str(dream_scene_path)

        # Ensure dream scene dir exists and is clear for this frame
        dream_scene_path.mkdir(parents=True, exist_ok=True)

        # 2. Execute a heartbeat test or a specific simulation script
        # We'll use the first heartbeat test as a proxy for 'system execution'
        heartbeat_dir = Path(__file__).parent.parent / "heartbeat_tests"
        test_files = list(heartbeat_dir.glob("test_*.py"))

        if not test_files:
            logger.warning("No heartbeat tests to run for dream frame")
            return None

        test_file = test_files[0]

        try:
            # Run the test with dream environment
            process = await asyncio.create_subprocess_exec(
                sys.executable, "-m", "pytest", str(test_file),
                env=env,
                cwd=sandbox_path,
                stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.PIPE
            )

            stdout, stderr = await process.communicate()

            # 3. Capture the resulting ASCII fragments
            fragments_file = dream_scene_path / "shell_fragments.ascii"
            if fragments_file.exists():
                content = fragments_file.read_text()
                windows = self._parse_fragments_content(content)

                logger.info(f"📸 Captured {len(windows)} dream windows from {fragments_file}")
                return ASCIIFrame(
                    timestamp=time.time(),
                    window_count=len(windows),
                    windows=windows
                )
            else:
                logger.warning(f"No shell_fragments.ascii produced at {fragments_file}")
                # Log stderr for debugging
                if stderr:
                    logger.debug(f"Dream frame stderr: {stderr.decode()}")
                return None

        except Exception as e:
            logger.error(f"Error running dream frame: {e}")
            return None

    def _parse_fragments_content(self, content: str) -> list[dict[str, Any]]:
        """Parses shell_fragments.ascii content into window objects."""
        windows = []
        current_window = {}
        for line in content.split("\n"):
            line = line.strip()
            if line.startswith("- id:"):
                if current_window:
                    windows.append(current_window)
                current_window = {"id": line.split(":", 1)[1].strip()}
            elif line.startswith("x:"):
                try:
                    current_window["x"] = int(line.split(":", 1)[1].strip())
                except (ValueError, IndexError): pass
            elif line.startswith("y:"):
                try:
                    current_window["y"] = int(line.split(":", 1)[1].strip())
                except (ValueError, IndexError): pass
            elif line.startswith("width:"):
                try:
                    current_window["width"] = int(line.split(":", 1)[1].strip())
                except (ValueError, IndexError): pass
            elif line.startswith("height:"):
                try:
                    current_window["height"] = int(line.split(":", 1)[1].strip())
                except (ValueError, IndexError): pass

        if current_window:
            windows.append(current_window)
        return windows
