"""
AsyncInferenceClient - Async client for batch LLM inference with rate limiting.

Features:
- Rate limiting (max 10 requests/second by default)
- Retry with exponential backoff
- Response caching
- Batch processing support
- Frame-based batch processing with configurable batch size
- Frame content caching to avoid redundant inference
- Performance metrics logging (latency, throughput)
"""

import asyncio
import hashlib
import json
import logging
import statistics
import time
from collections import deque
from dataclasses import dataclass, field
from typing import Any, Callable

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

    response: dict[str, Any]
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
        self._cache: dict[str, CacheEntry] = {}
        self._access_order: list[str] = []
        self._lock = asyncio.Lock()

    def _hash_key(self, messages: list[dict[str, str]], model: str) -> str:
        """Generate a hash key for the request."""
        content = json.dumps({"messages": messages, "model": model}, sort_keys=True)
        return hashlib.sha256(content.encode()).hexdigest()

    async def get(
        self,
        messages: list[dict[str, str]],
        model: str
    ) -> dict[str, Any] | None:
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
        messages: list[dict[str, str]],
        model: str,
        response: dict[str, Any],
        ttl: float | None = None
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

    def get_stats(self) -> dict[str, Any]:
        """Get cache statistics."""
        return {
            "size": len(self._cache),
            "max_size": self.max_size,
            "entries": list(self._cache.keys())[:10],  # First 10 keys
        }


class FrameCache:
    """
    Content-based cache for frame inference to avoid redundant processing.

    Uses perceptual hashing to identify identical or similar frames,
    reducing unnecessary LLM calls for repeated visual content.
    """

    def __init__(self, max_size: int = 1000, similarity_threshold: float = 0.95):
        """
        Initialize the frame cache.

        Args:
            max_size: Maximum number of frames to cache
            similarity_threshold: Threshold for considering frames similar (0-1)
        """
        self.max_size = max_size
        self.similarity_threshold = similarity_threshold
        self._cache: dict[str, tuple[Any, float]] = {}  # hash -> (result, timestamp)
        self._access_order: list[str] = []
        self._lock = asyncio.Lock()

        # Metrics
        self._hits = 0
        self._misses = 0
        self._total_frames = 0

    def _compute_frame_hash(self, frame_data: bytes | str | Any) -> str:
        """
        Compute a hash for frame content.

        Args:
            frame_data: Raw frame data (bytes, string, or object with tobytes())

        Returns:
            SHA256 hash of frame content
        """
        if isinstance(frame_data, bytes):
            content = frame_data
        elif isinstance(frame_data, str):
            content = frame_data.encode()
        elif hasattr(frame_data, 'tobytes'):
            content = frame_data.tobytes()
        else:
            content = str(frame_data).encode()

        return hashlib.sha256(content).hexdigest()

    async def get(self, frame_data: Any) -> Any | None:
        """
        Get cached result for a frame if available.

        Args:
            frame_data: Frame content to look up

        Returns:
            Cached result or None
        """
        async with self._lock:
            self._total_frames += 1
            frame_hash = self._compute_frame_hash(frame_data)

            if frame_hash in self._cache:
                result, timestamp = self._cache[frame_hash]
                # Update access order for LRU
                self._access_order.remove(frame_hash)
                self._access_order.append(frame_hash)
                self._hits += 1
                return result

            self._misses += 1
            return None

    async def put(self, frame_data: Any, result: Any) -> None:
        """
        Cache a result for a frame.

        Args:
            frame_data: Frame content
            result: Inference result to cache
        """
        async with self._lock:
            frame_hash = self._compute_frame_hash(frame_data)

            # Evict oldest if at capacity
            while len(self._cache) >= self.max_size and self._access_order:
                oldest_key = self._access_order.pop(0)
                self._cache.pop(oldest_key, None)

            self._cache[frame_hash] = (result, time.time())
            self._access_order.append(frame_hash)

    async def clear(self) -> None:
        """Clear all cached frames."""
        async with self._lock:
            self._cache.clear()
            self._access_order.clear()

    def get_stats(self) -> dict[str, Any]:
        """Get frame cache statistics."""
        hit_rate = self._hits / self._total_frames if self._total_frames > 0 else 0.0
        return {
            "size": len(self._cache),
            "max_size": self.max_size,
            "hits": self._hits,
            "misses": self._misses,
            "total_frames": self._total_frames,
            "hit_rate": hit_rate,
        }

    def reset_stats(self) -> None:
        """Reset statistics."""
        self._hits = 0
        self._misses = 0
        self._total_frames = 0


