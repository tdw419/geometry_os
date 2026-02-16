import pytest
import os
import json
import hashlib
import tempfile
import asyncio

from PIL import Image
import numpy as np

from systems.evolution_daemon.safety.rts_doctor import RTSDoctor, HilbertCurve

@pytest.fixture
def rts_files(tmp_path):
    """Fixture to create temporary RTS and metadata files for testing."""
    rts_doctor = RTSDoctor()
    rts_content = b"This is a test RTS file."
    rts_hash = hashlib.sha256(rts_content).hexdigest()

    # Valid files
    valid_rts_path = tmp_path / "valid.rts.png"
    valid_meta_path = tmp_path / "valid.rts.meta.json"
    valid_rts_path.write_bytes(rts_content)
    with open(valid_meta_path, 'w') as f:
        json.dump({"sha256": rts_hash}, f)

    # Mismatched hash
    mismatched_rts_path = tmp_path / "mismatched.rts.png"
    mismatched_meta_path = tmp_path / "mismatched.rts.meta.json"
    mismatched_rts_path.write_bytes(b"Different content.")
    with open(mismatched_meta_path, 'w') as f:
        json.dump({"sha256": rts_hash}, f)

    # Invalid JSON
    invalid_json_meta_path = tmp_path / "invalid.rts.meta.json"
    invalid_json_meta_path.write_text("{ not json }")

    # Missing SHA256 key
    missing_key_meta_path = tmp_path / "missing_key.rts.meta.json"
    with open(missing_key_meta_path, 'w') as f:
        json.dump({"other_key": "value"}, f)

    # Valid Hilbert image (32x32)
    valid_hilbert_path = tmp_path / "valid_hilbert.rts.png"
    Image.new('RGBA', (32, 32)).save(valid_hilbert_path)

    # Non-square image
    non_square_path = tmp_path / "non_square.rts.png"
    Image.new('RGBA', (32, 33)).save(non_square_path)

    # Non-power-of-2 square image
    non_power_of_2_path = tmp_path / "non_power_of_2.rts.png"
    Image.new('RGBA', (30, 30)).save(non_power_of_2_path)

    # Low entropy image (all zeros)
    low_entropy_path = tmp_path / "low_entropy.rts.png"
    Image.new('RGBA', (32, 32), (0, 0, 0, 0)).save(low_entropy_path)

    # High entropy image (random data)
    high_entropy_path = tmp_path / "high_entropy.rts.png"
    random_data = np.random.randint(0, 256, (32, 32, 4), dtype=np.uint8)
    Image.fromarray(random_data, 'RGBA').save(high_entropy_path)

    # File to be quarantined
    quarantine_file_path = tmp_path / "quarantine_me.rts.png"
    quarantine_file_path.write_text("This file should be quarantined.")

    return {
        "rts_doctor": rts_doctor,
        "valid_rts_path": str(valid_rts_path),
        "valid_meta_path": str(valid_meta_path),
        "mismatched_rts_path": str(mismatched_rts_path),
        "mismatched_meta_path": str(mismatched_meta_path),
        "invalid_json_meta_path": str(invalid_json_meta_path),
        "missing_key_meta_path": str(missing_key_meta_path),
        "valid_hilbert_path": str(valid_hilbert_path),
        "non_square_path": str(non_square_path),
        "non_power_of_2_path": str(non_power_of_2_path),
        "low_entropy_path": str(low_entropy_path),
        "high_entropy_path": str(high_entropy_path),
        "quarantine_file_path": str(quarantine_file_path),
        "tmp_path": str(tmp_path)
    }

@pytest.mark.asyncio
async def test_verify_sha256_success(rts_files):
    """Test successful SHA256 verification."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._verify_sha256(rts_files["valid_rts_path"], rts_files["valid_meta_path"])
    assert result["passed"] is True
    assert result["issue"] is None

@pytest.mark.asyncio
async def test_verify_sha256_mismatch(rts_files):
    """Test failed SHA256 verification due to a hash mismatch."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._verify_sha256(rts_files["mismatched_rts_path"], rts_files["mismatched_meta_path"])
    assert result["passed"] is False
    assert "SHA256 mismatch" in result["issue"]

@pytest.mark.asyncio
async def test_verify_sha256_missing_meta_file(rts_files):
    """Test failed SHA256 verification due to a missing metadata file."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._verify_sha256(rts_files["valid_rts_path"], "non_existent.meta.json")
    assert result["passed"] is False
    assert "File not found" in result["issue"]

@pytest.mark.asyncio
async def test_verify_sha256_invalid_json(rts_files):
    """Test failed SHA256 verification due to invalid JSON in the metadata file."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._verify_sha256(rts_files["valid_rts_path"], rts_files["invalid_json_meta_path"])
    assert result["passed"] is False
    assert "Invalid JSON" in result["issue"]

@pytest.mark.asyncio
async def test_verify_sha256_missing_key(rts_files):
    """Test failed SHA256 verification due to missing 'sha256' key in metadata."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._verify_sha256(rts_files["valid_rts_path"], rts_files["missing_key_meta_path"])
    assert result["passed"] is False
    assert "Missing 'sha256' in metadata" in result["issue"]

@pytest.mark.asyncio
async def test_analyze_hilbert_locality_success(rts_files):
    """Test successful Hilbert curve locality analysis."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._analyze_hilbert_locality(rts_files["valid_hilbert_path"])
    assert result["score"] == 1.0
    assert "error" not in result

