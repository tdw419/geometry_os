#!/usr/bin/env python3
"""
Tests for Infinite Map Error Handling and Recovery System.

Comprehensive test coverage for:
- ErrorSeverity and RecoveryStrategy enums
- ErrorContext and ErrorRecord dataclasses
- InfiniteMapError and custom exceptions
- RecoveryManager (strategies, execution)
- ErrorReporter (recording, statistics)
- ErrorHandler (unified interface)

Run with:
    PYTHONPATH=. pytest systems/pixel_compiler/tests/test_infinite_map_errors.py -v
"""

import os
import sys
import json
import tempfile
import threading
import time
from pathlib import Path
from datetime import datetime, timedelta
from unittest.mock import Mock, patch, MagicMock

import pytest

# Add parent to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.pixel_compiler.infinite_map_errors import (
    ErrorSeverity,
    RecoveryStrategy,
    ErrorCode,
    ErrorContext,
    ErrorRecord,
    InfiniteMapError,
    FileNotFoundError as InfiniteMapFileNotFoundError,
    PermissionDeniedError,
    CorruptedDataError,
    CacheError,
    WALError,
    RecoveryResult,
    RecoveryManager,
    ErrorReporter,
    ErrorHandler,
    handle_error,
)


class TestErrorSeverity:
    """Tests for ErrorSeverity enum."""

    def test_severity_levels(self):
        """Test all severity levels exist."""
        assert ErrorSeverity.INFO.value == 1
        assert ErrorSeverity.WARNING.value == 2
        assert ErrorSeverity.ERROR.value == 3
        assert ErrorSeverity.CRITICAL.value == 4
        assert ErrorSeverity.FATAL.value == 5


class TestRecoveryStrategy:
    """Tests for RecoveryStrategy enum."""

    def test_strategies(self):
        """Test all recovery strategies exist."""
        assert RecoveryStrategy.NONE.value == 1
        assert RecoveryStrategy.RETRY.value == 2
        assert RecoveryStrategy.REBUILD_CACHE.value == 3
        assert RecoveryStrategy.RESTORE_BACKUP.value == 4
        assert RecoveryStrategy.CLEAR_CACHE.value == 5
        assert RecoveryStrategy.REINITIALIZE.value == 6
        assert RecoveryStrategy.RESTART.value == 7
        assert RecoveryStrategy.FALLBACK.value == 8
        assert RecoveryStrategy.QUARANTINE.value == 9


class TestErrorCode:
    """Tests for ErrorCode enum."""

    def test_filesystem_codes(self):
        """Test filesystem error codes."""
        assert ErrorCode.FILE_NOT_FOUND.value == "E001"
        assert ErrorCode.PERMISSION_DENIED.value == "E002"
        assert ErrorCode.DISK_FULL.value == "E003"
        assert ErrorCode.CORRUPTED_DATA.value == "E004"
        assert ErrorCode.INVALID_PATH.value == "E005"

    def test_cache_codes(self):
        """Test cache error codes."""
        assert ErrorCode.CACHE_MISS.value == "C001"
        assert ErrorCode.CACHE_CORRUPTED.value == "C002"
        assert ErrorCode.CACHE_OVERFLOW.value == "C003"

    def test_wal_codes(self):
        """Test WAL error codes."""
        assert ErrorCode.WAL_WRITE_FAILED.value == "W001"
        assert ErrorCode.WAL_CORRUPTED.value == "W002"
        assert ErrorCode.WAL_RECOVERY_FAILED.value == "W003"

    def test_snapshot_codes(self):
        """Test snapshot error codes."""
        assert ErrorCode.SNAPSHOT_FAILED.value == "S001"
        assert ErrorCode.SNAPSHOT_CORRUPTED.value == "S002"
        assert ErrorCode.RESTORE_FAILED.value == "S003"

    def test_system_codes(self):
        """Test system error codes."""
        assert ErrorCode.OUT_OF_MEMORY.value == "X001"
        assert ErrorCode.THREAD_ERROR.value == "X002"
        assert ErrorCode.TIMEOUT.value == "X003"
        assert ErrorCode.INTERNAL_ERROR.value == "X999"


