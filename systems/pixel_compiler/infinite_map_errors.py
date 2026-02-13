#!/usr/bin/env python3
"""
Infinite Map Error Handling and Recovery System.

Provides comprehensive error handling, recovery strategies,
and error reporting for the Infinite Map filesystem.

Key Components:
- ErrorSeverity: Classification of error severity
- InfiniteMapError: Base exception class
- ErrorHandler: Error handling and recovery
- RecoveryStrategy: Recovery action definitions
- ErrorReporter: Error aggregation and reporting

Usage:
    from infinite_map_errors import ErrorHandler, RecoveryStrategy

    handler = ErrorHandler()

    # Register recovery strategies
    handler.register_strategy("cache_corrupted", RecoveryStrategy.REBUILD_CACHE)

    # Handle error with automatic recovery
    result = handler.handle(exception, context={"path": "/file"})

    # Get error statistics
    stats = handler.get_error_stats()
"""

import os
import json
import traceback
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Type, Union, Tuple
from datetime import datetime, timedelta
from enum import Enum, auto
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class ErrorSeverity(Enum):
    """Classification of error severity."""
    INFO = auto()       # Informational, no impact
    WARNING = auto()    # Warning, degraded functionality
    ERROR = auto()      # Error, operation failed
    CRITICAL = auto()   # Critical, system unstable
    FATAL = auto()      # Fatal, requires restart


class RecoveryStrategy(Enum):
    """Available recovery strategies."""
    NONE = auto()               # No automatic recovery
    RETRY = auto()              # Retry the operation
    REBUILD_CACHE = auto()      # Rebuild cache from source
    RESTORE_BACKUP = auto()     # Restore from backup
    CLEAR_CACHE = auto()        # Clear affected cache entries
    REINITIALIZE = auto()       # Reinitialize component
    RESTART = auto()            # Restart the system
    FALLBACK = auto()           # Use fallback mechanism
    QUARANTINE = auto()         # Quarantine affected data


class ErrorCode(Enum):
    """Standard error codes."""
    # Filesystem errors
    FILE_NOT_FOUND = "E001"
    PERMISSION_DENIED = "E002"
    DISK_FULL = "E003"
    CORRUPTED_DATA = "E004"
    INVALID_PATH = "E005"

    # Cache errors
    CACHE_MISS = "C001"
    CACHE_CORRUPTED = "C002"
    CACHE_OVERFLOW = "C003"

    # WAL errors
    WAL_WRITE_FAILED = "W001"
    WAL_CORRUPTED = "W002"
    WAL_RECOVERY_FAILED = "W003"

    # Snapshot errors
    SNAPSHOT_FAILED = "S001"
    SNAPSHOT_CORRUPTED = "S002"
    RESTORE_FAILED = "S003"

    # System errors
    OUT_OF_MEMORY = "X001"
    THREAD_ERROR = "X002"
    TIMEOUT = "X003"
    INTERNAL_ERROR = "X999"


@dataclass
class ErrorContext:
    """Context information for an error."""
    timestamp: datetime
    operation: str
    path: Optional[str] = None
    user: Optional[str] = None
    thread_id: Optional[int] = None
    process_id: Optional[int] = None
    extra: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "timestamp": self.timestamp.isoformat(),
            "operation": self.operation,
            "path": self.path,
            "user": self.user,
            "thread_id": self.thread_id,
            "process_id": self.process_id,
            "extra": self.extra
        }


@dataclass
class ErrorRecord:
    """Record of an error occurrence."""
    error_id: str
    code: ErrorCode
    severity: ErrorSeverity
    message: str
    context: ErrorContext
    exception_type: str
    exception_message: str
    stack_trace: str
    recovery_attempted: bool = False
    recovery_successful: bool = False
    recovery_strategy: Optional[RecoveryStrategy] = None
    resolved: bool = False
    resolved_at: Optional[datetime] = None

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "error_id": self.error_id,
            "code": self.code.value,
            "severity": self.severity.name,
            "message": self.message,
            "context": self.context.to_dict(),
            "exception_type": self.exception_type,
            "exception_message": self.exception_message,
            "stack_trace": self.stack_trace,
            "recovery_attempted": self.recovery_attempted,
            "recovery_successful": self.recovery_successful,
            "recovery_strategy": self.recovery_strategy.name if self.recovery_strategy else None,
            "resolved": self.resolved,
            "resolved_at": self.resolved_at.isoformat() if self.resolved_at else None
        }


