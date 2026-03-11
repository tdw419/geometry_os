"""
IntegrationTestClass Module

Provides a reusable base class for integration testing across Geometry OS systems.
Supports setup/teardown lifecycle, assertion helpers, and result aggregation.
"""

import logging
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from typing import Any

try:
    import structlog
    HAS_STRUCTLOG = True
except ImportError:
    HAS_STRUCTLOG = False


@dataclass
class IntegrationTestResult:
    """Result of a single integration test."""
    name: str
    success: bool
    duration_ms: float
    message: str = ""
    error: Exception | None = None
    details: dict[str, Any] = field(default_factory=dict)


@dataclass
class IntegrationTestSuiteResult:
    """Result of running a suite of integration tests."""
    suite_name: str
    total: int = 0
    passed: int = 0
    failed: int = 0
    skipped: int = 0
    duration_ms: float = 0.0
    results: list[IntegrationTestResult] = field(default_factory=list)

    @property
    def success_rate(self) -> float:
        if self.total == 0:
            return 0.0
        return (self.passed / self.total) * 100


class IntegrationTestClass:
    """
    Base class for integration testing across Geometry OS systems.

    Features:
    - Setup/teardown lifecycle hooks
    - Assertion helpers with detailed error messages
    - Result aggregation and reporting
    - Timeout handling
    - Resource cleanup tracking

    Usage:
        class MyIntegrationTest(IntegrationTestClass):
            def test_something(self):
                self.assert_true(condition, "Something should work")
                return {"key": "value"}

            def run_tests(self):
                self.run_test("test_something", self.test_something)
                return self.get_results()
    """

    def __init__(self, suite_name: str = "IntegrationTests", timeout: int = 60):
        """Initialize integration test class."""
        self.suite_name = suite_name
        self.timeout = timeout
        self._results: list[IntegrationTestResult] = []
        self._setup_complete = False

        # Setup logging
        if HAS_STRUCTLOG:
            self.logger = structlog.get_logger()
        else:
            self.logger = logging.getLogger(self.__class__.__name__)

    def setup(self) -> bool:
        """
        Run setup before tests. Override in subclasses.

        Returns:
            True if setup succeeded, False otherwise
        """
        self._setup_complete = True
        return True

    def teardown(self) -> None:
        """
        Run teardown after tests. Override in subclasses.
        """
        self._setup_complete = False

    def execute(self, *args, **kwargs) -> IntegrationTestSuiteResult:
        """
        Execute the integration test suite.

        Override run_tests() in subclasses to define test cases.

        Returns:
            IntegrationTestSuiteResult with all test results
        """
        start_time = time.time()

        try:
            # Run setup
            if not self.setup():
                self.logger.error("Setup failed")
                return IntegrationTestSuiteResult(
                    suite_name=self.suite_name,
                    total=1,
                    failed=1,
                    duration_ms=(time.time() - start_time) * 1000,
                    results=[IntegrationTestResult(
                        name="setup",
                        success=False,
                        duration_ms=0,
                        message="Setup failed"
                    )]
                )

            # Run tests (override in subclass)
            self.run_tests(*args, **kwargs)

        finally:
            # Always run teardown
            self.teardown()

        # Aggregate results
        total_duration = (time.time() - start_time) * 1000
        passed = sum(1 for r in self._results if r.success)
        failed = sum(1 for r in self._results if not r.success)

        return IntegrationTestSuiteResult(
            suite_name=self.suite_name,
            total=len(self._results),
            passed=passed,
            failed=failed,
            duration_ms=total_duration,
            results=self._results
        )

    def run_tests(self, *args, **kwargs) -> None:
        """
        Override this method to define test cases.

        Example:
            def run_tests(self):
                self.run_test("test_connection", self.test_connection)
                self.run_test("test_data_flow", self.test_data_flow)
        """
        raise NotImplementedError("Override run_tests() to define test cases")

    def run_test(self, name: str, test_func: Callable, *args, **kwargs) -> IntegrationTestResult:
        """
        Run a single test and record the result.

        Args:
            name: Test name
            test_func: Test function to execute
            *args, **kwargs: Arguments to pass to test function

        Returns:
            IntegrationTestResult
        """
        start_time = time.time()
        self.logger.info(f"Running test: {name}")

        try:
            result_data = test_func(*args, **kwargs)
            duration = (time.time() - start_time) * 1000

            test_result = IntegrationTestResult(
                name=name,
                success=True,
                duration_ms=duration,
                message="Passed",
                details=result_data if isinstance(result_data, dict) else {}
            )
            self.logger.info(f"Test passed: {name} ({duration:.1f}ms)")

        except AssertionError as e:
            duration = (time.time() - start_time) * 1000
            test_result = IntegrationTestResult(
                name=name,
                success=False,
                duration_ms=duration,
                message=str(e),
                error=e
            )
            self.logger.error(f"Test failed: {name} - {e}")

        except Exception as e:
            duration = (time.time() - start_time) * 1000
            test_result = IntegrationTestResult(
                name=name,
                success=False,
                duration_ms=duration,
                message=f"Exception: {e}",
                error=e
            )
            self.logger.error(f"Test error: {name} - {e}")

        self._results.append(test_result)
        return test_result

    # Assertion helpers
    def assert_true(self, condition: bool, message: str = "Assertion failed") -> None:
        """Assert condition is True."""
        if not condition:
            raise AssertionError(message)

    def assert_false(self, condition: bool, message: str = "Expected False") -> None:
        """Assert condition is False."""
        if condition:
            raise AssertionError(message)

    def assert_equal(self, actual: Any, expected: Any, message: str = "") -> None:
        """Assert actual equals expected."""
        if actual != expected:
            msg = f"Expected {expected!r}, got {actual!r}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_not_equal(self, actual: Any, expected: Any, message: str = "") -> None:
        """Assert actual does not equal expected."""
        if actual == expected:
            msg = f"Expected value different from {expected!r}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_in(self, item: Any, container: Any, message: str = "") -> None:
        """Assert item is in container."""
        if item not in container:
            msg = f"{item!r} not found in {container!r}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_not_in(self, item: Any, container: Any, message: str = "") -> None:
        """Assert item is not in container."""
        if item in container:
            msg = f"{item!r} should not be in {container!r}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_is_instance(self, obj: Any, cls: type, message: str = "") -> None:
        """Assert object is instance of class."""
        if not isinstance(obj, cls):
            msg = f"Expected {cls.__name__}, got {type(obj).__name__}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def get_results(self) -> list[IntegrationTestResult]:
        """Get all test results."""
        return self._results.copy()

    def get_summary(self) -> str:
        """Get a summary string of test results."""
        passed = sum(1 for r in self._results if r.success)
        total = len(self._results)
        if total == 0:
            return "No tests run"
        return f"{passed}/{total} tests passed ({(passed/total*100):.1f}%)"