@pytest.mark.asyncio
async def test_analyze_hilbert_locality_non_square(rts_files):
    """Test Hilbert curve locality analysis on a non-square image."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._analyze_hilbert_locality(rts_files["non_square_path"])
    assert result["score"] == 0.0
    assert result["error"] == "Image is not square."

@pytest.mark.asyncio
async def test_analyze_hilbert_locality_non_power_of_2(rts_files):
    """Test Hilbert curve locality analysis on a non-power-of-2 image."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._analyze_hilbert_locality(rts_files["non_power_of_2_path"])
    assert result["score"] == 0.0
    assert result["error"] == "Image width is not a power of 2."

@pytest.mark.asyncio
async def test_analyze_entropy_low(rts_files):
    """Test entropy analysis on a low-entropy image."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._analyze_entropy(rts_files["low_entropy_path"])
    assert result["anomaly_detected"] is True
    assert "zero entropy" in result["details"]

@pytest.mark.asyncio
async def test_analyze_entropy_high(rts_files):
    """Test entropy analysis on a high-entropy image."""
    rts_doctor = rts_files["rts_doctor"]
    result = await rts_doctor._analyze_entropy(rts_files["high_entropy_path"])
    assert result["anomaly_detected"] is False
    assert "Mean entropy" in result["details"]

@pytest.mark.asyncio
async def test_quarantine_rts(rts_files):
    """Test the quarantine functionality."""
    rts_doctor = rts_files["rts_doctor"]
    file_to_quarantine = rts_files["quarantine_file_path"]
    
    assert os.path.exists(file_to_quarantine)
    
    result = await rts_doctor._quarantine_rts(file_to_quarantine)
    
    assert result is True
    assert not os.path.exists(file_to_quarantine)
    
    quarantine_dir = os.path.join(rts_files["tmp_path"], "quarantine")
    quarantined_file = os.path.join(quarantine_dir, os.path.basename(file_to_quarantine))
    assert os.path.exists(quarantined_file)

@pytest.mark.asyncio
async def test_re_generate_rts(rts_files, mocker):
    """Test the re-generate functionality."""
    rts_doctor = rts_files["rts_doctor"]
    mock_run = mocker.patch("systems.evolution_daemon.safety.rts_doctor.subprocess.run")
    
    rts_path = rts_files["valid_rts_path"]
    binary_path = rts_files["valid_rts_path"] # Just using a valid file path for the test

    result = await rts_doctor._re_generate_rts(rts_path, binary_path)
    
    assert result is True
    mock_run.assert_called_once()
    
@pytest.mark.asyncio
async def test_defragment_rts(rts_files, mocker):
    """Test that defragment calls re-generate."""
    rts_doctor = rts_files["rts_doctor"]
    mock_re_generate = mocker.patch.object(rts_doctor, "_re_generate_rts", return_value=True)

    rts_path = rts_files["valid_rts_path"]
    binary_path = rts_files["valid_rts_path"]

    result = await rts_doctor._defragment_rts(rts_path, binary_path)

    assert result is True
    mock_re_generate.assert_called_once_with(rts_path, binary_path)


# ============================================================================
# V13 Prognostics Integration Tests
# ============================================================================

def test_rts_doctor_logs_to_prognostics_store():
    """Test that RTSDoctor logs integrity checks for predictions."""
    with tempfile.TemporaryDirectory() as tmpdir:
        db_path = os.path.join(tmpdir, "test.db")
        doctor = RTSDoctor(prognostics_db_path=db_path)

        # Create test files
        rts_path = os.path.join(tmpdir, "test.rts.png")
        meta_path = os.path.join(tmpdir, "test.rts.meta.json")

        Image.new('RGBA', (32, 32)).save(rts_path)
        with open(rts_path, 'rb') as f:
            hash_val = hashlib.sha256(f.read()).hexdigest()
        with open(meta_path, 'w') as f:
            json.dump({"sha256": hash_val}, f)

        # Run integrity check
        result = asyncio.run(doctor.check_integrity(rts_path, meta_path))

        # Verify data was logged
        assert doctor._prognostics_store is not None
        history = doctor._prognostics_store.get_history(rts_path)
        assert len(history) == 1


def test_rts_doctor_predicts_health():
    """Test that RTSDoctor can predict future health."""
    with tempfile.TemporaryDirectory() as tmpdir:
        db_path = os.path.join(tmpdir, "test.db")
        doctor = RTSDoctor(prognostics_db_path=db_path)

        # Add some historical data
        for i in range(10):
            doctor._prognostics_store.log_integrity_check(
                rts_path="/test/file.rts.png",
                file_size=4096,
                modification_count=i,
                file_age_days=10.0 + i,
                hilbert_locality=1.0 - i * 0.05,
                mean_entropy=7.0
            )

        # Train and predict
        doctor._prognostics_engine.train()
        prediction = doctor.predict_health("/test/file.rts.png")

        assert prediction is not None
        assert 0.0 <= prediction.predicted_health_score <= 1.0


def test_rts_doctor_without_prognostics():
    """Test that RTSDoctor works without prognostics (backward compatibility)."""
    doctor = RTSDoctor()

    # Should not have prognostics store
    assert doctor._prognostics_store is None
    assert doctor._prognostics_engine is None

    # predict_health should return None
    prediction = doctor.predict_health("/test/file.rts.png")
    assert prediction is None
