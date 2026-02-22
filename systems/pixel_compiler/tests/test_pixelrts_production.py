"""
Tests for PixelRTS v2 Production Features Module

Tests GPU compute, multi-model vision, database, caching,
networking, security, and monitoring.
"""

import pytest
import sys
import tempfile
import os
import asyncio
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from pixelrts_production import (
    ComputeShaderType,
    ComputeKernel,
    GPUComputeLibrary,
    VisionResult,
    VisionEnsemble,
    EmbeddedDatabase,
    CacheTier,
    CacheEntry,
    CacheHierarchy,
    HTTPMethod,
    HTTPRequest,
    HTTPResponse,
    MinimalHTTPServer,
    Capability,
    SecurityContext,
    SecuritySandbox,
    Metric,
    OpenTelemetryBridge,
    HealthChecker,
    ProductionManager,
    create_production_manager
)


# =============================================================================
# Test GPU Compute Library
# =============================================================================

class TestGPUComputeLibrary:
    """Test GPU compute shader library."""

    def test_library_creation(self):
        """Library should be created with builtin kernels."""
        lib = GPUComputeLibrary()
        assert len(lib.list_kernels()) > 0

    def test_list_kernels(self):
        """Should list available kernels."""
        lib = GPUComputeLibrary()
        kernels = lib.list_kernels()
        assert 'fft_radix2' in kernels
        assert 'sha256_block' in kernels

    def test_get_kernel(self):
        """Should get kernel by ID."""
        lib = GPUComputeLibrary()
        kernel = lib.get_kernel('fft_radix2')
        assert kernel is not None
        assert kernel.kernel_type == ComputeShaderType.FFT

    def test_dispatch_fft(self):
        """Should dispatch FFT kernel."""
        lib = GPUComputeLibrary()
        data = b'\x00\x01\x02\x03\x04\x05\x06\x07'
        result, time_ms = lib.dispatch('fft_radix2', data)

        assert len(result) == len(data) * 8  # Complex pairs
        assert time_ms >= 0

    def test_dispatch_ifft(self):
        """Should dispatch inverse FFT kernel."""
        lib = GPUComputeLibrary()

        # First do FFT
        data = b'\x00\x01\x02\x03\x04\x05\x06\x07'
        freq, _ = lib.dispatch('fft_radix2', data)

        # Then IFFT
        result, _ = lib.dispatch('ifft_radix2', freq)
        assert len(result) == len(data)

    def test_dispatch_dwt(self):
        """Should dispatch DWT kernel."""
        lib = GPUComputeLibrary()
        data = b'\x10\x20\x30\x40\x50\x60\x70\x80'
        result, _ = lib.dispatch('dwt_haar', data)

        assert len(result) == len(data)

    def test_dispatch_idwt(self):
        """Should dispatch inverse DWT kernel."""
        lib = GPUComputeLibrary()
        data = b'\x10\x20\x30\x40\x50\x60\x70\x80'

        # Forward and inverse
        transformed, _ = lib.dispatch('dwt_haar', data)
        result, _ = lib.dispatch('idwt_haar', transformed)

        assert len(result) == len(data)

    def test_dispatch_activation_relu(self):
        """Should dispatch ReLU activation."""
        lib = GPUComputeLibrary()
        data = bytes(range(256))
        result, _ = lib.dispatch('relu', data)

        assert len(result) == len(data)

    def test_dispatch_activation_sigmoid(self):
        """Should dispatch sigmoid activation."""
        lib = GPUComputeLibrary()
        data = bytes(range(256))
        result, _ = lib.dispatch('sigmoid', data)

        assert len(result) == len(data)

    def test_dispatch_activation_tanh(self):
        """Should dispatch tanh activation."""
        lib = GPUComputeLibrary()
        data = bytes(range(256))
        result, _ = lib.dispatch('tanh', data)

        assert len(result) == len(data)

    def test_dispatch_activation_gelu(self):
        """Should dispatch GELU activation."""
        lib = GPUComputeLibrary()
        data = bytes(range(256))
        result, _ = lib.dispatch('gelu', data)

        assert len(result) == len(data)

    def test_dispatch_sha256(self):
        """Should dispatch SHA256 hash."""
        lib = GPUComputeLibrary()
        data = b'hello world'
        result, _ = lib.dispatch('sha256_block', data)

        assert len(result) == 32  # SHA256 digest size

    def test_dispatch_blake3(self):
        """Should dispatch BLAKE3 hash."""
        lib = GPUComputeLibrary()
        data = b'hello world'
        result, _ = lib.dispatch('blake3_block', data)

        assert len(result) == 32

    def test_dispatch_aes_encrypt(self):
        """Should dispatch AES encryption."""
        lib = GPUComputeLibrary()
        data = b'test data for encryption'
        result, _ = lib.dispatch('aes256_encrypt', data, {'key': b'\x01' * 32})

        assert len(result) == len(data)

    def test_dispatch_aes_decrypt(self):
        """Should dispatch AES decryption."""
        lib = GPUComputeLibrary()
        key = b'\x01' * 32
        data = b'test data for encryption'

        encrypted, _ = lib.dispatch('aes256_encrypt', data, {'key': key})
        decrypted, _ = lib.dispatch('aes256_decrypt', encrypted, {'key': key})

        assert decrypted == data

    def test_dispatch_unknown_kernel(self):
        """Should raise for unknown kernel."""
        lib = GPUComputeLibrary()

        with pytest.raises(ValueError):
            lib.dispatch('unknown_kernel', b'data')

    def test_get_stats(self):
        """Should return compute statistics."""
        lib = GPUComputeLibrary()
        lib.dispatch('fft_radix2', b'\x00' * 100)

        stats = lib.get_stats()
        assert stats['dispatches'] == 1
        assert stats['total_time_ms'] > 0