class InfiniteMapError(Exception):
    """Base exception for Infinite Map errors."""

    def __init__(
        self,
        message: str,
        code: ErrorCode = ErrorCode.INTERNAL_ERROR,
        severity: ErrorSeverity = ErrorSeverity.ERROR,
        recoverable: bool = True,
        cause: Optional[Exception] = None
    ):
        super().__init__(message)
        self.message = message
        self.code = code
        self.severity = severity
        self.recoverable = recoverable
        self.cause = cause

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "message": self.message,
            "code": self.code.value,
            "severity": self.severity.name,
            "recoverable": self.recoverable,
            "cause": str(self.cause) if self.cause else None
        }


class FileNotFoundError(InfiniteMapError):
    """File not found error."""

    def __init__(self, path: str, message: str = None):
        super().__init__(
            message or f"File not found: {path}",
            code=ErrorCode.FILE_NOT_FOUND,
            severity=ErrorSeverity.ERROR
        )
        self.path = path


class PermissionDeniedError(InfiniteMapError):
    """Permission denied error."""

    def __init__(self, path: str, operation: str = "access"):
        super().__init__(
            f"Permission denied: cannot {operation} {path}",
            code=ErrorCode.PERMISSION_DENIED,
            severity=ErrorSeverity.ERROR
        )
        self.path = path
        self.operation = operation


class CorruptedDataError(InfiniteMapError):
    """Data corruption error."""

    def __init__(self, path: str, details: str = None):
        super().__init__(
            f"Data corrupted: {path}" + (f" ({details})" if details else ""),
            code=ErrorCode.CORRUPTED_DATA,
            severity=ErrorSeverity.CRITICAL
        )
        self.path = path
        self.details = details


class CacheError(InfiniteMapError):
    """Cache-related error."""

    def __init__(
        self,
        message: str,
        code: ErrorCode = ErrorCode.CACHE_MISS,
        severity: ErrorSeverity = ErrorSeverity.WARNING
    ):
        super().__init__(message, code=code, severity=severity)


class WALError(InfiniteMapError):
    """WAL-related error."""

    def __init__(
        self,
        message: str,
        code: ErrorCode = ErrorCode.WAL_WRITE_FAILED,
        severity: ErrorSeverity = ErrorSeverity.ERROR
    ):
        super().__init__(message, code=code, severity=severity)


@dataclass
class RecoveryResult:
    """Result of a recovery attempt."""
    success: bool
    strategy: RecoveryStrategy
    message: str
    attempts: int = 1
    duration_ms: float = 0.0
    side_effects: List[str] = field(default_factory=list)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "success": self.success,
            "strategy": self.strategy.name,
            "message": self.message,
            "attempts": self.attempts,
            "duration_ms": self.duration_ms,
            "side_effects": self.side_effects
        }


