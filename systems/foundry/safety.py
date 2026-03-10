"""
Foundry Safety System

Provides safety validation for self-modification operations.
Ensures that PixelBrain cannot accidentally damage its own substrate.
"""

from enum import Enum
from typing import Tuple, List, Optional, Set
import re
import logging

logger = logging.getLogger(__name__)


class SafetyLevel(Enum):
    """Safety strictness levels."""
    PERMISSIVE = "permissive"   # Allow most operations with minimal checks
    MODERATE = "moderate"       # Block obvious dangers, require backup
    STRICT = "strict"           # Require approval for most modifications


class SafetyChecker:
    """
    Safety validation for forge operations.

    Implements multiple levels of safety checking to prevent
    accidental or malicious modifications to critical system files.

    Example:
        checker = SafetyChecker()
        checker.set_level(SafetyLevel.STRICT)

        # Check if a patch is safe
        is_safe, reason = checker.check_patch(ForgeTarget.SHADER, patch_content)

        if is_safe:
            # Apply the patch
            pass
        else:
            print(f"Blocked: {reason}")
    """

    # Patterns that are always blocked
    BLOCKED_PATTERNS = [
        # Dangerous shell commands
        r'rm\s+-rf',
        r'del\s+/[sS]',
        r'format\s+',
        r'shutdown',
        r'reboot',
        r'halt',

        # Code execution
        r'exec\s*\(',
        r'eval\s*\(',
        r'__import__\s*\(',
        r'compile\s*\(',
        r'execfile',

        # Unsafe deserialization
        r'pickle\.loads',
        r'pickle\.load',
        r'marshal\.loads',
        r'yaml\.load\s*\([^)]*\)',  # Unsafe YAML (without Loader)

        # System access
        r'os\.system',
        r'subprocess\.call',
        r'subprocess\.Popen',
        r'commands\.',

        # File system destruction
        r'shutil\.rmtree',
        r'os\.removedirs',
        r'os\.unlink',

        # Network dangers
        r'socket\.connect',
        r'urllib\.request\.urlopen',

        # Privilege escalation
        r'sudo',
        r'setuid',
        r'setgid',
        r'chmod\s+777',

        # Infinite loops (WGSL specific)
        r'loop\s*\{\s*\}',  # Empty infinite loop
    ]

    # Patterns that require approval in moderate/strict mode
    ESCALATION_PATTERNS = [
        # Mass operations
        r'delete.*all',
        r'remove.*all',
        r'truncate',
        r'drop_table',
        r'wipe',

        # Critical system files
        r'evolution_daemon\.py',
        r'foundry\.py',
        r'safety\.py',
        r'guardian_gate\.py',

        # Configuration changes
        r'config\.json',
        r'settings\.py',
        r'\.env',
    ]

    # Critical files that always require approval in strict mode
    CRITICAL_FILES: Set[str] = {
        'safety.py',
        'forge.py',
        'evolution_daemon.py',
        'guardian_gate.py',
        'sandbox_manager.py',
    }

    # Maximum sizes for different targets
    MAX_SIZES = {
        'shader': 100 * 1024,      # 100 KB max for shaders
        'geoasm': 10 * 1024,       # 10 KB max for programs
        'strategy': 50 * 1024,     # 50 KB max for strategies
        'visual': 500 * 1024,      # 500 KB max for visual components
    }

    def __init__(self):
        """Initialize the safety checker."""
        self._level = SafetyLevel.MODERATE
        self._pending_approvals: List[dict] = []
        self._approved_operations: Set[str] = set()
        self._blocked_count = 0

    def set_level(self, level: SafetyLevel) -> None:
        """
        Set the safety level.

        Args:
            level: The safety level to use
        """
        self._level = level
        logger.info(f"Safety level set to: {level.value}")

    def get_level(self) -> SafetyLevel:
        """Get current safety level."""
        return self._level

    def check_patch(
        self,
        target,
        patch: str,
        path: Optional[str] = None
    ) -> Tuple[bool, str]:
        """
        Validate a patch for safety.

        Args:
            target: ForgeTarget type
            patch: The patch content to check
            path: Optional file path for additional context

        Returns:
            Tuple of (is_safe, reason)
        """
        target_name = target.value if hasattr(target, 'value') else str(target)

        # 1. Check for blocked patterns (always enforced)
        blocked_match = self._check_blocked_patterns(patch)
        if blocked_match:
            self._blocked_count += 1
            logger.warning(f"Blocked pattern detected: {blocked_match}")
            return False, f"Blocked pattern detected: {blocked_match}"

        # 2. Check size limits
        size_check = self._check_size(target_name, patch)
        if not size_check[0]:
            return size_check

        # 3. Check for escalation patterns
        escalation_match = self._check_escalation_patterns(patch)
        if escalation_match:
            if self._level in (SafetyLevel.MODERATE, SafetyLevel.STRICT):
                logger.warning(f"Escalation pattern detected: {escalation_match}")
                return False, f"Requires approval: {escalation_match}"

        # 4. Check critical files (strict mode)
        if self._level == SafetyLevel.STRICT and path:
            critical_check = self._check_critical_file(path)
            if not critical_check[0]:
                return critical_check

        # 5. Validate target-specific rules
        target_check = self._check_target_rules(target_name, patch)
        if not target_check[0]:
            return target_check

        # 6. Check WGSL-specific safety (for shader targets)
        if target_name == 'shader':
            wgsl_check = self._check_wgsl_safety(patch)
            if not wgsl_check[0]:
                return wgsl_check

        # 7. Check GeoASM-specific safety (for geoasm targets)
        if target_name == 'geoasm':
            geoasm_check = self._check_geoasm_safety(patch)
            if not geoasm_check[0]:
                return geoasm_check

        return True, "Patch approved"

    def _check_blocked_patterns(self, content: str) -> Optional[str]:
        """Check for blocked patterns."""
        content_lower = content.lower()

        for pattern in self.BLOCKED_PATTERNS:
            if re.search(pattern, content_lower):
                return pattern

        return None

    def _check_escalation_patterns(self, content: str) -> Optional[str]:
        """Check for escalation patterns."""
        content_lower = content.lower()

        for pattern in self.ESCALATION_PATTERNS:
            if re.search(pattern, content_lower):
                return pattern

        return None

    def _check_size(self, target: str, content: str) -> Tuple[bool, str]:
        """Check content size limits."""
        max_size = self.MAX_SIZES.get(target, 1024 * 1024)  # Default 1MB
        content_size = len(content.encode('utf-8'))

        if content_size > max_size:
            return False, f"Content too large: {content_size} bytes (max: {max_size})"

        return True, ""

    def _check_critical_file(self, path: str) -> Tuple[bool, str]:
        """Check if modifying a critical file."""
        filename = path.split('/')[-1]

        if filename in self.CRITICAL_FILES:
            if filename.replace('.py', '') not in self._approved_operations:
                return False, f"Critical file requires approval: {filename}"

        return True, ""

    def _check_target_rules(self, target: str, content: str) -> Tuple[bool, str]:
        """Check target-specific rules."""
        if target == 'shader':
            # Shaders should have entry points
            if '@compute' not in content and '@vertex' not in content and '@fragment' not in content:
                if self._level == SafetyLevel.STRICT:
                    return False, "Shader has no entry point (@compute, @vertex, or @fragment)"

        elif target == 'geoasm':
            # GeoASM should have valid structure
            if 'EMBED' not in content and 'SAMPLE' not in content:
                if self._level == SafetyLevel.STRICT:
                    return False, "GeoASM program missing EMBED or SAMPLE instructions"

        return True, ""

    def _check_wgsl_safety(self, content: str) -> Tuple[bool, str]:
        """Check WGSL-specific safety rules."""
        # Check for infinite loops without break
        if re.search(r'loop\s*\{[^}]*\}', content):
            if 'break' not in content and 'return' not in content:
                return False, "Potential infinite loop detected in WGSL"

        # Check for uninitialized variables
        if re.search(r'var\s+\w+\s*:', content):
            if 'var<private>' in content or 'var<function>' in content:
                # Variables should be initialized
                pass  # Allow for now, WGSL has default initialization

        # Check for buffer overflow potential
        if 'array' in content:
            # Check for bounds checking
            if '[' in content and ']' in content:
                # Should have bounds checks in loops
                pass  # Complex to validate, allow for now

        return True, ""

    def _check_geoasm_safety(self, content: str) -> Tuple[bool, str]:
        """Check GeoASM-specific safety rules."""
        # Check for reasonable instruction count
        lines = [l for l in content.split('\n') if l.strip()]
        if len(lines) > 10000:
            return False, f"GeoASM program too large: {len(lines)} instructions"

        return True, ""

    def request_approval(self, operation_id: str, reason: str) -> str:
        """
        Request approval for a blocked operation.

        Args:
            operation_id: Unique identifier for the operation
            reason: Why the operation needs approval

        Returns:
            Approval request ID
        """
        request_id = f"approval_{operation_id}"

        self._pending_approvals.append({
            'request_id': request_id,
            'operation_id': operation_id,
            'reason': reason,
            'status': 'pending',
        })

        logger.info(f"Approval requested: {request_id} - {reason}")

        return request_id

    def approve(self, request_id: str) -> bool:
        """
        Approve a pending request.

        Args:
            request_id: The approval request ID

        Returns:
            True if approved successfully
        """
        for request in self._pending_approvals:
            if request['request_id'] == request_id:
                request['status'] = 'approved'
                self._approved_operations.add(request['operation_id'])
                logger.info(f"Approved: {request_id}")
                return True

        return False

    def deny(self, request_id: str) -> bool:
        """
        Deny a pending request.

        Args:
            request_id: The approval request ID

        Returns:
            True if denied successfully
        """
        for request in self._pending_approvals:
            if request['request_id'] == request_id:
                request['status'] = 'denied'
                logger.info(f"Denied: {request_id}")
                return True

        return False

    def get_pending_approvals(self) -> List[dict]:
        """Get list of pending approval requests."""
        return [r for r in self._pending_approvals if r['status'] == 'pending']

    def is_approved(self, operation_id: str) -> bool:
        """Check if an operation has been approved."""
        return operation_id in self._approved_operations

    def get_stats(self) -> dict:
        """Get safety statistics."""
        return {
            'level': self._level.value,
            'blocked_count': self._blocked_count,
            'pending_approvals': len(self.get_pending_approvals()),
            'total_approvals': len(self._approved_operations),
        }

    def clear_approvals(self) -> None:
        """Clear all approvals (for testing)."""
        self._approved_operations.clear()
        self._pending_approvals.clear()

    def add_blocked_pattern(self, pattern: str) -> None:
        """
        Add a custom blocked pattern.

        Args:
            pattern: Regex pattern to block
        """
        self.BLOCKED_PATTERNS.append(pattern)
        logger.info(f"Added blocked pattern: {pattern}")

    def remove_blocked_pattern(self, pattern: str) -> bool:
        """
        Remove a blocked pattern.

        Args:
            pattern: Pattern to remove

        Returns:
            True if pattern was found and removed
        """
        if pattern in self.BLOCKED_PATTERNS:
            self.BLOCKED_PATTERNS.remove(pattern)
            return True
        return False

    def add_critical_file(self, filename: str) -> None:
        """
        Add a file to the critical files list.

        Args:
            filename: Filename to mark as critical
        """
        self.CRITICAL_FILES.add(filename)

    def validate_wgsl_syntax(self, content: str) -> Tuple[bool, List[str]]:
        """
        Basic WGSL syntax validation.

        Args:
            content: WGSL code to validate

        Returns:
            Tuple of (is_valid, list_of_errors)
        """
        errors = []

        # Check balanced braces
        brace_count = content.count('{') - content.count('}')
        if brace_count != 0:
            errors.append(f"Unbalanced braces: {brace_count} extra")

        # Check balanced parentheses
        paren_count = content.count('(') - content.count(')')
        if paren_count != 0:
            errors.append(f"Unbalanced parentheses: {abs(paren_count)} extra")

        # Check for required elements
        has_entry = '@compute' in content or '@vertex' in content or '@fragment' in content
        if not has_entry:
            errors.append("No entry point found")

        # Check for common errors
        if 'func ' in content:
            errors.append("Possible typo: 'func' should be 'fn'")

        return len(errors) == 0, errors

    def validate_geoasm_syntax(self, content: str) -> Tuple[bool, List[str]]:
        """
        Basic GeoASM syntax validation.

        Args:
            content: GeoASM code to validate

        Returns:
            Tuple of (is_valid, list_of_errors)
        """
        errors = []
        valid_opcodes = {'EMBED', 'ATTEND', 'PROJECT', 'SAMPLE', 'LAYER', 'KV_APPEND', 'THOUGHT_PULSE'}

        for i, line in enumerate(content.split('\n')):
            line = line.strip()
            if not line or line.startswith('//') or line.startswith('#'):
                continue

            opcode = line.split()[0].upper()
            if opcode not in valid_opcodes:
                errors.append(f"Unknown opcode '{opcode}' on line {i + 1}")

        return len(errors) == 0, errors