# =============================================================================
# Test Vision Ensemble
# =============================================================================

class TestVisionEnsemble:
    """Test multi-model vision ensemble."""

    def test_ensemble_creation(self):
        """Ensemble should be created with models."""
        ensemble = VisionEnsemble()
        stats = ensemble.get_stats()
        assert 'vlm' in stats['models']
        assert 'clip' in stats['models']

    def test_analyze_all_models(self):
        """Should analyze with all models."""
        ensemble = VisionEnsemble()

        # Create minimal PNG header
        png_data = (
            b'\x89PNG\r\n\x1a\n'  # PNG signature
            b'\x00\x00\x00\rIHDR'  # IHDR chunk
            b'\x00\x00\x01\x00'    # width: 256
            b'\x00\x00\x01\x00'    # height: 256
            b'\x08\x02\x00\x00\x00'  # bit depth, color type
            b'\x00\x00\x00\x00'    # CRC placeholder
        )

        results = ensemble.analyze(png_data)

        assert 'vlm' in results
        assert 'clip' in results
        assert 'sam' in results

    def test_analyze_specific_models(self):
        """Should analyze with specific models."""
        ensemble = VisionEnsemble()

        png_data = (
            b'\x89PNG\r\n\x1a\n'
            b'\x00\x00\x00\rIHDR'
            b'\x00\x00\x01\x00'
            b'\x00\x00\x01\x00'
            b'\x08\x02\x00\x00\x00'
            b'\x00\x00\x00\x00'
        )

        results = ensemble.analyze(png_data, models=['vlm'])

        assert 'vlm' in results
        assert 'clip' not in results

    def test_vlm_result(self):
        """VLM result should have description and confidence."""
        ensemble = VisionEnsemble()

        png_data = (
            b'\x89PNG\r\n\x1a\n'
            b'\x00\x00\x00\rIHDR'
            b'\x00\x00\x01\x00'
            b'\x00\x00\x01\x00'
            b'\x08\x02\x00\x00\x00'
            b'\x00\x00\x00\x00'
        )

        results = ensemble.analyze(png_data, models=['vlm'])
        vlm = results['vlm']

        assert isinstance(vlm.description, str)
        assert 0 <= vlm.confidence <= 1
        assert 'width' in vlm.features
        assert 'height' in vlm.features

    def test_clip_embedding(self):
        """CLIP should return normalized embedding."""
        ensemble = VisionEnsemble()

        png_data = (
            b'\x89PNG\r\n\x1a\n'
            b'\x00\x00\x00\rIHDR'
            b'\x00\x00\x01\x00'
            b'\x00\x00\x01\x00'
            b'\x08\x02\x00\x00\x00'
            b'\x00\x00\x00\x00'
        )

        results = ensemble.analyze(png_data, models=['clip'])
        clip = results['clip']

        assert len(clip.embedding) == 512
        # Check normalization
        mag = sum(x**2 for x in clip.embedding) ** 0.5
        assert abs(mag - 1.0) < 0.01

    def test_sam_segmentation(self):
        """SAM should return segmentation."""
        ensemble = VisionEnsemble()

        png_data = (
            b'\x89PNG\r\n\x1a\n'
            b'\x00\x00\x00\rIHDR'
            b'\x00\x00\x01\x00'
            b'\x00\x00\x01\x00'
            b'\x08\x02\x00\x00\x00'
            b'\x00\x00\x00\x00'
        )

        results = ensemble.analyze(png_data, models=['sam'])
        sam = results['sam']

        assert 'segments' in sam.features
        assert 'bbox' in sam.features

    def test_compute_similarity(self):
        """Should compute cosine similarity."""
        ensemble = VisionEnsemble()

        emb1 = [1.0, 0.0, 0.0]
        emb2 = [1.0, 0.0, 0.0]
        emb3 = [0.0, 1.0, 0.0]

        sim_same = ensemble.compute_similarity(emb1, emb2)
        sim_diff = ensemble.compute_similarity(emb1, emb3)

        assert sim_same == 1.0
        assert sim_diff == 0.0

    def test_get_stats(self):
        """Should return vision statistics."""
        ensemble = VisionEnsemble()

        png_data = (
            b'\x89PNG\r\n\x1a\n'
            b'\x00\x00\x00\rIHDR'
            b'\x00\x00\x01\x00'
            b'\x00\x00\x01\x00'
            b'\x08\x02\x00\x00\x00'
            b'\x00\x00\x00\x00'
        )

        ensemble.analyze(png_data)
        stats = ensemble.get_stats()

        assert stats['ensemble_calls'] == 1
        assert stats['analyses'] >= 1