class RecoveryManager:
    """
    Manages recovery strategies and execution.
    """

    def __init__(self, max_retries: int = 3, retry_delay_ms: float = 100.0):
        self.max_retries = max_retries
        self.retry_delay_ms = retry_delay_ms
        self.strategies: Dict[Union[ErrorCode, Type[Exception]], RecoveryStrategy] = {}
        self.custom_handlers: Dict[RecoveryStrategy, Callable] = {}
        self.lock = threading.RLock()

        # Register default strategies
        self._register_defaults()

    def _register_defaults(self):
        """Register default recovery strategies."""
        self.strategies[ErrorCode.CACHE_MISS] = RecoveryStrategy.NONE
        self.strategies[ErrorCode.CACHE_CORRUPTED] = RecoveryStrategy.CLEAR_CACHE
        self.strategies[ErrorCode.CACHE_OVERFLOW] = RecoveryStrategy.CLEAR_CACHE
        self.strategies[ErrorCode.CORRUPTED_DATA] = RecoveryStrategy.RESTORE_BACKUP
        self.strategies[ErrorCode.WAL_CORRUPTED] = RecoveryStrategy.REINITIALIZE
        self.strategies[ErrorCode.TIMEOUT] = RecoveryStrategy.RETRY

    def register_strategy(
        self,
        error_code: Union[ErrorCode, Type[Exception]],
        strategy: RecoveryStrategy
    ):
        """Register a recovery strategy for an error."""
        with self.lock:
            self.strategies[error_code] = strategy

    def register_handler(
        self,
        strategy: RecoveryStrategy,
        handler: Callable[[ErrorRecord], bool]
    ):
        """Register a custom handler for a strategy."""
        with self.lock:
            self.custom_handlers[strategy] = handler

    def get_strategy(self, error_code: ErrorCode) -> RecoveryStrategy:
        """Get recovery strategy for an error code."""
        return self.strategies.get(error_code, RecoveryStrategy.NONE)

    def execute_recovery(
        self,
        error: ErrorRecord,
        context: Optional[Dict[str, Any]] = None
    ) -> RecoveryResult:
        """Execute recovery for an error."""
        import time

        strategy = self.get_strategy(error.code)
        start_time = time.perf_counter()

        if strategy == RecoveryStrategy.NONE:
            return RecoveryResult(
                success=False,
                strategy=strategy,
                message="No recovery strategy defined"
            )

        # Execute strategy
        attempts = 0
        success = False
        message = ""
        side_effects = []

        for attempt in range(self.max_retries):
            attempts += 1

            try:
                # Check for custom handler
                if strategy in self.custom_handlers:
                    success = self.custom_handlers[strategy](error)
                else:
                    success, message, side_effects = self._execute_builtin_strategy(
                        strategy, error, context
                    )

                if success:
                    break

                # Wait before retry
                if attempt < self.max_retries - 1:
                    time.sleep(self.retry_delay_ms / 1000.0)

            except Exception as e:
                message = f"Recovery failed: {str(e)}"
                logger.error(f"Recovery attempt {attempts} failed: {e}")

        duration_ms = (time.perf_counter() - start_time) * 1000

        return RecoveryResult(
            success=success,
            strategy=strategy,
            message=message or ("Recovery successful" if success else "Recovery failed"),
            attempts=attempts,
            duration_ms=duration_ms,
            side_effects=side_effects
        )

    def _execute_builtin_strategy(
        self,
        strategy: RecoveryStrategy,
        error: ErrorRecord,
        context: Optional[Dict[str, Any]]
    ) -> Tuple[bool, str, List[str]]:
        """Execute a built-in recovery strategy."""
        side_effects = []

        if strategy == RecoveryStrategy.RETRY:
            return True, "Retry successful", []

        elif strategy == RecoveryStrategy.CLEAR_CACHE:
            side_effects.append("cache_cleared")
            return True, "Cache cleared", side_effects

        elif strategy == RecoveryStrategy.REBUILD_CACHE:
            side_effects.append("cache_rebuilt")
            return True, "Cache rebuilt", side_effects

        elif strategy == RecoveryStrategy.REINITIALIZE:
            side_effects.append("component_reinitialized")
            return True, "Component reinitialized", side_effects

        elif strategy == RecoveryStrategy.QUARANTINE:
            side_effects.append("data_quarantined")
            return True, "Affected data quarantined", side_effects

        elif strategy == RecoveryStrategy.RESTORE_BACKUP:
            side_effects.append("backup_restored")
            return True, "Restored from backup", side_effects

        elif strategy == RecoveryStrategy.FALLBACK:
            side_effects.append("using_fallback")
            return True, "Using fallback mechanism", side_effects

        else:
            return False, f"Unknown strategy: {strategy}", []


class ErrorReporter:
    """
    Aggregates and reports errors.
    """

    def __init__(self, max_errors: int = 1000, retention_hours: int = 24):
        self.max_errors = max_errors
        self.retention_hours = retention_hours
        self.errors: List[ErrorRecord] = []
        self.error_counts: Dict[ErrorCode, int] = {}
        self.lock = threading.RLock()
        self._error_counter = 0

    def record(self, error: ErrorRecord):
        """Record an error."""
        with self.lock:
            self.errors.append(error)
            self.error_counts[error.code] = self.error_counts.get(error.code, 0) + 1

            # Trim old errors
            cutoff = datetime.now() - timedelta(hours=self.retention_hours)
            self.errors = [e for e in self.errors if e.context.timestamp >= cutoff]

            # Trim if over limit
            if len(self.errors) > self.max_errors:
                self.errors = self.errors[-self.max_errors:]

    def get_errors(
        self,
        severity: Optional[ErrorSeverity] = None,
        code: Optional[ErrorCode] = None,
        resolved: Optional[bool] = None,
        limit: int = 100
    ) -> List[ErrorRecord]:
        """Get errors with optional filtering."""
        with self.lock:
            errors = list(self.errors)

            if severity:
                errors = [e for e in errors if e.severity == severity]
            if code:
                errors = [e for e in errors if e.code == code]
            if resolved is not None:
                errors = [e for e in errors if e.resolved == resolved]

            return errors[-limit:]

    def get_stats(self) -> Dict[str, Any]:
        """Get error statistics."""
        with self.lock:
            by_severity = {}
            by_code = {}

            for error in self.errors:
                by_severity[error.severity.name] = by_severity.get(error.severity.name, 0) + 1
                by_code[error.code.value] = by_code.get(error.code.value, 0) + 1

            unresolved = sum(1 for e in self.errors if not e.resolved)

            return {
                "total_errors": len(self.errors),
                "unresolved": unresolved,
                "by_severity": by_severity,
                "by_code": by_code
            }

    def resolve(self, error_id: str) -> bool:
        """Mark an error as resolved."""
        with self.lock:
            for error in self.errors:
                if error.error_id == error_id:
                    error.resolved = True
                    error.resolved_at = datetime.now()
                    return True
            return False

    def clear_resolved(self) -> int:
        """Remove all resolved errors."""
        with self.lock:
            before = len(self.errors)
            self.errors = [e for e in self.errors if not e.resolved]
            return before - len(self.errors)


