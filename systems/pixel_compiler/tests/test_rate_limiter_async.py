"""
Tests for Async Rate Limiter Module (rate_limiter_async.py)
"""

import asyncio
import time

import pytest

from systems.pixel_compiler.auth.rate_limiter_async import (
    AsyncRateLimiter,
    RateLimitStatus,
    RateLimitExceeded,
)


class TestAsyncRateLimiter:
    """Test AsyncRateLimiter class."""

    @pytest.fixture
    def limiter(self):
        """Create an AsyncRateLimiter instance."""
        return AsyncRateLimiter(window_size=1.0)  # 1 second window for faster tests

    @pytest.mark.asyncio
    async def test_check_rate_limit_allows_requests(self, limiter):
        """Test that rate limiter allows requests under limit."""
        client_id = "client1"

        for i in range(5):
            allowed, status = await limiter.check_rate_limit(client_id, max_requests=10)
            assert allowed is True
            assert status.remaining == 10 - i - 1

    @pytest.mark.asyncio
    async def test_check_rate_limit_blocks_over_limit(self, limiter):
        """Test that rate limiter blocks requests over limit."""
        client_id = "client1"

        # Use up all requests
        for i in range(5):
            await limiter.check_rate_limit(client_id, max_requests=5)

        # Next request should be blocked
        allowed, status = await limiter.check_rate_limit(client_id, max_requests=5)
        assert allowed is False
        assert status.remaining == 0

    @pytest.mark.asyncio
    async def test_check_rate_limit_or_raise(self, limiter):
        """Test rate limit check that raises on exceeded."""
        client_id = "client1"

        # Use up all requests
        for i in range(5):
            await limiter.check_rate_limit_or_raise(client_id, max_requests=5)

        # Next should raise
        with pytest.raises(RateLimitExceeded):
            await limiter.check_rate_limit_or_raise(client_id, max_requests=5)

    @pytest.mark.asyncio
    async def test_window_resets(self, limiter):
        """Test that rate limit resets after window expires."""
        client_id = "client1"

        # Use up all requests
        for i in range(5):
            await limiter.check_rate_limit(client_id, max_requests=5)

        # Wait for window to reset
        await asyncio.sleep(1.1)

        # Should be allowed again
        allowed, status = await limiter.check_rate_limit(client_id, max_requests=5)
        assert allowed is True

    @pytest.mark.asyncio
    async def test_get_status_without_increment(self, limiter):
        """Test getting status without incrementing counter."""
        client_id = "client1"

        # Make some requests
        for i in range(3):
            await limiter.check_rate_limit(client_id, max_requests=10)

        # Get status (should not increment)
        status = await limiter.get_status(client_id, max_requests=10)
        assert status.remaining == 7

        # Get status again (should still be 7)
        status = await limiter.get_status(client_id, max_requests=10)
        assert status.remaining == 7

    @pytest.mark.asyncio
    async def test_reset_client(self, limiter):
        """Test resetting a client's rate limit."""
        client_id = "client1"

        # Use up requests
        for i in range(5):
            await limiter.check_rate_limit(client_id, max_requests=5)

        # Reset
        await limiter.reset(client_id)

        # Should be allowed again
        allowed, status = await limiter.check_rate_limit(client_id, max_requests=5)
        assert allowed is True

    @pytest.mark.asyncio
    async def test_reset_all(self, limiter):
        """Test resetting all rate limits."""
        # Use up requests for multiple clients
        for i in range(5):
            await limiter.check_rate_limit("client1", max_requests=5)
            await limiter.check_rate_limit("client2", max_requests=5)

        # Reset all
        await limiter.reset_all()

        # Both should be allowed
        allowed1, _ = await limiter.check_rate_limit("client1", max_requests=5)
        allowed2, _ = await limiter.check_rate_limit("client2", max_requests=5)
        assert allowed1 is True
        assert allowed2 is True

    @pytest.mark.asyncio
    async def test_cleanup(self, limiter):
        """Test cleanup of inactive clients."""
        # Make request for client1
        await limiter.check_rate_limit("client1", max_requests=5)

        # Wait for window to pass
        await asyncio.sleep(1.1)

        # Cleanup should remove client1 (no recent activity)
        removed = await limiter.cleanup(max_age=0.1)
        assert removed == 1

    @pytest.mark.asyncio
    async def test_get_client_count(self, limiter):
        """Test getting client count."""
        assert await limiter.get_client_count() == 0

        await limiter.check_rate_limit("client1", max_requests=5)
        assert await limiter.get_client_count() == 1

        await limiter.check_rate_limit("client2", max_requests=5)
        assert await limiter.get_client_count() == 2

    @pytest.mark.asyncio
    async def test_acquire_waits_for_slot(self, limiter):
        """Test acquire waits for available slot."""
        client_id = "client1"

        # Use up all requests
        for i in range(5):
            await limiter.check_rate_limit(client_id, max_requests=5)

        # Acquire should wait for slot
        start = time.time()
        status = await limiter.acquire(client_id, max_requests=5, timeout=2.0)
        elapsed = time.time() - start

        assert elapsed >= 0.9  # Should have waited at least a bit
        assert status.remaining >= 0

    @pytest.mark.asyncio
    async def test_acquire_timeout(self, limiter):
        """Test acquire times out when no slot available."""
        client_id = "client1"

        # Use up all requests with very short window
        for i in range(5):
            await limiter.check_rate_limit(client_id, max_requests=5)

        # Try to acquire with very short timeout
        with pytest.raises(TimeoutError):
            await limiter.acquire(client_id, max_requests=5, timeout=0.1)

    @pytest.mark.asyncio
    async def test_concurrent_rate_limiting(self, limiter):
        """Test rate limiter under concurrent load."""
        client_id = "client1"
        max_requests = 50

        async def make_request():
            allowed, status = await limiter.check_rate_limit(client_id, max_requests=max_requests)
            return allowed

        # Make many concurrent requests
        tasks = [make_request() for _ in range(100)]
        results = await asyncio.gather(*tasks)

        # Exactly max_requests should be allowed
        allowed_count = sum(1 for r in results if r)
        assert allowed_count == max_requests

    @pytest.mark.asyncio
    async def test_multiple_clients_independent(self, limiter):
        """Test that multiple clients have independent rate limits."""
        # Client 1 uses all their requests
        for i in range(5):
            await limiter.check_rate_limit("client1", max_requests=5)

        # Client 2 should still be allowed
        allowed, _ = await limiter.check_rate_limit("client2", max_requests=5)
        assert allowed is True


class TestRateLimitStatus:
    """Test RateLimitStatus dataclass."""

    def test_to_dict(self):
        """Test status conversion to dict."""
        status = RateLimitStatus(limit=100, remaining=50, reset=1234567890.0)
        d = status.to_dict()

        assert d["limit"] == 100
        assert d["remaining"] == 50
        assert d["reset"] == 1234567890.0


class TestRateLimitExceeded:
    """Test RateLimitExceeded exception."""

    def test_exception_message(self):
        """Test exception message format."""
        exc = RateLimitExceeded(limit=100, remaining=0, reset=1234567890.0)
        assert "rate limit exceeded" in str(exc).lower()
        assert exc.limit == 100
        assert exc.remaining == 0
        assert exc.reset == 1234567890.0

    def test_to_dict(self):
        """Test exception conversion to dict."""
        exc = RateLimitExceeded(limit=100, remaining=0, reset=1234567890.0)
        d = exc.to_dict()

        assert d["error"] == "rate_limit_exceeded"
        assert d["limit"] == 100
        assert d["remaining"] == 0
        assert d["reset"] == 1234567890.0
