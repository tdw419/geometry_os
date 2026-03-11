#!/usr/bin/env python3
"""
Load Testing Script for Async Authentication System

This script performs load testing under simulated high user loads to verify
the async authentication implementation's responsiveness and scalability.

Usage:
    python load_test_auth_async.py [--users N] [--requests N] [--concurrent N]

Metrics reported:
    - Requests per second (throughput)
    - Average latency
    - P50, P95, P99 latency percentiles
    - Error rate
    - Memory usage
"""

import argparse
import asyncio
import gc
import json
import os
import statistics
import sys
import tempfile
import time
import traceback
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.pixel_compiler.auth.cli_auth_async import (
    AsyncAuthContext,
    get_auth_context,
    reset_auth_context,
)
from systems.pixel_compiler.auth.api_keys_async import AsyncAPIKeyManager, ResourceType, Action
from systems.pixel_compiler.auth.rate_limiter_async import AsyncRateLimiter


@dataclass
class LoadTestConfig:
    """Configuration for load testing."""
    num_users: int = 100
    requests_per_user: int = 10
    concurrent_requests: int = 50
    test_duration_seconds: float = 10.0
    ramp_up_seconds: float = 2.0
    report_interval: float = 1.0


@dataclass
class RequestMetrics:
    """Metrics for a single request."""
    start_time: float
    end_time: float
    success: bool
    error: Optional[str] = None
    operation: str = ""

    @property
    def latency_ms(self) -> float:
        return (self.end_time - self.start_time) * 1000


@dataclass
class LoadTestResults:
    """Results from a load test."""
    config: LoadTestConfig
    total_requests: int = 0
    successful_requests: int = 0
    failed_requests: int = 0
    latencies: list[float] = field(default_factory=list)
    errors: list[str] = field(default_factory=list)
    start_time: float = 0.0
    end_time: float = 0.0
    peak_concurrent: int = 0

    @property
    def duration_seconds(self) -> float:
        return self.end_time - self.start_time

    @property
    def requests_per_second(self) -> float:
        if self.duration_seconds == 0:
            return 0
        return self.total_requests / self.duration_seconds

    @property
    def error_rate(self) -> float:
        if self.total_requests == 0:
            return 0
        return self.failed_requests / self.total_requests

    @property
    def avg_latency_ms(self) -> float:
        if not self.latencies:
            return 0
        return statistics.mean(self.latencies)

    @property
    def p50_latency_ms(self) -> float:
        if not self.latencies:
            return 0
        return statistics.median(self.latencies)

    @property
    def p95_latency_ms(self) -> float:
        if len(self.latencies) < 20:
            return self.avg_latency_ms
        return statistics.quantiles(self.latencies, n=20)[18]  # 95th percentile

    @property
    def p99_latency_ms(self) -> float:
        if len(self.latencies) < 100:
            return self.avg_latency_ms
        return statistics.quantiles(self.latencies, n=100)[98]  # 99th percentile

    def to_dict(self) -> dict:
        return {
            "config": {
                "num_users": self.config.num_users,
                "requests_per_user": self.config.requests_per_user,
                "concurrent_requests": self.config.concurrent_requests,
                "test_duration_seconds": self.config.test_duration_seconds,
            },
            "results": {
                "total_requests": self.total_requests,
                "successful_requests": self.successful_requests,
                "failed_requests": self.failed_requests,
                "duration_seconds": round(self.duration_seconds, 3),
                "requests_per_second": round(self.requests_per_second, 2),
                "error_rate": round(self.error_rate, 4),
                "avg_latency_ms": round(self.avg_latency_ms, 3),
                "p50_latency_ms": round(self.p50_latency_ms, 3),
                "p95_latency_ms": round(self.p95_latency_ms, 3),
                "p99_latency_ms": round(self.p99_latency_ms, 3),
                "peak_concurrent": self.peak_concurrent,
            }
        }