class TestErrorContext:
    """Tests for ErrorContext dataclass."""

    def test_create_context(self):
        """Test creating error context."""
        context = ErrorContext(
            timestamp=datetime.now(),
            operation="read",
            path="/test/file",
            user="testuser"
        )
        assert context.operation == "read"
        assert context.path == "/test/file"

    def test_context_with_extra(self):
        """Test context with extra fields."""
        context = ErrorContext(
            timestamp=datetime.now(),
            operation="write",
            extra={"key": "value", "count": 42}
        )
        assert context.extra["key"] == "value"
        assert context.extra["count"] == 42

    def test_context_serialization(self):
        """Test context serialization."""
        context = ErrorContext(
            timestamp=datetime(2026, 2, 12, 12, 0, 0),
            operation="test",
            path="/path",
            user="user",
            thread_id=12345,
            process_id=67890,
            extra={"key": "value"}
        )
        data = context.to_dict()

        assert data["operation"] == "test"
        assert data["path"] == "/path"
        assert data["thread_id"] == 12345
        assert data["process_id"] == 67890
        assert "timestamp" in data


class TestErrorRecord:
    """Tests for ErrorRecord dataclass."""

    def test_create_record(self):
        """Test creating an error record."""
        record = ErrorRecord(
            error_id="err_001",
            code=ErrorCode.FILE_NOT_FOUND,
            severity=ErrorSeverity.ERROR,
            message="File not found",
            context=ErrorContext(timestamp=datetime.now(), operation="read"),
            exception_type="FileNotFoundError",
            exception_message="No such file",
            stack_trace=""
        )
        assert record.error_id == "err_001"
        assert record.code == ErrorCode.FILE_NOT_FOUND
        assert record.recovery_attempted is False

    def test_record_serialization(self):
        """Test record serialization."""
        record = ErrorRecord(
            error_id="err_002",
            code=ErrorCode.CACHE_CORRUPTED,
            severity=ErrorSeverity.WARNING,
            message="Cache corrupted",
            context=ErrorContext(timestamp=datetime(2026, 2, 12, 12, 0, 0), operation="cache"),
            exception_type="CacheError",
            exception_message="Invalid cache",
            stack_trace="",
            recovery_attempted=True,
            recovery_successful=True,
            recovery_strategy=RecoveryStrategy.CLEAR_CACHE
        )
        data = record.to_dict()

        assert data["error_id"] == "err_002"
        assert data["code"] == "C002"
        assert data["severity"] == "WARNING"
        assert data["recovery_attempted"] is True
        assert data["recovery_strategy"] == "CLEAR_CACHE"


class TestInfiniteMapError:
    """Tests for InfiniteMapError base class."""

    def test_create_error(self):
        """Test creating an InfiniteMapError."""
        error = InfiniteMapError("Something went wrong")
        assert str(error) == "Something went wrong"
        assert error.code == ErrorCode.INTERNAL_ERROR
        assert error.severity == ErrorSeverity.ERROR
        assert error.recoverable is True

    def test_error_with_cause(self):
        """Test error with underlying cause."""
        cause = ValueError("Original error")
        error = InfiniteMapError("Wrapped error", cause=cause)
        assert error.cause == cause

    def test_error_serialization(self):
        """Test error serialization."""
        error = InfiniteMapError(
            "Test error",
            code=ErrorCode.CORRUPTED_DATA,
            severity=ErrorSeverity.CRITICAL,
            recoverable=False
        )
        data = error.to_dict()

        assert data["message"] == "Test error"
        assert data["code"] == "E004"
        assert data["severity"] == "CRITICAL"
        assert data["recoverable"] is False


