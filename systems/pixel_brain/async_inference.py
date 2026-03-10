"""
AsyncInferenceClient - Async client for batch LLM inference with rate limiting.

Features:
- Rate limiting (max 10 requests/second by default)
- Retry with exponential backoff
- Response caching
- Batch processing support
"""

import asyncio
import hashlib
import json
import logging
import time
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable
import aiohttp

logger = logging.getLogger("pixel_brain.async_inference")


@dataclass
class RateLimiter:
    """Token bucket rate limiter for API requests."""

    max_requests_per_second: float = 10.0
    _tokens: float = field(default=10.0, repr=False)
    _last_update: float = field(default_factory=time.time, repr=False)
    _lock: asyncio.Lock = field(default_factory=asyncio.Lock, repr=False)

    async def acquire(self) -> None:
        """Acquire a token, waiting if necessary."""
        async with self._lock:
            now = time.time()
            elapsed = now - self._last_update

            # Replenish tokens
            self._tokens = min(
                self.max_requests_per_second,
                self._tokens + elapsed * self.max_requests_per_second
            )
            self._last_update = now

            # Wait if no tokens available
            if self._tokens < 1.0:
                wait_time = (1.0 - self._tokens) / self.max_requests_per_second
                await asyncio.sleep(wait_time)
                self._tokens = 0.0
            else:
                self._tokens -= 1.0


@dataclass
class RetryConfig:
    """Configuration for retry behavior."""

    max_attempts: int = 3
    initial_delay: float = 1.0
    max_delay: float = 60.0
    backoff_multiplier: float = 2.0
    jitter: float = 0.1


@dataclass
class CacheEntry:
    """A cached response entry."""

    response: Dict[str, Any]
    timestamp: float
    ttl: float

    def is_expired(self) -> bool:
        """Check if the cache entry has expired."""
        return time.time() > (self.timestamp + self.ttl)


class ResponseCache:
    """In-memory LRU cache for LLM responses."""

    def __init__(self, max_size: int = 256, default_ttl: float = 300.0):
        """
        Initialize the response cache.

        Args:
            max_size: Maximum number of entries to cache
            default_ttl: Default time-to-live in seconds
        """
        self.max_size = max_size
        self.default_ttl = default_ttl
        self._cache: Dict[str, CacheEntry] = {}
        self._access_order: List[str] = []
        self._lock = asyncio.Lock()

    def _hash_key(self, messages: List[Dict[str, str]], model: str) -> str:
        """Generate a hash key for the request."""
        content = json.dumps({"messages": messages, "model": model}, sort_keys=True)
        return hashlib.sha256(content.encode()).hexdigest()

    async def get(
        self,
        messages: List[Dict[str, str]],
        model: str
    ) -> Optional[Dict[str, Any]]:
        """
        Get a cached response if available and not expired.

        Args:
            messages: The messages to look up
            model: The model name

        Returns:
            Cached response or None
        """
        async with self._lock:
            key = self._hash_key(messages, model)
            entry = self._cache.get(key)

            if entry is None:
                return None

            if entry.is_expired():
                del self._cache[key]
                self._access_order.remove(key)
                return None

            # Update access order for LRU
            self._access_order.remove(key)
            self._access_order.append(key)

            return entry.response

    async def put(
        self,
        messages: List[Dict[str, str]],
        model: str,
        response: Dict[str, Any],
        ttl: Optional[float] = None
    ) -> None:
        """
        Cache a response.

        Args:
            messages: The messages that generated this response
            model: The model name
            response: The response to cache
            ttl: Time-to-live override
        """
        async with self._lock:
            key = self._hash_key(messages, model)

            # Evict oldest if at capacity
            while len(self._cache) >= self.max_size and self._access_order:
                oldest_key = self._access_order.pop(0)
                self._cache.pop(oldest_key, None)

            self._cache[key] = CacheEntry(
                response=response,
                timestamp=time.time(),
                ttl=ttl or self.default_ttl
            )
            self._access_order.append(key)

    async def clear(self) -> None:
        """Clear all cached entries."""
        async with self._lock:
            self._cache.clear()
            self._access_order.clear()

    def get_stats(self) -> Dict[str, Any]:
        """Get cache statistics."""
        return {
            "size": len(self._cache),
            "max_size": self.max_size,
            "entries": list(self._cache.keys())[:10],  # First 10 keys
        }


