"""
Async Rate Limiter Module for PixelRTS.

Provides async sliding window rate limiting to prevent API abuse
with improved performance under high concurrency.

Migration from sync to async for improved responsiveness under load.
"""

import asyncio
import time
from collections import deque
from dataclasses import dataclass, field
from typing import Optional


@dataclass
class RateLimitStatus:
    """
    Status of rate limiting for a client.

    Attributes:
        limit: Maximum requests allowed in window
        remaining: Requests remaining in current window
        reset: Unix timestamp when window resets
    """
    limit: int
    remaining: int
    reset: float

    def to_dict(self) -> dict:
        """Convert to dictionary for API responses."""
        return {
            "limit": self.limit,
            "remaining": self.remaining,
            "reset": self.reset
        }


class RateLimitExceeded(Exception):
    """
    Raised when rate limit is exceeded.

    Attributes:
        status: RateLimitStatus with current rate limit info
        limit: Maximum requests allowed (for direct access)
        remaining: Requests remaining (for direct access)
        reset: Unix timestamp when window resets (for direct access)
    """

    def __init__(self, limit: int, remaining: int, reset: float):
        self.status = RateLimitStatus(limit=limit, remaining=remaining, reset=reset)
        self.limit = limit
        self.remaining = remaining
        self.reset = reset
        super().__init__(f"Rate limit exceeded: {remaining}/{limit} remaining. Resets at {reset}")

    def to_dict(self) -> dict:
        """Convert to dictionary for API error responses."""
        return {
            "error": "rate_limit_exceeded",
            "limit": self.status.limit,
            "remaining": self.status.remaining,
            "reset": self.status.reset
        }


@dataclass
class _RateLimitWindow:
    """Internal tracking for a single client's rate limit."""
    requests: deque = field(default_factory=deque)  # Timestamps of requests
    window_size: float = 60.0  # Window size in seconds
    lock: asyncio.Lock = field(default_factory=asyncio.Lock)

    def clean_old_requests(self, now: float) -> None:
        """Remove requests outside the current window."""
        cutoff = now - self.window_size
        while self.requests and self.requests[0] < cutoff:
            self.requests.popleft()

    def count(self) -> int:
        """Get current request count."""
        return len(self.requests)