class TestCustomExceptions:
    """Tests for custom exception classes."""

    def test_file_not_found_error(self):
        """Test FileNotFoundError exception."""
        error = InfiniteMapFileNotFoundError("/path/to/file")
        assert error.code == ErrorCode.FILE_NOT_FOUND
        assert error.path == "/path/to/file"
        assert "/path/to/file" in str(error)

    def test_file_not_found_custom_message(self):
        """Test FileNotFoundError with custom message."""
        error = InfiniteMapFileNotFoundError("/path", message="Custom message")
        assert str(error) == "Custom message"

    def test_permission_denied_error(self):
        """Test PermissionDeniedError exception."""
        error = PermissionDeniedError("/secure/path", operation="write")
        assert error.code == ErrorCode.PERMISSION_DENIED
        assert error.path == "/secure/path"
        assert error.operation == "write"
        assert "write" in str(error)
        assert "/secure/path" in str(error)

    def test_corrupted_data_error(self):
        """Test CorruptedDataError exception."""
        error = CorruptedDataError("/data/file", details="checksum mismatch")
        assert error.code == ErrorCode.CORRUPTED_DATA
        assert error.severity == ErrorSeverity.CRITICAL
        assert error.details == "checksum mismatch"
        assert "checksum mismatch" in str(error)

    def test_cache_error(self):
        """Test CacheError exception."""
        error = CacheError("Cache miss", code=ErrorCode.CACHE_MISS)
        assert error.code == ErrorCode.CACHE_MISS
        assert error.severity == ErrorSeverity.WARNING

    def test_wal_error(self):
        """Test WALError exception."""
        error = WALError("WAL write failed", code=ErrorCode.WAL_WRITE_FAILED)
        assert error.code == ErrorCode.WAL_WRITE_FAILED
        assert error.severity == ErrorSeverity.ERROR


class TestRecoveryResult:
    """Tests for RecoveryResult dataclass."""

    def test_create_result(self):
        """Test creating a recovery result."""
        result = RecoveryResult(
            success=True,
            strategy=RecoveryStrategy.CLEAR_CACHE,
            message="Cache cleared successfully"
        )
        assert result.success is True
        assert result.attempts == 1

    def test_result_with_details(self):
        """Test result with full details."""
        result = RecoveryResult(
            success=True,
            strategy=RecoveryStrategy.RETRY,
            message="Retry successful",
            attempts=3,
            duration_ms=150.5,
            side_effects=["cache_invalidated", "retry_count_incremented"]
        )
        data = result.to_dict()

        assert data["success"] is True
        assert data["strategy"] == "RETRY"
        assert data["attempts"] == 3
        assert data["duration_ms"] == 150.5
        assert len(data["side_effects"]) == 2