@dataclass
class PerformanceMetrics:
    """
    Performance metrics tracker for inference operations.

    Tracks latency, throughput, and other performance indicators,
    with periodic logging every N frames.
    """

    log_interval: int = 100  # Log every N frames

    # Latency tracking
    _latencies: deque = field(default_factory=lambda: deque(maxlen=1000))
    _frame_count: int = field(default=0, repr=False)
    _start_time: float = field(default_factory=time.time, repr=False)
    _last_log_time: float = field(default_factory=time.time, repr=False)
    _last_log_frame_count: int = field(default=0, repr=False)

    # Throughput tracking
    _bytes_processed: int = field(default=0, repr=False)

    def record_latency(self, latency_ms: float) -> None:
        """Record a latency measurement."""
        self._latencies.append(latency_ms)

    def record_frame(self, frame_size_bytes: int = 0) -> None:
        """
        Record a processed frame.

        Args:
            frame_size_bytes: Size of the frame in bytes (for throughput calc)
        """
        self._frame_count += 1
        self._bytes_processed += frame_size_bytes

        # Check if we should log
        if self._frame_count % self.log_interval == 0:
            self._log_metrics()

    def _log_metrics(self) -> None:
        """Log current performance metrics."""
        now = time.time()
        elapsed = now - self._last_log_time
        frames_since_last = self._frame_count - self._last_log_frame_count

        # Calculate metrics
        throughput = frames_since_last / elapsed if elapsed > 0 else 0.0
        throughput_mbps = (self._bytes_processed / (1024 * 1024)) / (now - self._start_time) if (now - self._start_time) > 0 else 0.0

        # Latency stats
        if self._latencies:
            latencies = list(self._latencies)
            avg_latency = statistics.mean(latencies)
            p50 = statistics.median(latencies)
            p95 = statistics.quantiles(latencies, n=20)[18] if len(latencies) >= 20 else max(latencies)
            p99 = statistics.quantiles(latencies, n=100)[98] if len(latencies) >= 100 else max(latencies)
        else:
            avg_latency = p50 = p95 = p99 = 0.0

        logger.info(
            f"PixelBrain Performance Metrics (frames: {self._frame_count}): "
            f"throughput={throughput:.2f} fps, "
            f"latency_avg={avg_latency:.2f}ms, "
            f"p50={p50:.2f}ms, p95={p95:.2f}ms, p99={p99:.2f}ms, "
            f"bandwidth={throughput_mbps:.2f} MB/s"
        )

        # Reset for next interval
        self._last_log_time = now
        self._last_log_frame_count = self._frame_count

    def get_stats(self) -> dict[str, Any]:
        """Get current performance statistics."""
        now = time.time()
        total_elapsed = now - self._start_time

        if self._latencies:
            latencies = list(self._latencies)
            return {
                "total_frames": self._frame_count,
                "total_elapsed_seconds": total_elapsed,
                "overall_throughput_fps": self._frame_count / total_elapsed if total_elapsed > 0 else 0.0,
                "latency_avg_ms": statistics.mean(latencies),
                "latency_p50_ms": statistics.median(latencies),
                "latency_p95_ms": statistics.quantiles(latencies, n=20)[18] if len(latencies) >= 20 else max(latencies),
                "latency_p99_ms": statistics.quantiles(latencies, n=100)[98] if len(latencies) >= 100 else max(latencies),
                "bytes_processed": self._bytes_processed,
            }
        return {
            "total_frames": self._frame_count,
            "total_elapsed_seconds": total_elapsed,
            "overall_throughput_fps": self._frame_count / total_elapsed if total_elapsed > 0 else 0.0,
            "latency_avg_ms": 0.0,
            "latency_p50_ms": 0.0,
            "latency_p95_ms": 0.0,
            "latency_p99_ms": 0.0,
            "bytes_processed": self._bytes_processed,
        }

    def reset(self) -> None:
        """Reset all metrics."""
        self._latencies.clear()
        self._frame_count = 0
        self._start_time = time.time()
        self._last_log_time = time.time()
        self._last_log_frame_count = 0
        self._bytes_processed = 0


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
        retry_config: RetryConfig | None = None,
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
        self._session: aiohttp.ClientSession | None = None

        # Frame-level caching and metrics
        self._frame_cache = FrameCache(max_size=cache_size * 2)
        self._perf_metrics = PerformanceMetrics(log_interval=100)

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
        messages: list[dict[str, str]],
        max_tokens: int = 512,
        temperature: float = 0.7,
    ) -> dict[str, Any] | None:
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
            except (TimeoutError, aiohttp.ClientError) as e:
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
        messages: list[dict[str, str]],
        max_tokens: int,
        temperature: float,
    ) -> dict[str, Any]:
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
        messages: list[dict[str, str]],
        max_tokens: int = 512,
        temperature: float = 0.7,
        use_cache: bool = True,
    ) -> dict[str, Any] | None:
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
        batch_messages: list[list[dict[str, str]]],
        max_tokens: int = 512,
        temperature: float = 0.7,
        max_concurrent: int = 5,
    ) -> list[dict[str, Any] | None]:
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

        async def process_one(messages: list[dict[str, str]]) -> dict[str, Any] | None:
            async with semaphore:
                return await self.chat_completion(
                    messages=messages,
                    max_tokens=max_tokens,
                    temperature=temperature,
                )

        tasks = [process_one(messages) for messages in batch_messages]
        return await asyncio.gather(*tasks)

    async def frame_batch_inference(
        self,
        frames: list[Any],
        build_prompt: Callable[[Any], list[dict[str, str]]],
        max_tokens: int = 512,
        temperature: float = 0.7,
        batch_size: int = 8,
    ) -> list[Any]:
        """
        Process multiple frames with content-based caching and batch optimization.

        This method is optimized for frame-by-frame inference where:
        - Duplicate frames can be served from cache
        - Performance metrics are tracked and logged every 100 frames
        - Requests are batched for efficiency

        Args:
            frames: List of frame data (bytes, strings, or objects with tobytes())
            build_prompt: Function to convert frame to messages list
            max_tokens: Maximum tokens per request
            temperature: Sampling temperature
            batch_size: Number of frames to process in parallel

        Returns:
            List of inference results (same order as input)
        """
        results: list[Any] = [None] * len(frames)
        uncached_indices: list[int] = []
        uncached_frames: list[Any] = []

        # Check frame cache for each frame
        for i, frame in enumerate(frames):
            cached_result = await self._frame_cache.get(frame)
            if cached_result is not None:
                results[i] = cached_result
                self._perf_metrics.record_frame(
                    frame_size_bytes=len(frame) if isinstance(frame, (bytes, str)) else 0
                )
            else:
                uncached_indices.append(i)
                uncached_frames.append(frame)

        # Log frame cache stats every 100 frames
        total_processed = len(frames) - len(uncached_frames)
        if total_processed > 0 and total_processed % 100 == 0:
            cache_stats = self._frame_cache.get_stats()
            logger.info(
                f"PixelBrain Frame Cache Stats: "
                f"hit_rate={cache_stats['hit_rate']:.2%}, "
                f"hits={cache_stats['hits']}, "
                f"misses={cache_stats['misses']}, "
                f"cache_size={cache_stats['size']}"
            )

        # Process uncached frames in batches
        for batch_start in range(0, len(uncached_frames), batch_size):
            batch_end = min(batch_start + batch_size, len(uncached_frames))
            batch_frames = uncached_frames[batch_start:batch_end]
            batch_indices = uncached_indices[batch_start:batch_end]

            # Build prompts for this batch
            batch_messages = [build_prompt(frame) for frame in batch_frames]

            # Process batch
            start_time = time.time()
            batch_results = await self.batch_completion(
                batch_messages=batch_messages,
                max_tokens=max_tokens,
                temperature=temperature,
            )
            latency_ms = (time.time() - start_time) * 1000 / len(batch_frames)

            # Store results and update cache
            for idx, frame, result in zip(batch_indices, batch_frames, batch_results):
                results[idx] = result
                if result is not None:
                    await self._frame_cache.put(frame, result)

                # Record metrics
                self._perf_metrics.record_latency(latency_ms)
                self._perf_metrics.record_frame(
                    frame_size_bytes=len(frame) if isinstance(frame, (bytes, str)) else 0
                )

        return results

    def get_stats(self) -> dict[str, Any]:
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
            "frame_cache_stats": self._frame_cache.get_stats(),
            "performance_metrics": self._perf_metrics.get_stats(),
        }

    def reset_stats(self) -> None:
        """Reset statistics."""
        self._total_requests = 0
        self._cache_hits = 0
        self._cache_misses = 0
        self._failed_requests = 0
        self._frame_cache.reset_stats()
        self._perf_metrics.reset()

    async def __aenter__(self):
        """Async context manager entry."""
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit."""
        await self.close()