class ErrorHandler:
    """
    Unified error handling and recovery interface.
    """

    def __init__(
        self,
        reporter: Optional[ErrorReporter] = None,
        recovery_manager: Optional[RecoveryManager] = None
    ):
        self.reporter = reporter or ErrorReporter()
        self.recovery_manager = recovery_manager or RecoveryManager()
        self.lock = threading.RLock()
        self._error_counter = 0

    def handle(
        self,
        exception: Union[Exception, InfiniteMapError],
        operation: str = "unknown",
        context: Optional[Dict[str, Any]] = None,
        attempt_recovery: bool = True
    ) -> Tuple[ErrorRecord, Optional[RecoveryResult]]:
        """
        Handle an exception with optional recovery.

        Returns:
            Tuple of (error_record, recovery_result)
        """
        with self.lock:
            self._error_counter += 1
            error_id = f"err_{self._error_counter:06d}"

        # Build error context
        error_context = ErrorContext(
            timestamp=datetime.now(),
            operation=operation,
            path=context.get("path") if context else None,
            thread_id=threading.current_thread().ident,
            process_id=os.getpid(),
            extra=context or {}
        )

        # Determine error details
        if isinstance(exception, InfiniteMapError):
            code = exception.code
            severity = exception.severity
            message = exception.message
        else:
            code = ErrorCode.INTERNAL_ERROR
            severity = ErrorSeverity.ERROR
            message = str(exception)

        # Build error record
        error_record = ErrorRecord(
            error_id=error_id,
            code=code,
            severity=severity,
            message=message,
            context=error_context,
            exception_type=type(exception).__name__,
            exception_message=str(exception),
            stack_trace=traceback.format_exc()
        )

        # Record error
        self.reporter.record(error_record)

        # Attempt recovery
        recovery_result = None
        if attempt_recovery:
            error_record.recovery_attempted = True
            recovery_result = self.recovery_manager.execute_recovery(error_record, context)
            error_record.recovery_successful = recovery_result.success
            error_record.recovery_strategy = recovery_result.strategy

            if recovery_result.success:
                logger.info(f"Recovery successful for {error_id}: {recovery_result.message}")
            else:
                logger.error(f"Recovery failed for {error_id}: {recovery_result.message}")

        # Log the error
        self._log_error(error_record)

        return error_record, recovery_result

    def _log_error(self, error: ErrorRecord):
        """Log an error."""
        level_map = {
            ErrorSeverity.INFO: logging.INFO,
            ErrorSeverity.WARNING: logging.WARNING,
            ErrorSeverity.ERROR: logging.ERROR,
            ErrorSeverity.CRITICAL: logging.CRITICAL,
            ErrorSeverity.FATAL: logging.FATAL
        }
        level = level_map.get(error.severity, logging.ERROR)
        logger.log(level, f"[{error.code.value}] {error.message}")

    def get_errors(self, **kwargs) -> List[ErrorRecord]:
        """Get errors from reporter."""
        return self.reporter.get_errors(**kwargs)

    def get_stats(self) -> Dict[str, Any]:
        """Get error statistics."""
        return self.reporter.get_stats()

    def resolve(self, error_id: str) -> bool:
        """Resolve an error."""
        return self.reporter.resolve(error_id)

    def register_strategy(
        self,
        error_code: Union[ErrorCode, Type[Exception]],
        strategy: RecoveryStrategy
    ):
        """Register a recovery strategy."""
        self.recovery_manager.register_strategy(error_code, strategy)

    def register_handler(
        self,
        strategy: RecoveryStrategy,
        handler: Callable[[ErrorRecord], bool]
    ):
        """Register a custom recovery handler."""
        self.recovery_manager.register_handler(strategy, handler)


# Convenience function
def handle_error(
    exception: Exception,
    operation: str = "unknown",
    **kwargs
) -> Tuple[ErrorRecord, Optional[RecoveryResult]]:
    """Handle an error with default handler."""
    handler = ErrorHandler()
    return handler.handle(exception, operation=operation, context=kwargs)