class LoadTestRunner:
    """Runs load tests against the async auth system."""

    def __init__(self, config: LoadTestConfig):
        self.config = config
        self.results = LoadTestResults(config=config)
        self._current_concurrent = 0
        self._concurrent_lock = asyncio.Lock()

        # Test components
        self.temp_dir = tempfile.mkdtemp()
        self.auth_context: Optional[AsyncAuthContext] = None
        self.api_key_manager: Optional[AsyncAPIKeyManager] = None
        self.rate_limiter: Optional[AsyncRateLimiter] = None

        # Pre-created test data
        self.test_users: list[dict] = []
        self.test_tokens: dict[str, str] = {}
        self.test_api_keys: dict[str, str] = {}

    async def setup(self):
        """Set up test environment."""
        print("Setting up load test environment...")

        # Initialize components
        self.auth_context = AsyncAuthContext(config_dir=self.temp_dir)
        self.api_key_manager = AsyncAPIKeyManager()
        self.rate_limiter = AsyncRateLimiter(window_size=60.0)

        # Create test users
        print(f"Creating {self.config.num_users} test users...")
        for i in range(self.config.num_users):
            username = f"loadtest_user_{i}"
            email = f"loadtest{i}@example.com"
            password = f"Password{i}!"

            await self.auth_context.create_user(
                username=username,
                email=email,
                password=password,
                roles=["operator"]
            )

            # Store for later
            self.test_users.append({
                "username": username,
                "email": email,
                "password": password
            })

            # Login and store token
            token = await self.auth_context.login(username, password)
            self.test_tokens[username] = token

            # Create API key
            key_id, api_key = await self.api_key_manager.create_key(
                name=f"Load Test Key {i}",
                user_id=username,
                rate_limit=1000
            )
            self.test_api_keys[username] = api_key

            if (i + 1) % 100 == 0:
                print(f"  Created {i + 1} users...")

        print(f"Setup complete. {len(self.test_users)} users ready.")

    async def teardown(self):
        """Clean up test environment."""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)
        print("Test environment cleaned up.")

    async def _record_concurrent_start(self):
        async with self._concurrent_lock:
            self._current_concurrent += 1
            if self._current_concurrent > self.results.peak_concurrent:
                self.results.peak_concurrent = self._current_concurrent

    async def _record_concurrent_end(self):
        async with self._concurrent_lock:
            self._current_concurrent -= 1

    async def _simulate_user_session(self, user_index: int) -> list[RequestMetrics]:
        """Simulate a user session with multiple requests."""
        metrics = []
        user = self.test_users[user_index]
        token = self.test_tokens[user["username"]]
        api_key = self.test_api_keys[user["username"]]

        for _ in range(self.config.requests_per_user):
            # Choose random operation
            operation_type = hash(str(time.time()) + str(user_index)) % 5

            start = time.time()
            success = False
            error = None
            operation = ""

            try:
                if operation_type == 0:
                    # Login operation
                    operation = "login"
                    new_token = await self.auth_context.login(
                        user["username"],
                        user["password"]
                    )
                    success = new_token is not None

                elif operation_type == 1:
                    # Get current user
                    operation = "get_current_user"
                    current_user = await self.auth_context.get_current_user(token)
                    success = current_user is not None

                elif operation_type == 2:
                    # Validate API key
                    operation = "validate_api_key"
                    api_key_obj = await self.api_key_manager.validate_key(api_key)
                    success = api_key_obj is not None

                elif operation_type == 3:
                    # Check permission
                    operation = "check_permission"
                    has_perm = await self.api_key_manager.check_permission(
                        api_key,
                        ResourceType.RTS,
                        Action.READ
                    )
                    success = True  # Permission check always succeeds

                else:
                    # Rate limit check
                    operation = "rate_limit_check"
                    allowed, _ = await self.rate_limiter.check_rate_limit(
                        user["username"],
                        max_requests=1000
                    )
                    success = True  # Rate limit check always succeeds

            except Exception as e:
                error = str(e)
                success = False

            end = time.time()
            metrics.append(RequestMetrics(
                start_time=start,
                end_time=end,
                success=success,
                error=error,
                operation=operation
            ))

            # Small delay between requests
            await asyncio.sleep(0.001)

        return metrics

    async def _worker(self, user_indices: list[int], results_queue: asyncio.Queue):
        """Worker that processes user sessions."""
        for user_index in user_indices:
            await self._record_concurrent_start()
            try:
                metrics = await self._simulate_user_session(user_index)
                await results_queue.put(metrics)
            finally:
                await self._record_concurrent_end()

    async def run(self) -> LoadTestResults:
        """Run the load test."""
        print(f"\nStarting load test...")
        print(f"  Users: {self.config.num_users}")
        print(f"  Requests per user: {self.config.requests_per_user}")
        print(f"  Target concurrent requests: {self.config.concurrent_requests}")
        print(f"  Expected total requests: {self.config.num_users * self.config.requests_per_user}")
        print()

        self.results.start_time = time.time()

        # Create queue for results
        results_queue: asyncio.Queue = asyncio.Queue()

        # Distribute users across workers
        user_indices = list(range(self.config.num_users))
        workers = []
        batch_size = max(1, self.config.num_users // self.config.concurrent_requests)

        for i in range(0, len(user_indices), batch_size):
            batch = user_indices[i:i + batch_size]
            workers.append(self._worker(batch, results_queue))

        # Start reporting task
        report_task = asyncio.create_task(self._report_progress())

        # Run all workers
        await asyncio.gather(*workers)

        # Stop reporting
        report_task.cancel()
        try:
            await report_task
        except asyncio.CancelledError:
            pass

        # Collect results
        while not results_queue.empty():
            metrics_list = await results_queue.get()
            for m in metrics_list:
                self.results.total_requests += 1
                if m.success:
                    self.results.successful_requests += 1
                else:
                    self.results.failed_requests += 1
                    if m.error:
                        self.results.errors.append(m.error)
                self.results.latencies.append(m.latency_ms)

        self.results.end_time = time.time()
        return self.results

    async def _report_progress(self):
        """Periodically report progress."""
        last_count = 0
        last_time = time.time()

        while True:
            await asyncio.sleep(self.config.report_interval)

            current_count = self.results.total_requests
            current_time = time.time()

            if current_count > last_count:
                rate = (current_count - last_count) / (current_time - last_time)
                print(f"  Progress: {current_count} requests, {rate:.1f} req/s, "
                      f"{self._current_concurrent} concurrent")

            last_count = current_count
            last_time = current_time


def print_results(results: LoadTestResults):
    """Print load test results."""
    print("\n" + "=" * 60)
    print("LOAD TEST RESULTS")
    print("=" * 60)

    r = results.to_dict()["results"]

    print(f"\nThroughput:")
    print(f"  Total requests:    {r['total_requests']:,}")
    print(f"  Successful:        {results.successful_requests:,}")
    print(f"  Failed:            {results.failed_requests:,}")
    print(f"  Duration:          {r['duration_seconds']:.2f}s")
    print(f"  Requests/sec:      {r['requests_per_second']:,.2f}")
    print(f"  Error rate:        {r['error_rate']:.2%}")

    print(f"\nLatency:")
    print(f"  Average:           {r['avg_latency_ms']:.3f}ms")
    print(f"  P50 (median):      {r['p50_latency_ms']:.3f}ms")
    print(f"  P95:               {r['p95_latency_ms']:.3f}ms")
    print(f"  P99:               {r['p99_latency_ms']:.3f}ms")

    print(f"\nConcurrency:")
    print(f"  Peak concurrent:   {r['peak_concurrent']}")

    if results.errors:
        print(f"\nErrors (first 5):")
        for error in results.errors[:5]:
            print(f"  - {error[:100]}")

    print("\n" + "=" * 60)

    # Performance assessment
    print("\nPERFORMANCE ASSESSMENT:")

    if r['requests_per_second'] >= 1000:
        print("  ✓ Excellent throughput (>= 1000 req/s)")
    elif r['requests_per_second'] >= 500:
        print("  ✓ Good throughput (>= 500 req/s)")
    elif r['requests_per_second'] >= 100:
        print("  ⚠ Moderate throughput (>= 100 req/s)")
    else:
        print("  ✗ Low throughput (< 100 req/s)")

    if r['avg_latency_ms'] <= 10:
        print("  ✓ Excellent latency (<= 10ms)")
    elif r['avg_latency_ms'] <= 50:
        print("  ✓ Good latency (<= 50ms)")
    elif r['avg_latency_ms'] <= 100:
        print("  ⚠ Moderate latency (<= 100ms)")
    else:
        print("  ✗ High latency (> 100ms)")

    if r['error_rate'] == 0:
        print("  ✓ No errors")
    elif r['error_rate'] <= 0.01:
        print("  ⚠ Low error rate (<= 1%)")
    else:
        print("  ✗ High error rate (> 1%)")

    print("=" * 60 + "\n")


async def compare_sync_vs_async(config: LoadTestConfig):
    """Compare sync vs async performance."""
    print("\n" + "=" * 60)
    print("SYNC VS ASYNC COMPARISON")
    print("=" * 60)

    # We'll use the async implementation's sync wrapper for comparison
    from systems.pixel_compiler.auth.cli_auth_async import SyncAuthContextWrapper

    temp_dir = tempfile.mkdtemp()

    try:
        # Test sync performance
        print("\nTesting synchronous authentication...")
        async_ctx = AsyncAuthContext(config_dir=temp_dir)
        sync_wrapper = SyncAuthContextWrapper(async_ctx)

        start = time.time()
        for i in range(min(100, config.num_users)):
            username = f"sync_user_{i}"
            sync_wrapper.create_user(username, f"sync{i}@example.com", "Password123!", ["operator"])
            sync_wrapper.login(username, "Password123!")
        sync_time = time.time() - start

        print(f"  Sync time for 100 users: {sync_time:.3f}s")

        # Test async performance
        print("\nTesting asynchronous authentication...")
        async_ctx2 = AsyncAuthContext(config_dir=temp_dir + "_async")

        start = time.time()
        tasks = []
        for i in range(min(100, config.num_users)):
            username = f"async_user_{i}"
            tasks.append(async_ctx2.create_user(username, f"async{i}@example.com", "Password123!", ["operator"]))
        await asyncio.gather(*tasks)

        tasks = []
        for i in range(min(100, config.num_users)):
            username = f"async_user_{i}"
            tasks.append(async_ctx2.login(username, "Password123!"))
        await asyncio.gather(*tasks)
        async_time = time.time() - start

        print(f"  Async time for 100 users: {async_time:.3f}s")

        speedup = sync_time / async_time if async_time > 0 else 0
        print(f"\n  Speedup: {speedup:.2f}x")

        if speedup > 1.5:
            print("  ✓ Async is significantly faster")
        elif speedup > 1.0:
            print("  ✓ Async is faster")
        else:
            print("  ⚠ Async may need optimization")

    finally:
        import shutil
        shutil.rmtree(temp_dir, ignore_errors=True)
        shutil.rmtree(temp_dir + "_async", ignore_errors=True)


async def main():
    parser = argparse.ArgumentParser(description="Load test async authentication")
    parser.add_argument("--users", type=int, default=100, help="Number of test users")
    parser.add_argument("--requests", type=int, default=10, help="Requests per user")
    parser.add_argument("--concurrent", type=int, default=50, help="Concurrent requests")
    parser.add_argument("--duration", type=float, default=10.0, help="Test duration in seconds")
    parser.add_argument("--compare", action="store_true", help="Compare sync vs async")
    parser.add_argument("--output", type=str, help="Output file for results JSON")

    args = parser.parse_args()

    config = LoadTestConfig(
        num_users=args.users,
        requests_per_user=args.requests,
        concurrent_requests=args.concurrent,
        test_duration_seconds=args.duration
    )

    # Run comparison if requested
    if args.compare:
        await compare_sync_vs_async(config)

    # Run main load test
    runner = LoadTestRunner(config)

    try:
        await runner.setup()
        results = await runner.run()
        print_results(results)

        # Save results if output specified
        if args.output:
            with open(args.output, 'w') as f:
                json.dump(results.to_dict(), f, indent=2)
            print(f"Results saved to {args.output}")

    finally:
        await runner.teardown()


if __name__ == "__main__":
    asyncio.run(main())