class AsyncInferenceClient:
    """
    Async client for LM Studio with rate limiting, retry, and caching.

    Usage:
        client = AsyncInferenceClient(
            base_url="http://localhost:1234/v1",
            model="qwen/qwen3.5-9b"
        )

        response = await client.chat_completion(
            messages=[{"role": "user", "content": "Hello"}]
        )

        await client.close()
    """

    def __init__(
        self,
        base_url: str = "http://localhost:1234/v1",
        model: str = "qwen/qwen3.5-9b",
        max_requests_per_second: float = 10.0,
        retry_config: Optional[RetryConfig] = None,
        cache_size: int = 256,
        cache_ttl: float = 300.0,
        timeout: float = 60.0,
    ):
        """
        Initialize the async inference client.

        Args:
            base_url: LM Studio API base URL
            model: Model name to use
            max_requests_per_second: Rate limit
            retry_config: Retry configuration
            cache_size: Maximum cache entries
            cache_ttl: Cache time-to-live in seconds
            timeout: Request timeout in seconds
        """
        self.base_url = base_url.rstrip("/")
        self.model = model
        self.timeout = timeout

        self._rate_limiter = RateLimiter(
            max_requests_per_second=max_requests_per_second
        )
        self._retry_config = retry_config or RetryConfig()
        self._cache = ResponseCache(max_size=cache_size, default_ttl=cache_ttl)
        self._session: Optional[aiohttp.ClientSession] = None

        # Metrics
        self._total_requests = 0
        self._cache_hits = 0
        self._cache_misses = 0
        self._failed_requests = 0

    async def _get_session(self) -> aiohttp.ClientSession:
        """Get or create the aiohttp session."""
        if self._session is None or self._session.closed:
            timeout = aiohttp.ClientTimeout(total=self.timeout)
            self._session = aiohttp.ClientSession(timeout=timeout)
        return self._session

    async def close(self) -> None:
        """Close the client and cleanup resources."""
        if self._session and not self._session.closed:
            await self._session.close()

    async def _make_request_with_retry(
        self,
        messages: List[Dict[str, str]],
        max_tokens: int = 512,
        temperature: float = 0.7,
    ) -> Optional[Dict[str, Any]]:
        """Make a request with retry logic."""
        import random

        config = self._retry_config
        delay = config.initial_delay
        last_exception = None

        for attempt in range(config.max_attempts):
            try:
                return await self._make_single_request(
                    messages=messages,
                    max_tokens=max_tokens,
                    temperature=temperature,
                )
            except (aiohttp.ClientError, asyncio.TimeoutError) as e:
                last_exception = e
                logger.warning(
                    f"Request failed (attempt {attempt + 1}/{config.max_attempts}): {e}"
                )

                if attempt < config.max_attempts - 1:
                    # Calculate delay with jitter
                    jitter_amount = delay * config.jitter * (2 * random.random() - 1)
                    actual_delay = max(0, delay + jitter_amount)

                    await asyncio.sleep(actual_delay)
                    delay = min(delay * config.backoff_multiplier, config.max_delay)

        self._failed_requests += 1
        logger.error(f"All retry attempts exhausted: {last_exception}")
        return None

    async def _make_single_request(
        self,
        messages: List[Dict[str, str]],
        max_tokens: int,
        temperature: float,
    ) -> Dict[str, Any]:
        """Make a single API request."""
        # Rate limit
        await self._rate_limiter.acquire()

        session = await self._get_session()

        payload = {
            "model": self.model,
            "messages": messages,
            "max_tokens": max_tokens,
            "temperature": temperature,
            "stream": False,
        }

        async with session.post(
            f"{self.base_url}/chat/completions",
            json=payload,
        ) as response:
            response.raise_for_status()
            return await response.json()

    async def chat_completion(
        self,
        messages: List[Dict[str, str]],
        max_tokens: int = 512,
        temperature: float = 0.7,
        use_cache: bool = True,
    ) -> Optional[Dict[str, Any]]:
        """
        Make a chat completion request.

        Args:
            messages: List of message dicts with role and content
            max_tokens: Maximum tokens to generate
            temperature: Sampling temperature
            use_cache: Whether to use response caching

        Returns:
            Response dict or None on failure
        """
        self._total_requests += 1

        # Check cache first
        if use_cache:
            cached = await self._cache.get(messages, self.model)
            if cached is not None:
                self._cache_hits += 1
                return cached

        self._cache_misses += 1

        # Make request with retry
        response = await self._make_request_with_retry(
            messages=messages,
            max_tokens=max_tokens,
            temperature=temperature,
        )

        # Cache successful response
        if response is not None and use_cache:
            await self._cache.put(messages, self.model, response)

        return response

    async def batch_completion(
        self,
        batch_messages: List[List[Dict[str, str]]],
        max_tokens: int = 512,
        temperature: float = 0.7,
        max_concurrent: int = 5,
    ) -> List[Optional[Dict[str, Any]]]:
        """
        Process multiple completion requests concurrently.

        Args:
            batch_messages: List of message lists
            max_tokens: Maximum tokens per request
            temperature: Sampling temperature
            max_concurrent: Maximum concurrent requests

        Returns:
            List of responses (same order as input)
        """
        semaphore = asyncio.Semaphore(max_concurrent)

        async def process_one(messages: List[Dict[str, str]]) -> Optional[Dict[str, Any]]:
            async with semaphore:
                return await self.chat_completion(
                    messages=messages,
                    max_tokens=max_tokens,
                    temperature=temperature,
                )

        tasks = [process_one(messages) for messages in batch_messages]
        return await asyncio.gather(*tasks)

    def get_stats(self) -> Dict[str, Any]:
        """Get client statistics."""
        return {
            "total_requests": self._total_requests,
            "cache_hits": self._cache_hits,
            "cache_misses": self._cache_misses,
            "failed_requests": self._failed_requests,
            "cache_hit_rate": (
                self._cache_hits / self._total_requests
                if self._total_requests > 0
                else 0.0
            ),
            "cache_stats": self._cache.get_stats(),
        }

    def reset_stats(self) -> None:
        """Reset statistics."""
        self._total_requests = 0
        self._cache_hits = 0
        self._cache_misses = 0
        self._failed_requests = 0

    async def __aenter__(self):
        """Async context manager entry."""
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit."""
        await self.close()