class TestRecoveryManager:
    """Tests for RecoveryManager class."""

    def test_create_manager(self):
        """Test creating a recovery manager."""
        manager = RecoveryManager()
        assert manager.max_retries == 3
        assert len(manager.strategies) > 0

    def test_default_strategies(self):
        """Test default recovery strategies are registered."""
        manager = RecoveryManager()

        assert manager.get_strategy(ErrorCode.CACHE_MISS) == RecoveryStrategy.NONE
        assert manager.get_strategy(ErrorCode.CACHE_CORRUPTED) == RecoveryStrategy.CLEAR_CACHE
        assert manager.get_strategy(ErrorCode.CORRUPTED_DATA) == RecoveryStrategy.RESTORE_BACKUP
        assert manager.get_strategy(ErrorCode.TIMEOUT) == RecoveryStrategy.RETRY

    def test_register_strategy(self):
        """Test registering a custom strategy."""
        manager = RecoveryManager()
        manager.register_strategy(ErrorCode.FILE_NOT_FOUND, RecoveryStrategy.FALLBACK)

        assert manager.get_strategy(ErrorCode.FILE_NOT_FOUND) == RecoveryStrategy.FALLBACK

    def test_register_handler(self):
        """Test registering a custom handler."""
        manager = RecoveryManager()
        called = []

        def custom_handler(error):
            called.append(error)
            return True

        manager.register_handler(RecoveryStrategy.CLEAR_CACHE, custom_handler)

        # Create error record
        record = ErrorRecord(
            error_id="test",
            code=ErrorCode.CACHE_CORRUPTED,
            severity=ErrorSeverity.WARNING,
            message="Test",
            context=ErrorContext(timestamp=datetime.now(), operation="test"),
            exception_type="TestError",
            exception_message="Test",
            stack_trace=""
        )

        result = manager.execute_recovery(record)

        assert len(called) == 1
        assert result.success is True

    def test_execute_none_strategy(self):
        """Test executing NONE strategy."""
        manager = RecoveryManager()
        manager.register_strategy(ErrorCode.CACHE_MISS, RecoveryStrategy.NONE)

        record = ErrorRecord(
            error_id="test",
            code=ErrorCode.CACHE_MISS,
            severity=ErrorSeverity.INFO,
            message="Cache miss",
            context=ErrorContext(timestamp=datetime.now(), operation="read"),
            exception_type="CacheError",
            exception_message="Miss",
            stack_trace=""
        )

        result = manager.execute_recovery(record)

        assert result.success is False
        assert "No recovery strategy" in result.message

    def test_execute_retry_strategy(self):
        """Test executing RETRY strategy."""
        manager = RecoveryManager(max_retries=3)

        record = ErrorRecord(
            error_id="test",
            code=ErrorCode.TIMEOUT,
            severity=ErrorSeverity.WARNING,
            message="Timeout",
            context=ErrorContext(timestamp=datetime.now(), operation="api"),
            exception_type="TimeoutError",
            exception_message="Timed out",
            stack_trace=""
        )

        result = manager.execute_recovery(record)

        assert result.success is True
        assert result.strategy == RecoveryStrategy.RETRY

    def test_execute_builtin_strategies(self):
        """Test executing various built-in strategies."""
        manager = RecoveryManager()

        # Test each built-in strategy
        strategies_to_test = [
            (RecoveryStrategy.CLEAR_CACHE, "Cache cleared"),
            (RecoveryStrategy.REBUILD_CACHE, "Cache rebuilt"),
            (RecoveryStrategy.REINITIALIZE, "reinitialized"),
            (RecoveryStrategy.QUARANTINE, "quarantined"),
            (RecoveryStrategy.RESTORE_BACKUP, "backup"),
            (RecoveryStrategy.FALLBACK, "fallback"),
        ]

        for strategy, expected_text in strategies_to_test:
            manager.register_strategy(ErrorCode.INTERNAL_ERROR, strategy)

            record = ErrorRecord(
                error_id="test",
                code=ErrorCode.INTERNAL_ERROR,
                severity=ErrorSeverity.ERROR,
                message="Test",
                context=ErrorContext(timestamp=datetime.now(), operation="test"),
                exception_type="TestError",
                exception_message="Test",
                stack_trace=""
            )

            result = manager.execute_recovery(record)
            assert result.success is True
            assert expected_text.lower() in result.message.lower()

    def test_get_unknown_strategy(self):
        """Test getting strategy for unknown error code."""
        manager = RecoveryManager()

        # Create a mock error code that's not registered
        strategy = manager.get_strategy(ErrorCode.INTERNAL_ERROR)
        assert strategy == RecoveryStrategy.NONE


