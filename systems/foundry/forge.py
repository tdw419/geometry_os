"""
Core Foundry System

Provides the primary interface for PixelBrain to inspect, modify, and forge
new logic into its own substrate.
"""

from enum import Enum
from dataclasses import dataclass, field
from typing import Optional, Dict, List, Any
from pathlib import Path
import hashlib
import json
import time
import shutil
import logging

logger = logging.getLogger(__name__)


class ForgeTarget(Enum):
    """Target types that can be forged."""
    SHADER = "shader"       # WGSL shader code
    GEOASM = "geoasm"       # GeoASM programs
    STRATEGY = "strategy"   # Tectonic strategies
    VISUAL = "visual"       # Visual components


@dataclass
class ForgeOperation:
    """
    A single forge operation representing a modification.

    Attributes:
        target: Type of target being modified
        path: File path to the target
        operation: Operation type (inspect, modify, create)
        patch: Optional diff or new content
        reason: Why this change is being made
        timestamp: When the operation was created
        operation_id: Unique identifier for this operation
    """
    target: ForgeTarget
    path: str
    operation: str  # inspect, modify, create
    patch: Optional[str] = None
    reason: str = ""
    timestamp: float = field(default_factory=time.time)
    operation_id: str = field(default="")

    def __post_init__(self):
        if not self.operation_id:
            # Generate unique ID from content hash
            content = f"{self.target.value}:{self.path}:{self.operation}:{self.patch}"
            self.operation_id = hashlib.sha256(content.encode()).hexdigest()[:12]