class AsyncRateLimiter:
    """
    Async sliding window rate limiter.

    Tracks request timestamps per client and enforces limits
    using a sliding window algorithm with async-safe operations.
    """

    def __init__(self, window_size: float = 60.0):
        """
        Initialize the async rate limiter.

        Args:
            window_size: Time window in seconds (default: 60)
        """
        self._clients: dict[str, _RateLimitWindow] = {}
        self._default_window_size = window_size
        self._global_lock = asyncio.Lock()

    async def _get_window(self, client_id: str) -> _RateLimitWindow:
        """Get or create a rate limit window for a client (async)."""
        async with self._global_lock:
            if client_id not in self._clients:
                self._clients[client_id] = _RateLimitWindow(
                    window_size=self._default_window_size
                )
            return self._clients[client_id]

    async def check_rate_limit(
        self,
        client_id: str,
        max_requests: int,
        window_size: float = None
    ) -> tuple[bool, RateLimitStatus]:
        """
        Check and update rate limit for a client (async).

        Args:
            client_id: Unique identifier for the client (e.g., API key hash)
            max_requests: Maximum requests allowed in the window
            window_size: Optional custom window size (uses default if None)

        Returns:
            Tuple of (allowed, status) where:
            - allowed: True if request is allowed, False if limit exceeded
            - status: RateLimitStatus with limit, remaining, and reset timestamp

        Raises:
            RateLimitExceeded: If raise_on_exceed is True and limit is exceeded
        """
        now = time.time()
        window = await self._get_window(client_id)

        async with window.lock:
            # Use custom window size if provided
            if window_size is not None:
                window.window_size = window_size

            # Clean old requests
            window.clean_old_requests(now)

            # Check if limit exceeded
            current_count = window.count()
            if current_count >= max_requests:
                # Calculate reset time (oldest request + window size)
                if window.requests:
                    reset_time = window.requests[0] + window.window_size
                else:
                    reset_time = now + window.window_size

                return False, RateLimitStatus(
                    limit=max_requests,
                    remaining=0,
                    reset=reset_time
                )

            # Add current request
            window.requests.append(now)

            # Calculate reset time (oldest request + window size)
            if window.requests:
                reset_time = window.requests[0] + window.window_size
            else:
                reset_time = now + window.window_size

            return True, RateLimitStatus(
                limit=max_requests,
                remaining=max_requests - current_count - 1,
                reset=reset_time
            )

    async def check_rate_limit_or_raise(
        self,
        client_id: str,
        max_requests: int,
        window_size: float = None
    ) -> RateLimitStatus:
        """
        Check rate limit and raise exception if exceeded (async).

        Args:
            client_id: Unique identifier for the client
            max_requests: Maximum requests allowed in the window
            window_size: Optional custom window size

        Returns:
            RateLimitStatus if request is allowed

        Raises:
            RateLimitExceeded: If limit is exceeded
        """
        allowed, status = await self.check_rate_limit(
            client_id, max_requests, window_size
        )
        if not allowed:
            raise RateLimitExceeded(
                limit=status.limit,
                remaining=status.remaining,
                reset=status.reset
            )
        return status

    async def get_status(
        self,
        client_id: str,
        max_requests: int,
        window_size: float = None
    ) -> RateLimitStatus:
        """
        Get current rate limit status for a client without incrementing (async).

        Args:
            client_id: Unique identifier for the client
            max_requests: Maximum requests allowed in the window
            window_size: Optional custom window size

        Returns:
            RateLimitStatus with limit, remaining, and reset timestamp
        """
        now = time.time()
        window = await self._get_window(client_id)

        async with window.lock:
            if window_size is not None:
                window.window_size = window_size

            # Clean old requests
            window.clean_old_requests(now)

            current_count = window.count()

            # Calculate reset time
            if window.requests:
                reset_time = window.requests[0] + window.window_size
            else:
                reset_time = now + window.window_size

            return RateLimitStatus(
                limit=max_requests,
                remaining=max_requests - current_count,
                reset=reset_time
            )

    async def reset(self, client_id: str) -> None:
        """
        Reset rate limit for a client (async).

        Args:
            client_id: Unique identifier for the client
        """
        async with self._global_lock:
            if client_id in self._clients:
                del self._clients[client_id]

    async def reset_all(self) -> None:
        """
        Reset all rate limits (async).
        """
        async with self._global_lock:
            self._clients.clear()

    async def cleanup(self, max_age: float = 3600.0) -> int:
        """
        Remove inactive client data (async).

        Args:
            max_age: Remove clients with no requests in this many seconds

        Returns:
            Number of clients removed
        """
        now = time.time()
        removed = 0

        async with self._global_lock:
            clients_to_remove = []
            for client_id, window in self._clients.items():
                # Clean old requests first
                async with window.lock:
                    window.clean_old_requests(now)

                    # Remove if no recent activity
                    if not window.requests:
                        clients_to_remove.append(client_id)

            for client_id in clients_to_remove:
                del self._clients[client_id]
                removed += 1

        return removed

    async def get_client_count(self) -> int:
        """
        Get the number of tracked clients (async).

        Returns:
            Number of clients being tracked
        """
        async with self._global_lock:
            return len(self._clients)

    async def acquire(
        self,
        client_id: str,
        max_requests: int,
        window_size: float = None,
        timeout: float = None
    ) -> RateLimitStatus:
        """
        Acquire a rate limit slot, waiting if necessary (async).

        This is useful for scenarios where you want to wait for a slot
        to become available rather than failing immediately.

        Args:
            client_id: Unique identifier for the client
            max_requests: Maximum requests allowed in the window
            window_size: Optional custom window size
            timeout: Maximum time to wait for a slot (None = wait forever)

        Returns:
            RateLimitStatus when slot acquired

        Raises:
            TimeoutError: If timeout is reached before slot available
            RateLimitExceeded: If rate limit cannot be acquired
        """
        start_time = time.time()

        while True:
            allowed, status = await self.check_rate_limit(
                client_id, max_requests, window_size
            )

            if allowed:
                return status

            # Check timeout
            if timeout is not None:
                elapsed = time.time() - start_time
                if elapsed >= timeout:
                    raise TimeoutError(
                        f"Rate limit acquisition timed out after {elapsed:.2f}s"
                    )

            # Wait until the oldest request expires
            wait_time = max(0.1, status.reset - time.time())
            wait_time = min(wait_time, 1.0)  # Cap at 1 second per iteration

            await asyncio.sleep(wait_time)


# Backward compatibility alias
RateLimiter = AsyncRateLimiter


__all__ = [
    'AsyncRateLimiter',
    'RateLimiter',  # Backward compatibility alias
    'RateLimitStatus',
    'RateLimitExceeded',
]