class TestErrorReporter:
    """Tests for ErrorReporter class."""

    def test_create_reporter(self):
        """Test creating an error reporter."""
        reporter = ErrorReporter()
        assert len(reporter.errors) == 0

    def test_record_error(self):
        """Test recording an error."""
        reporter = ErrorReporter()

        record = ErrorRecord(
            error_id="err_001",
            code=ErrorCode.FILE_NOT_FOUND,
            severity=ErrorSeverity.ERROR,
            message="File not found",
            context=ErrorContext(timestamp=datetime.now(), operation="read"),
            exception_type="FileNotFoundError",
            exception_message="Not found",
            stack_trace=""
        )

        reporter.record(record)

        assert len(reporter.errors) == 1
        assert reporter.error_counts[ErrorCode.FILE_NOT_FOUND] == 1

    def test_record_multiple_errors(self):
        """Test recording multiple errors."""
        reporter = ErrorReporter()

        for i in range(5):
            record = ErrorRecord(
                error_id=f"err_{i}",
                code=ErrorCode.CACHE_MISS,
                severity=ErrorSeverity.WARNING,
                message=f"Error {i}",
                context=ErrorContext(timestamp=datetime.now(), operation="test"),
                exception_type="CacheError",
                exception_message="Miss",
                stack_trace=""
            )
            reporter.record(record)

        assert len(reporter.errors) == 5
        assert reporter.error_counts[ErrorCode.CACHE_MISS] == 5

    def test_get_errors_with_filter(self):
        """Test getting errors with filters."""
        reporter = ErrorReporter()

        codes = [ErrorCode.FILE_NOT_FOUND, ErrorCode.CACHE_MISS, ErrorCode.FILE_NOT_FOUND]
        severities = [ErrorSeverity.ERROR, ErrorSeverity.WARNING, ErrorSeverity.ERROR]

        for i, (code, sev) in enumerate(zip(codes, severities)):
            record = ErrorRecord(
                error_id=f"err_{i}",
                code=code,
                severity=sev,
                message=f"Error {i}",
                context=ErrorContext(timestamp=datetime.now(), operation="test"),
                exception_type="TestError",
                exception_message="Test",
                stack_trace=""
            )
            reporter.record(record)

        # Filter by severity
        errors = reporter.get_errors(severity=ErrorSeverity.ERROR)
        assert len(errors) == 2

        # Filter by code
        errors = reporter.get_errors(code=ErrorCode.CACHE_MISS)
        assert len(errors) == 1

    def test_get_errors_resolved_filter(self):
        """Test filtering by resolved status."""
        reporter = ErrorReporter()

        for i in range(3):
            record = ErrorRecord(
                error_id=f"err_{i}",
                code=ErrorCode.INTERNAL_ERROR,
                severity=ErrorSeverity.ERROR,
                message=f"Error {i}",
                context=ErrorContext(timestamp=datetime.now(), operation="test"),
                exception_type="TestError",
                exception_message="Test",
                stack_trace="",
                resolved=(i == 0)
            )
            reporter.record(record)

        unresolved = reporter.get_errors(resolved=False)
        assert len(unresolved) == 2

        resolved = reporter.get_errors(resolved=True)
        assert len(resolved) == 1

    def test_get_stats(self):
        """Test getting error statistics."""
        reporter = ErrorReporter()

        codes = [ErrorCode.FILE_NOT_FOUND, ErrorCode.FILE_NOT_FOUND, ErrorCode.CACHE_MISS]
        severities = [ErrorSeverity.ERROR, ErrorSeverity.ERROR, ErrorSeverity.WARNING]

        for i, (code, sev) in enumerate(zip(codes, severities)):
            record = ErrorRecord(
                error_id=f"err_{i}",
                code=code,
                severity=sev,
                message=f"Error {i}",
                context=ErrorContext(timestamp=datetime.now(), operation="test"),
                exception_type="TestError",
                exception_message="Test",
                stack_trace=""
            )
            reporter.record(record)

        stats = reporter.get_stats()

        assert stats["total_errors"] == 3
        assert stats["unresolved"] == 3
        assert stats["by_severity"]["ERROR"] == 2
        assert stats["by_severity"]["WARNING"] == 1
        assert stats["by_code"]["E001"] == 2
        assert stats["by_code"]["C001"] == 1

    def test_resolve_error(self):
        """Test resolving an error."""
        reporter = ErrorReporter()

        record = ErrorRecord(
            error_id="err_001",
            code=ErrorCode.INTERNAL_ERROR,
            severity=ErrorSeverity.ERROR,
            message="Test",
            context=ErrorContext(timestamp=datetime.now(), operation="test"),
            exception_type="TestError",
            exception_message="Test",
            stack_trace=""
        )
        reporter.record(record)

        result = reporter.resolve("err_001")

        assert result is True
        assert record.resolved is True
        assert record.resolved_at is not None

    def test_resolve_nonexistent(self):
        """Test resolving nonexistent error."""
        reporter = ErrorReporter()
        result = reporter.resolve("nonexistent")
        assert result is False

    def test_clear_resolved(self):
        """Test clearing resolved errors."""
        reporter = ErrorReporter()

        for i in range(5):
            record = ErrorRecord(
                error_id=f"err_{i}",
                code=ErrorCode.INTERNAL_ERROR,
                severity=ErrorSeverity.ERROR,
                message=f"Error {i}",
                context=ErrorContext(timestamp=datetime.now(), operation="test"),
                exception_type="TestError",
                exception_message="Test",
                stack_trace="",
                resolved=(i < 2)
            )
            reporter.record(record)

        cleared = reporter.clear_resolved()

        assert cleared == 2
        assert len(reporter.errors) == 3

    def test_max_errors_limit(self):
        """Test max errors limit."""
        reporter = ErrorReporter(max_errors=10)

        for i in range(20):
            record = ErrorRecord(
                error_id=f"err_{i}",
                code=ErrorCode.INTERNAL_ERROR,
                severity=ErrorSeverity.ERROR,
                message=f"Error {i}",
                context=ErrorContext(timestamp=datetime.now(), operation="test"),
                exception_type="TestError",
                exception_message="Test",
                stack_trace=""
            )
            reporter.record(record)

        assert len(reporter.errors) == 10

    def test_retention_hours(self):
        """Test retention hours."""
        reporter = ErrorReporter(retention_hours=1)

        # Add old error
        old_record = ErrorRecord(
            error_id="old",
            code=ErrorCode.INTERNAL_ERROR,
            severity=ErrorSeverity.ERROR,
            message="Old error",
            context=ErrorContext(
                timestamp=datetime.now() - timedelta(hours=2),
                operation="test"
            ),
            exception_type="TestError",
            exception_message="Test",
            stack_trace=""
        )
        reporter.errors.append(old_record)

        # Add new error (triggers cleanup)
        new_record = ErrorRecord(
            error_id="new",
            code=ErrorCode.INTERNAL_ERROR,
            severity=ErrorSeverity.ERROR,
            message="New error",
            context=ErrorContext(timestamp=datetime.now(), operation="test"),
            exception_type="TestError",
            exception_message="Test",
            stack_trace=""
        )
        reporter.record(new_record)

        assert len(reporter.errors) == 1
        assert reporter.errors[0].error_id == "new"