class Forge:
    """
    Core Foundry System for self-modification.

    Provides safe mechanisms to inspect, assess, modify, and rollback
    changes to the PixelBrain substrate.

    Example:
        foundry = Forge()

        # Inspect a shader
        code = foundry.inspect(ForgeTarget.SHADER, "pixel_brain_attention.wgsl")

        # Assess its performance
        metrics = foundry.assess(ForgeTarget.SHADER, "pixel_brain_attention.wgsl")

        # Create a modification operation
        op = ForgeOperation(
            target=ForgeTarget.SHADER,
            path="pixel_brain_attention.wgsl",
            operation="modify",
            patch="// Optimized version\n...",
            reason="Improve attention performance"
        )

        # Apply the change
        success = foundry.forge(op)

        # Rollback if needed
        foundry.rollback(op.operation_id)
    """

    def __init__(self, backup_dir: Optional[str] = None, project_root: Optional[str] = None):
        """
        Initialize the Forge.

        Args:
            backup_dir: Directory for backups (default: .geometry/foundry_backups)
            project_root: Project root directory (default: auto-detected)
        """
        self.project_root = Path(project_root or self._detect_project_root())
        self.backup_dir = Path(backup_dir or self.project_root / ".geometry" / "foundry_backups")
        self.backup_dir.mkdir(parents=True, exist_ok=True)

        self._history: List[Dict[str, Any]] = []
        self._backups: Dict[str, str] = {}  # operation_id -> backup_path

        # Import safety checker lazily to avoid circular imports
        from .safety import SafetyChecker, SafetyLevel
        self.safety = SafetyChecker()
        self.safety.set_level(SafetyLevel.MODERATE)

    def _detect_project_root(self) -> str:
        """Detect project root by looking for key markers."""
        current = Path.cwd()
        while current != current.parent:
            if (current / "systems").exists():
                return str(current)
            current = current.parent
        return str(Path.cwd())

    def _resolve_path(self, path: str) -> Path:
        """Resolve a path relative to project root."""
        p = Path(path)
        if p.is_absolute():
            return p
        return self.project_root / path

    def inspect(self, target: ForgeTarget, path: str) -> str:
        """
        Read and return the current state of a target.

        Args:
            target: Type of target to inspect
            path: File path to the target

        Returns:
            Content of the target file
        """
        resolved = self._resolve_path(path)

        if not resolved.exists():
            raise FileNotFoundError(f"Target not found: {resolved}")

        logger.info(f"Inspecting {target.value}: {path}")

        with open(resolved, 'r') as f:
            content = f.read()

        return content

    def assess(self, target: ForgeTarget, path: str) -> Dict[str, Any]:
        """
        Analyze the performance/quality of a target.

        Args:
            target: Type of target to assess
            path: File path to the target

        Returns:
            Dictionary of metrics and analysis results
        """
        resolved = self._resolve_path(path)

        if not resolved.exists():
            raise FileNotFoundError(f"Target not found: {resolved}")

        logger.info(f"Assessing {target.value}: {path}")

        content = self.inspect(target, path)

        if target == ForgeTarget.SHADER:
            return self._assess_shader(content, resolved)
        elif target == ForgeTarget.GEOASM:
            return self._assess_geoasm(content, resolved)
        elif target == ForgeTarget.STRATEGY:
            return self._assess_strategy(content, resolved)
        elif target == ForgeTarget.VISUAL:
            return self._assess_visual(content, resolved)

        return {'status': 'unknown', 'target': target.value}

    def _assess_shader(self, content: str, path: Path) -> Dict[str, Any]:
        """Assess a WGSL shader file."""
        lines = content.split('\n')

        # Count functions
        functions = [l for l in lines if l.strip().startswith('fn ')]

        # Count compute/vertex/fragment entry points
        entry_points = [l for l in lines if '@compute' in l or '@vertex' in l or '@fragment' in l]

        # Estimate complexity (rough metric)
        complexity = len([l for l in lines if l.strip() and not l.strip().startswith('//')])

        # Check for common patterns
        has_loops = 'for' in content or 'while' in content or 'loop' in content
        has_textures = 'texture_' in content
        has_storage = 'storage' in content

        return {
            'status': 'analyzed',
            'target': 'shader',
            'path': str(path),
            'lines': len(lines),
            'functions': len(functions),
            'entry_points': len(entry_points),
            'complexity_score': complexity,
            'has_loops': has_loops,
            'has_textures': has_textures,
            'has_storage_buffers': has_storage,
            'function_names': [f.split('fn ')[1].split('(')[0] for f in functions[:10]],
        }

    def _assess_geoasm(self, content: str, path: Path) -> Dict[str, Any]:
        """Assess a GeoASM program."""
        from systems.visual_shell.geoasm import Assembler

        try:
            assembler = Assembler()
            instructions = assembler.assemble(content)

            # Analyze instruction distribution
            opcode_counts = {}
            for inst in instructions:
                name = inst.opcode.name
                opcode_counts[name] = opcode_counts.get(name, 0) + 1

            return {
                'status': 'analyzed',
                'target': 'geoasm',
                'path': str(path),
                'instruction_count': len(instructions),
                'opcode_distribution': opcode_counts,
                'has_attention': 'ATTEND' in opcode_counts,
                'has_embedding': 'EMBED' in opcode_counts,
                'has_sampling': 'SAMPLE' in opcode_counts,
            }
        except Exception as e:
            return {
                'status': 'error',
                'error': str(e),
                'path': str(path),
            }

    def _assess_strategy(self, content: str, path: Path) -> Dict[str, Any]:
        """Assess a tectonic strategy."""
        lines = content.split('\n')

        return {
            'status': 'analyzed',
            'target': 'strategy',
            'path': str(path),
            'lines': len(lines),
            'size_bytes': len(content.encode()),
        }

    def _assess_visual(self, content: str, path: Path) -> Dict[str, Any]:
        """Assess a visual component."""
        lines = content.split('\n')

        # Detect language
        suffix = path.suffix.lower()
        lang = 'unknown'
        if suffix == '.js':
            lang = 'javascript'
        elif suffix == '.wgsl':
            lang = 'wgsl'
        elif suffix == '.py':
            lang = 'python'

        return {
            'status': 'analyzed',
            'target': 'visual',
            'path': str(path),
            'lines': len(lines),
            'language': lang,
            'size_bytes': len(content.encode()),
        }

    def forge(self, operation: ForgeOperation) -> bool:
        """
        Apply a forge operation.

        Args:
            operation: The operation to apply

        Returns:
            True if successful, False otherwise
        """
        resolved = self._resolve_path(operation.path)

        logger.info(f"Forging {operation.target.value}: {operation.operation} on {operation.path}")

        # Validate operation
        if operation.operation not in ('inspect', 'modify', 'create'):
            raise ValueError(f"Invalid operation: {operation.operation}")

        if operation.operation == 'inspect':
            # Inspect doesn't modify anything
            return True

        # Safety check
        is_safe, reason = self.safety.check_patch(operation.target, operation.patch or "")
        if not is_safe:
            logger.warning(f"Safety check failed: {reason}")
            return False

        # Backup existing file if modifying
        if operation.operation == 'modify' and resolved.exists():
            backup_path = self._backup(resolved)
            self._backups[operation.operation_id] = backup_path

        try:
            if operation.operation == 'create':
                # Create new file
                resolved.parent.mkdir(parents=True, exist_ok=True)
                with open(resolved, 'w') as f:
                    f.write(operation.patch or "")

            elif operation.operation == 'modify':
                # Modify existing file
                if not resolved.exists():
                    raise FileNotFoundError(f"Cannot modify non-existent file: {resolved}")

                with open(resolved, 'w') as f:
                    f.write(operation.patch or "")

            # Record in history
            self._history.append({
                'operation_id': operation.operation_id,
                'target': operation.target.value,
                'path': str(resolved),
                'operation': operation.operation,
                'reason': operation.reason,
                'timestamp': operation.timestamp,
                'success': True,
            })

            logger.info(f"Successfully forged: {operation.operation_id}")
            return True

        except Exception as e:
            logger.error(f"Forge failed: {e}")

            self._history.append({
                'operation_id': operation.operation_id,
                'target': operation.target.value,
                'path': str(resolved),
                'operation': operation.operation,
                'reason': operation.reason,
                'timestamp': operation.timestamp,
                'success': False,
                'error': str(e),
            })

            return False

    def _backup(self, path: Path) -> str:
        """
        Create a backup of a file before modification.

        Args:
            path: Path to the file to backup

        Returns:
            Path to the backup file
        """
        timestamp = time.strftime("%Y%m%d_%H%M%S")
        backup_name = f"{path.name}.{timestamp}.bak"
        backup_path = self.backup_dir / backup_name

        shutil.copy2(path, backup_path)

        logger.info(f"Created backup: {backup_path}")
        return str(backup_path)

    def rollback(self, operation_id: str) -> bool:
        """
        Revert a previously applied operation.

        Args:
            operation_id: ID of the operation to rollback

        Returns:
            True if rollback successful, False otherwise
        """
        # Find the operation in history
        op_record = None
        for record in self._history:
            if record['operation_id'] == operation_id:
                op_record = record
                break

        if not op_record:
            logger.warning(f"Operation not found: {operation_id}")
            return False

        if op_record['operation'] == 'create':
            # Delete created file
            path = Path(op_record['path'])
            if path.exists():
                path.unlink()
                logger.info(f"Deleted created file: {path}")
            return True

        if op_record['operation'] == 'modify':
            # Restore from backup
            if operation_id not in self._backups:
                logger.warning(f"No backup found for: {operation_id}")
                return False

            backup_path = Path(self._backups[operation_id])
            target_path = Path(op_record['path'])

            if not backup_path.exists():
                logger.warning(f"Backup file missing: {backup_path}")
                return False

            shutil.copy2(backup_path, target_path)
            logger.info(f"Restored from backup: {target_path}")

            # Record rollback
            self._history.append({
                'operation_id': f"{operation_id}_rollback",
                'target': op_record['target'],
                'path': op_record['path'],
                'operation': 'rollback',
                'reason': f"Rollback of {operation_id}",
                'timestamp': time.time(),
                'success': True,
            })

            return True

        return False

    @property
    def history(self) -> List[Dict[str, Any]]:
        """
        Get the list of past operations.

        Returns:
            List of operation records
        """
        return list(self._history)

    def get_pending_approvals(self) -> List[ForgeOperation]:
        """
        Get operations pending approval (for strict safety mode).

        Returns:
            List of operations requiring approval
        """
        # In strict mode, certain operations require approval
        # This returns operations that have been submitted but not approved
        return []

    def approve_operation(self, operation_id: str) -> bool:
        """
        Approve a pending operation.

        Args:
            operation_id: ID of the operation to approve

        Returns:
            True if approved successfully
        """
        # Mark operation as approved
        return True

    def clear_history(self) -> None:
        """Clear operation history (does not delete backups)."""
        self._history.clear()

    def get_backup_path(self, operation_id: str) -> Optional[str]:
        """
        Get the backup path for an operation.

        Args:
            operation_id: ID of the operation

        Returns:
            Backup path or None if not found
        """
        return self._backups.get(operation_id)

    def list_backups(self) -> List[Dict[str, Any]]:
        """
        List all available backups.

        Returns:
            List of backup records
        """
        backups = []
        for backup_file in self.backup_dir.glob("*.bak"):
            backups.append({
                'path': str(backup_file),
                'name': backup_file.name,
                'size': backup_file.stat().st_size,
                'created': backup_file.stat().st_mtime,
            })
        return backups
