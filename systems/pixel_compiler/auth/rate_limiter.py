"""
Rate Limiter Module for PixelRTS.

Provides sliding window rate limiting to prevent API abuse.
"""

import time
from dataclasses import dataclass, field
from typing import Dict, List, Tuple
from collections import deque


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

    def to_dict(self) -> Dict:
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

    def to_dict(self) -> Dict:
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

    def clean_old_requests(self, now: float) -> None:
        """Remove requests outside the current window."""
        cutoff = now - self.window_size
        while self.requests and self.requests[0] < cutoff:
            self.requests.popleft()

    def count(self) -> int:
        """Get current request count."""
        return len(self.requests)


class RateLimiter:
    """
    Sliding window rate limiter.

    Tracks request timestamps per client and enforces limits
    using a sliding window algorithm.
    """

    def __init__(self, window_size: float = 60.0):
        """
        Initialize the rate limiter.

        Args:
            window_size: Time window in seconds (default: 60)
        """
        self._clients: Dict[str, _RateLimitWindow] = {}
        self._default_window_size = window_size

    def _get_window(self, client_id: str) -> _RateLimitWindow:
        """Get or create a rate limit window for a client."""
        if client_id not in self._clients:
            self._clients[client_id] = _RateLimitWindow(window_size=self._default_window_size)
        return self._clients[client_id]

    def check_rate_limit(
        self,
        client_id: str,
        max_requests: int,
        window_size: float = None
    ) -> Tuple[bool, Dict]:
        """
        Check and update rate limit for a client.

        Args:
            client_id: Unique identifier for the client (e.g., API key hash)
            max_requests: Maximum requests allowed in the window
            window_size: Optional custom window size (uses default if None)

        Returns:
            Tuple of (allowed, info_dict) where:
            - allowed: True if request is allowed, False if limit exceeded
            - info_dict: Dictionary with limit, remaining, and reset timestamp
        """
        now = time.time()
        window = self._get_window(client_id)

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

            return False, {
                "limit": max_requests,
                "remaining": 0,
                "reset": reset_time
            }

        # Add current request
        window.requests.append(now)

        # Calculate reset time (oldest request + window size)
        if window.requests:
            reset_time = window.requests[0] + window.window_size
        else:
            reset_time = now + window.window_size

        return True, {
            "limit": max_requests,
            "remaining": max_requests - current_count - 1,
            "reset": reset_time
        }

    def get_status(
        self,
        client_id: str,
        max_requests: int,
        window_size: float = None
    ) -> Dict:
        """
        Get current rate limit status for a client without incrementing.

        Args:
            client_id: Unique identifier for the client
            max_requests: Maximum requests allowed in the window
            window_size: Optional custom window size

        Returns:
            Dictionary with limit, remaining, and reset timestamp
        """
        now = time.time()
        window = self._get_window(client_id)

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

        return {
            "limit": max_requests,
            "remaining": max_requests - current_count,
            "reset": reset_time
        }

    def reset(self, client_id: str) -> None:
        """
        Reset rate limit for a client.

        Args:
            client_id: Unique identifier for the client
        """
        if client_id in self._clients:
            del self._clients[client_id]

    def cleanup(self, max_age: float = 3600.0) -> int:
        """
        Remove inactive client data.

        Args:
            max_age: Remove clients with no requests in this many seconds

        Returns:
            Number of clients removed
        """
        now = time.time()
        removed = 0

        clients_to_remove = []
        for client_id, window in self._clients.items():
            # Clean old requests first
            window.clean_old_requests(now)

            # Remove if no recent activity
            if not window.requests:
                clients_to_remove.append(client_id)

        for client_id in clients_to_remove:
            del self._clients[client_id]
            removed += 1

        return removed