# =============================================================================
# Test Embedded Database
# =============================================================================

class TestEmbeddedDatabase:
    """Test embedded SQLite database."""

    def test_database_creation(self):
        """Database should be created with schema."""
        db = EmbeddedDatabase()
        assert db._conn is not None

    def test_insert_file(self):
        """Should insert file record."""
        db = EmbeddedDatabase()

        file_id = db.insert_file(
            path='/test/file.txt',
            size=1024,
            hash_val='abc123',
            zone='hot'
        )

        assert file_id > 0

    def test_get_file_by_path(self):
        """Should get file by path."""
        db = EmbeddedDatabase()

        db.insert_file(
            path='/test/file.txt',
            size=1024,
            hash_val='abc123',
            zone='hot'
        )

        file = db.get_file_by_path('/test/file.txt')

        assert file is not None
        assert file['size'] == 1024
        assert file['hash'] == 'abc123'

    def test_get_files_by_zone(self):
        """Should get files by zone."""
        db = EmbeddedDatabase()

        db.insert_file('/hot/file1.txt', 100, 'h1', 'hot')
        db.insert_file('/cold/file2.txt', 200, 'h2', 'cold')
        db.insert_file('/hot/file3.txt', 300, 'h3', 'hot')

        hot_files = db.get_files_by_zone('hot')

        assert len(hot_files) == 2

    def test_set_metadata(self):
        """Should set metadata."""
        db = EmbeddedDatabase()

        db.set_metadata('version', '1.0.0')
        db.set_metadata('count', 42, 'int')

        assert db.get_metadata('version') == '1.0.0'
        assert db.get_metadata('count') == 42

    def test_get_metadata_missing(self):
        """Should return None for missing metadata."""
        db = EmbeddedDatabase()

        assert db.get_metadata('nonexistent') is None

    def test_store_embedding(self):
        """Should store embedding."""
        db = EmbeddedDatabase()

        file_id = db.insert_file('/test/file.txt', 100, 'h1', 'hot')
        embedding = [0.1, 0.2, 0.3, 0.4, 0.5]

        emb_id = db.store_embedding(file_id, 'clip', embedding)
        assert emb_id > 0

    def test_get_embedding(self):
        """Should retrieve embedding."""
        db = EmbeddedDatabase()

        file_id = db.insert_file('/test/file.txt', 100, 'h1', 'hot')
        embedding = [0.1, 0.2, 0.3, 0.4, 0.5]

        db.store_embedding(file_id, 'clip', embedding)
        retrieved = db.get_embedding(file_id, 'clip')

        assert len(retrieved) == 5
        for a, b in zip(embedding, retrieved):
            assert abs(a - b) < 0.001

    def test_execute_query(self):
        """Should execute SQL queries."""
        db = EmbeddedDatabase()

        rows = db.execute("SELECT 1 + 1 as result")
        assert rows[0]['result'] == 2

    def test_get_stats(self):
        """Should return database statistics."""
        db = EmbeddedDatabase()

        db.insert_file('/test/file.txt', 100, 'h1', 'hot')
        stats = db.get_stats()

        assert stats['file_count'] == 1
        assert stats['inserts'] >= 1

    def test_close(self):
        """Should close database."""
        db = EmbeddedDatabase()
        db.close()

        assert db._conn is None

    def test_file_database(self):
        """Should work with file database."""
        with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as f:
            db_path = f.name

        try:
            db = EmbeddedDatabase(db_path)
            db.insert_file('/test/file.txt', 100, 'h1', 'hot')
            db.close()

            # Reopen
            db = EmbeddedDatabase(db_path)
            file = db.get_file_by_path('/test/file.txt')
            assert file is not None
            db.close()
        finally:
            os.unlink(db_path)