class TestErrorHandler:
    """Tests for ErrorHandler class."""

    def test_create_handler(self):
        """Test creating an error handler."""
        handler = ErrorHandler()
        assert handler.reporter is not None
        assert handler.recovery_manager is not None

    def test_handle_exception(self):
        """Test handling an exception."""
        handler = ErrorHandler()

        try:
            raise ValueError("Test error")
        except Exception as e:
            record, recovery = handler.handle(e, operation="test")

        assert record.error_id.startswith("err_")
        assert record.code == ErrorCode.INTERNAL_ERROR
        assert record.exception_type == "ValueError"

    def test_handle_infinite_map_error(self):
        """Test handling InfiniteMapError."""
        handler = ErrorHandler()

        error = InfiniteMapFileNotFoundError("/test/path")
        record, recovery = handler.handle(error, operation="read")

        assert record.code == ErrorCode.FILE_NOT_FOUND
        assert record.severity == ErrorSeverity.ERROR
        assert "/test/path" in record.message

    def test_handle_with_context(self):
        """Test handling with context."""
        handler = ErrorHandler()

        error = ValueError("Test")
        record, recovery = handler.handle(
            error,
            operation="write",
            context={"path": "/file", "user": "testuser"}
        )

        assert record.context.path == "/file"
        assert record.context.extra["user"] == "testuser"

    def test_handle_with_recovery(self):
        """Test handling with recovery attempt."""
        handler = ErrorHandler()

        error = CacheError("Cache corrupted", code=ErrorCode.CACHE_CORRUPTED)
        record, recovery = handler.handle(error, operation="cache", attempt_recovery=True)

        assert record.recovery_attempted is True
        assert recovery is not None
        assert recovery.strategy == RecoveryStrategy.CLEAR_CACHE

    def test_handle_without_recovery(self):
        """Test handling without recovery attempt."""
        handler = ErrorHandler()

        error = ValueError("Test")
        record, recovery = handler.handle(error, operation="test", attempt_recovery=False)

        assert record.recovery_attempted is False
        assert recovery is None

    def test_get_errors(self):
        """Test getting errors from handler."""
        handler = ErrorHandler()

        for i in range(3):
            error = ValueError(f"Error {i}")
            handler.handle(error, operation="test")

        errors = handler.get_errors()
        assert len(errors) == 3

    def test_get_stats(self):
        """Test getting statistics from handler."""
        handler = ErrorHandler()

        for i in range(5):
            error = ValueError(f"Error {i}")
            handler.handle(error, operation="test")

        stats = handler.get_stats()
        assert stats["total_errors"] == 5

    def test_resolve(self):
        """Test resolving error through handler."""
        handler = ErrorHandler()

        error = ValueError("Test")
        record, _ = handler.handle(error, operation="test")

        result = handler.resolve(record.error_id)
        assert result is True

    def test_register_strategy(self):
        """Test registering strategy through handler."""
        handler = ErrorHandler()

        handler.register_strategy(ErrorCode.FILE_NOT_FOUND, RecoveryStrategy.FALLBACK)

        strategy = handler.recovery_manager.get_strategy(ErrorCode.FILE_NOT_FOUND)
        assert strategy == RecoveryStrategy.FALLBACK

    def test_register_handler(self):
        """Test registering custom handler through handler."""
        handler = ErrorHandler()
        called = []

        def custom_handler(error):
            called.append(error)
            return True

        handler.register_handler(RecoveryStrategy.CLEAR_CACHE, custom_handler)

        error = CacheError("Cache corrupted", code=ErrorCode.CACHE_CORRUPTED)
        handler.handle(error, operation="test", attempt_recovery=True)

        # Handler should have been called
        assert len(called) >= 1

    def test_error_id_incrementing(self):
        """Test that error IDs increment."""
        handler = ErrorHandler()

        ids = []
        for _ in range(5):
            error = ValueError("Test")
            record, _ = handler.handle(error, operation="test")
            ids.append(record.error_id)

        # IDs should be unique
        assert len(set(ids)) == 5