# =============================================================================
# Test Cache Hierarchy
# =============================================================================

class TestCacheHierarchy:
    """Test 3-tier cache hierarchy."""

    def test_cache_creation(self):
        """Cache should be created with tiers."""
        cache = CacheHierarchy()
        stats = cache.get_stats()

        assert stats['l1_entries'] == 0
        assert stats['l2_entries'] == 0
        assert stats['l3_entries'] == 0

    def test_set_and_get_l1(self):
        """Should set and get from L1."""
        cache = CacheHierarchy()

        cache.set('key1', 'value1', tier=CacheTier.L1_METADATA)
        result = cache.get('key1')

        assert result == 'value1'
        assert cache._stats['l1_hits'] == 1

    def test_set_and_get_l2(self):
        """Should set and get from L2."""
        cache = CacheHierarchy()

        cache.set('key1', 'value1', tier=CacheTier.L2_HOT_ZONE)
        result = cache.get('key1')

        assert result == 'value1'

    def test_set_and_get_l3(self):
        """Should set and get from L3."""
        cache = CacheHierarchy()

        cache.set('key1', 'value1', tier=CacheTier.L3_CDN)
        result = cache.get('key1')

        assert result == 'value1'

    def test_cache_miss(self):
        """Should return None on miss."""
        cache = CacheHierarchy()

        result = cache.get('nonexistent')
        assert result is None
        assert cache._stats['l1_misses'] >= 1

    def test_ttl_expiration(self):
        """Should expire entries after TTL."""
        cache = CacheHierarchy()

        cache.set('key1', 'value1', ttl_seconds=0.01)
        time.sleep(0.02)

        result = cache.get('key1')
        assert result is None

    def test_lru_eviction(self):
        """Should evict LRU entries."""
        cache = CacheHierarchy(l1_size=3)

        cache.set('k1', 'v1')
        cache.set('k2', 'v2')
        cache.set('k3', 'v3')
        cache.set('k4', 'v4')  # Should evict k1

        assert cache.get('k1') is None
        assert cache.get('k2') == 'v2'

    def test_invalidate(self):
        """Should invalidate cache entry."""
        cache = CacheHierarchy()

        cache.set('key1', 'value1')
        cache.invalidate('key1')

        result = cache.get('key1')
        assert result is None

    def test_clear(self):
        """Should clear all tiers."""
        cache = CacheHierarchy()

        cache.set('k1', 'v1', tier=CacheTier.L1_METADATA)
        cache.set('k2', 'v2', tier=CacheTier.L2_HOT_ZONE)
        cache.set('k3', 'v3', tier=CacheTier.L3_CDN)
        cache.clear()

        stats = cache.get_stats()
        assert stats['l1_entries'] == 0
        assert stats['l2_entries'] == 0
        assert stats['l3_entries'] == 0

    def test_get_hit_rate(self):
        """Should calculate hit rate."""
        cache = CacheHierarchy()

        cache.set('k1', 'v1')
        cache.get('k1')  # Hit
        cache.get('k2')  # Miss

        rates = cache.get_hit_rate()
        assert 0 <= rates['l1_hit_rate'] <= 1

    def test_get_stats(self):
        """Should return cache statistics."""
        cache = CacheHierarchy()

        cache.set('k1', 'v1')
        cache.get('k1')

        stats = cache.get_stats()
        assert 'l1_hits' in stats
        assert 'l1_misses' in stats