class TestHandleErrorFunction:
    """Tests for handle_error convenience function."""

    def test_handle_error_function(self):
        """Test handle_error convenience function."""
        error = ValueError("Test error")
        record, recovery = handle_error(error, operation="test", path="/file")

        assert record.error_id.startswith("err_")
        assert record.context.path == "/file"


class TestThreadSafety:
    """Tests for thread safety."""

    def test_concurrent_error_recording(self):
        """Test concurrent error recording."""
        reporter = ErrorReporter()
        errors = []

        def record_errors(start):
            for i in range(start, start + 100):
                record = ErrorRecord(
                    error_id=f"err_{i}",
                    code=ErrorCode.INTERNAL_ERROR,
                    severity=ErrorSeverity.ERROR,
                    message=f"Error {i}",
                    context=ErrorContext(timestamp=datetime.now(), operation="test"),
                    exception_type="TestError",
                    exception_message="Test",
                    stack_trace=""
                )
                try:
                    reporter.record(record)
                except Exception as e:
                    errors.append(e)

        threads = [threading.Thread(target=record_errors, args=(i * 100,)) for i in range(3)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0

    def test_concurrent_handler_operations(self):
        """Test concurrent handler operations."""
        handler = ErrorHandler()
        errors = []

        def handle_errors(start):
            for i in range(start, start + 50):
                try:
                    error = ValueError(f"Error {i}")
                    handler.handle(error, operation="test")
                except Exception as e:
                    errors.append(e)

        threads = [threading.Thread(target=handle_errors, args=(i * 50,)) for i in range(4)]
        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        stats = handler.get_stats()
        assert stats["total_errors"] == 200


class TestIntegration:
    """Integration tests for the error handling system."""

    def test_full_error_workflow(self):
        """Test complete error handling workflow."""
        handler = ErrorHandler()

        # Register custom strategy
        handler.register_strategy(ErrorCode.FILE_NOT_FOUND, RecoveryStrategy.FALLBACK)

        # Handle various errors
        errors_to_handle = [
            (ValueError("Generic error"), "generic"),
            (InfiniteMapFileNotFoundError("/missing/file"), "read"),
            (CacheError("Cache miss"), "cache"),
            (PermissionDeniedError("/secure", "write"), "write"),
        ]

        error_ids = []
        for error, operation in errors_to_handle:
            record, recovery = handler.handle(error, operation=operation)
            error_ids.append(record.error_id)

        # Get statistics
        stats = handler.get_stats()
        assert stats["total_errors"] == 4

        # Resolve some errors
        handler.resolve(error_ids[0])
        handler.resolve(error_ids[2])

        # Get unresolved
        unresolved = handler.get_errors(resolved=False)
        assert len(unresolved) == 2

        # Clear resolved
        cleared = handler.reporter.clear_resolved()
        assert cleared == 2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