import time  # For TTL test


# =============================================================================
# Test HTTP Server
# =============================================================================

class TestMinimalHTTPServer:
    """Test minimal HTTP server."""

    def test_server_creation(self):
        """Server should be created."""
        server = MinimalHTTPServer()
        assert server._host == '127.0.0.1'
        assert server._port == 8080

    def test_route_registration(self):
        """Should register routes."""
        server = MinimalHTTPServer()

        @server.route('/test', HTTPMethod.GET)
        def handler(req):
            return HTTPResponse(200, {}, b'OK')

        assert 'GET:/test' in server._routes

    def test_websocket_registration(self):
        """Should register WebSocket handlers."""
        server = MinimalHTTPServer()

        @server.websocket('/ws')
        async def handler(reader, writer):
            pass

        assert '/ws' in server._websocket_handlers

    def test_format_response(self):
        """Should format HTTP response."""
        server = MinimalHTTPServer()

        response = HTTPResponse(
            status=200,
            headers={'Content-Type': 'text/plain'},
            body=b'Hello'
        )

        formatted = server._format_response(response)

        assert b'HTTP/1.1 200 OK' in formatted
        assert b'Content-Type: text/plain' in formatted
        assert b'Hello' in formatted

    def test_get_stats(self):
        """Should return server statistics."""
        server = MinimalHTTPServer()
        stats = server.get_stats()

        assert stats['host'] == '127.0.0.1'
        assert stats['port'] == 8080
        assert stats['running'] == False


# =============================================================================
# Test Security Sandbox
# =============================================================================

class TestSecuritySandbox:
    """Test security sandbox."""

    def test_sandbox_creation(self):
        """Sandbox should be created."""
        sandbox = SecuritySandbox()
        assert len(sandbox._contexts) == 0

    def test_create_context(self):
        """Should create security context."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context(
            capabilities=[Capability.READ, Capability.WRITE]
        )

        assert context_id is not None
        assert len(sandbox._contexts) == 1

    def test_check_capability_allowed(self):
        """Should allow permitted capability."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context(
            capabilities=[Capability.READ]
        )

        assert sandbox.check_capability(context_id, Capability.READ) == True

    def test_check_capability_denied(self):
        """Should deny unpermitted capability."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context(
            capabilities=[Capability.READ]
        )

        assert sandbox.check_capability(context_id, Capability.WRITE) == False

    def test_check_resource_within_limit(self):
        """Should allow resource within limit."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context(
            limits={'memory_mb': 512}
        )

        assert sandbox.check_resource(context_id, 'memory_mb', 256) == True

    def test_check_resource_exceeded(self):
        """Should deny resource exceeding limit."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context(
            limits={'memory_mb': 512}
        )

        assert sandbox.check_resource(context_id, 'memory_mb', 1024) == False

    def test_grant_capability(self):
        """Should grant capability."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context(capabilities=[Capability.READ])
        sandbox.grant_capability(context_id, Capability.WRITE)

        assert sandbox.check_capability(context_id, Capability.WRITE) == True

    def test_revoke_capability(self):
        """Should revoke capability."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context(
            capabilities=[Capability.READ, Capability.WRITE]
        )
        sandbox.revoke_capability(context_id, Capability.WRITE)

        assert sandbox.check_capability(context_id, Capability.WRITE) == False

    def test_destroy_context(self):
        """Should destroy context."""
        sandbox = SecuritySandbox()

        context_id = sandbox.create_context()
        sandbox.destroy_context(context_id)

        assert sandbox.get_context(context_id) is None

    def test_get_stats(self):
        """Should return sandbox statistics."""
        sandbox = SecuritySandbox()

        sandbox.create_context(capabilities=[Capability.READ])
        sandbox.check_capability('invalid', Capability.WRITE)

        stats = sandbox.get_stats()
        assert stats['contexts_created'] >= 1


# =============================================================================
# Test OpenTelemetry Bridge
# =============================================================================

class TestOpenTelemetryBridge:
    """Test OpenTelemetry bridge."""

    def test_bridge_creation(self):
        """Bridge should be created."""
        telemetry = OpenTelemetryBridge()
        assert telemetry._service_name == 'pixelrts'

    def test_counter(self):
        """Should record counter metric."""
        telemetry = OpenTelemetryBridge()

        telemetry.counter('requests', 5)
        telemetry.counter('requests', 3)

        assert 'requests' in telemetry._counters
        # Find the counter value
        total = sum(v for k, v in telemetry._counters.items() if 'requests' in k)
        assert total == 8

    def test_gauge(self):
        """Should record gauge metric."""
        telemetry = OpenTelemetryBridge()

        telemetry.gauge('temperature', 25.5)

        assert 'temperature' in telemetry._gauges

    def test_histogram(self):
        """Should record histogram metric."""
        telemetry = OpenTelemetryBridge()

        telemetry.histogram('latency', 10.0)
        telemetry.histogram('latency', 20.0)
        telemetry.histogram('latency', 30.0)

        assert 'latency' in telemetry._histograms
        assert len(telemetry._histograms['latency']) == 3

    def test_labels(self):
        """Should handle metric labels."""
        telemetry = OpenTelemetryBridge()

        telemetry.counter('requests', 1, labels={'method': 'GET'})
        telemetry.counter('requests', 1, labels={'method': 'POST'})

        # Both should be recorded
        assert len(telemetry._metrics_history) == 2

    def test_set_alert(self):
        """Should set alert condition."""
        telemetry = OpenTelemetryBridge()

        telemetry.set_alert(
            'high_latency',
            lambda v: v > 100,
            'Latency too high'
        )

        assert len(telemetry._alerts) == 1

    def test_check_alerts(self):
        """Should check alert conditions."""
        telemetry = OpenTelemetryBridge()
        alert_triggered = []

        telemetry.set_alert(
            'high_value',
            lambda v: v > 50,
            'Value too high'
        )

        telemetry.on_alert(lambda n, m, v: alert_triggered.append(n))

        telemetry.gauge('high_value', 75)
        telemetry.check_alerts()

        assert 'high_value' in alert_triggered

    def test_export_prometheus(self):
        """Should export Prometheus format."""
        telemetry = OpenTelemetryBridge()

        telemetry.counter('requests', 10)
        telemetry.gauge('memory', 1024)

        exported = telemetry.export_prometheus()

        assert 'requests' in exported
        assert 'memory' in exported

    def test_get_stats(self):
        """Should return telemetry statistics."""
        telemetry = OpenTelemetryBridge()

        telemetry.counter('test', 1)
        stats = telemetry.get_stats()

        assert stats['metrics_recorded'] >= 1


# =============================================================================
# Test Health Checker
# =============================================================================

class TestHealthChecker:
    """Test health check system."""

    def test_checker_creation(self):
        """Checker should be created."""
        checker = HealthChecker()
        assert len(checker._checks) == 0

    def test_register_check(self):
        """Should register health check."""
        checker = HealthChecker()

        checker.register_check('database', lambda: True)

        assert 'database' in checker._checks

    def test_run_checks_healthy(self):
        """Should run healthy checks."""
        checker = HealthChecker()

        checker.register_check('check1', lambda: True)
        checker.register_check('check2', lambda: True)

        result = checker.run_checks()

        assert result['healthy'] == True
        assert result['checks']['check1']['healthy'] == True

    def test_run_checks_unhealthy(self):
        """Should detect unhealthy checks."""
        checker = HealthChecker()

        checker.register_check('good', lambda: True)
        checker.register_check('bad', lambda: False)

        result = checker.run_checks()

        assert result['healthy'] == False
        assert result['checks']['bad']['healthy'] == False

    def test_run_checks_exception(self):
        """Should handle check exceptions."""
        checker = HealthChecker()

        def failing_check():
            raise Exception("Check failed")

        checker.register_check('failing', failing_check)

        result = checker.run_checks()

        assert result['healthy'] == False
        assert 'error' in result['checks']['failing']

    def test_get_stats(self):
        """Should return health checker statistics."""
        checker = HealthChecker()

        checker.register_check('test', lambda: True)
        checker.run_checks()

        stats = checker.get_stats()

        assert stats['checks_run'] >= 1
        assert stats['registered_checks'] == 1


# =============================================================================
# Test Production Manager
# =============================================================================

class TestProductionManager:
    """Test unified production manager."""

    def test_manager_creation(self):
        """Manager should be created with all components."""
        manager = ProductionManager()

        assert manager.compute is not None
        assert manager.vision is not None
        assert manager.database is not None
        assert manager.cache is not None
        assert manager.http is not None
        assert manager.sandbox is not None
        assert manager.telemetry is not None
        assert manager.health is not None

    def test_get_comprehensive_stats(self):
        """Should return all statistics."""
        manager = ProductionManager()

        stats = manager.get_comprehensive_stats()

        assert 'compute' in stats
        assert 'vision' in stats
        assert 'database' in stats
        assert 'cache' in stats
        assert 'http' in stats
        assert 'sandbox' in stats
        assert 'telemetry' in stats
        assert 'health' in stats

    def test_health_checks_registered(self):
        """Should have default health checks."""
        manager = ProductionManager()

        stats = manager.health.get_stats()
        assert stats['registered_checks'] >= 1


class TestCreateProductionManager:
    """Test production manager factory."""

    def test_create_default(self):
        """Should create with defaults."""
        manager = create_production_manager()
        assert manager is not None

    def test_create_with_config(self):
        """Should create with config."""
        manager = create_production_manager({
            'http_port': 9000,
            'db_path': ':memory:'
        })

        assert manager.http._port == 9000


# =============================================================================
# Integration Tests
# =============================================================================

class TestIntegration:
    """Integration tests for production features."""

    def test_compute_and_vision_integration(self):
        """Test compute and vision working together."""
        manager = ProductionManager()

        # Create test image
        png_data = (
            b'\x89PNG\r\n\x1a\n'
            b'\x00\x00\x00\rIHDR'
            b'\x00\x00\x00\x10'  # 16x16
            b'\x00\x00\x00\x10'
            b'\x08\x02\x00\x00\x00'
            b'\x00\x00\x00\x00'
        )

        # Analyze with vision
        vision_results = manager.vision.analyze(png_data, models=['clip'])

        # Process with compute
        hashed, _ = manager.compute.dispatch('sha256_block', png_data)

        assert 'clip' in vision_results
        assert len(hashed) == 32

    def test_database_and_cache_integration(self):
        """Test database and cache working together."""
        manager = ProductionManager()

        # Insert file
        file_id = manager.database.insert_file(
            '/data/model.bin',
            1024 * 1024,
            'hash123',
            'hot'
        )

        # Cache metadata
        manager.cache.set(
            f'file:{file_id}',
            {'path': '/data/model.bin', 'size': 1024 * 1024},
            tier=CacheTier.L1_METADATA
        )

        # Retrieve from cache
        cached = manager.cache.get(f'file:{file_id}')
        assert cached is not None
        assert cached['path'] == '/data/model.bin'

    def test_security_and_telemetry_integration(self):
        """Test security and telemetry working together."""
        manager = ProductionManager()

        # Create context
        context_id = manager.sandbox.create_context(
            capabilities=[Capability.READ, Capability.EXECUTE]
        )

        # Check capability with telemetry
        allowed = manager.sandbox.check_capability(context_id, Capability.READ)
        manager.telemetry.counter(
            'capability_check',
            1,
            labels={'result': 'allowed' if allowed else 'denied'}
        )

        # Record violation attempt
        denied = manager.sandbox.check_capability(context_id, Capability.ADMIN)
        manager.telemetry.counter(
            'capability_check',
            1,
            labels={'result': 'allowed' if denied else 'denied'}
        )

        stats = manager.telemetry.get_stats()
        assert stats['metrics_recorded'] >= 2

    def test_full_production_workflow(self):
        """Test complete production workflow."""
        manager = ProductionManager()

        # 1. Create security context
        context_id = manager.sandbox.create_context(
            capabilities=[Capability.READ, Capability.WRITE, Capability.NETWORK]
        )

        # 2. Insert file into database
        file_id = manager.database.insert_file(
            '/app/config.json',
            256,
            'config_hash',
            'hot'
        )

        # 3. Cache file metadata
        manager.cache.set(
            f'metadata:{file_id}',
            {'loaded': True, 'version': '1.0'},
            tier=CacheTier.L1_METADATA
        )

        # 4. Record metrics
        manager.telemetry.counter('file_operations', 1)
        manager.telemetry.gauge('cache_entries', 1)

        # 5. Run health checks
        health = manager.health.run_checks()

        # 6. Get comprehensive stats
        stats = manager.get_comprehensive_stats()

        assert health['healthy'] == True
        assert stats['database']['file_count'] == 1
        assert stats['cache']['l1_entries'] >= 1
        assert stats['telemetry']['metrics_recorded'] >= 2
