"""
Evolution Daemon V12 - RTS Doctor Subsystem

This subsystem is responsible for continuously monitoring and maintaining
the health and integrity of PixelRTS v2 (.rts.png) files.

Integrity checks include:
- SHA256 Hash Verification
- Hilbert Curve Locality Analysis
- Entropy Analysis

Self-healing mechanisms include:
- Re-generation from source binary
- Defragmentation (re-optimizing Hilbert curve mapping)
- Quarantine and alerting for unrecoverable anomalies
"""

import logging
import subprocess
from typing import List, Dict, Any, Optional

# Assuming EvolutionProposal and GuardianVerdict are relevant for context or future integration
from .data_structures import EvolutionProposal, GuardianVerdict, HealthPrediction
from .prognostics_store import PrognosticsStore
from .prognostics_engine import PrognosticsEngine

import hashlib
import json
import os
import math
import numpy as np
from PIL import Image
from typing import Dict, Any, Optional, Tuple

logger = logging.getLogger("evolution_daemon.rts_doctor")

class HilbertCurve:
    """Hilbert curve mapping for preserving memory locality"""

    @staticmethod
    def index_to_xy(index: int, order: int) -> Tuple[int, int]:
        """
        Convert Hilbert curve index to (x, y) coordinates.
        Preserves locality: adjacent indices → adjacent pixels.
        Uses standard Hilbert curve algorithm.
        """
        x, y = 0, 0
        s = 1
        idx = index

        for i in range(order):
            # Calculate quadrant bits (rx, ry)
            rx = 1 & (idx // 2)
            ry = 1 & (idx ^ rx)

            # Rotate/flip quadrant
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x

            x = x + s * rx
            y = y + s * ry
            idx = idx // 4
            s = s * 2

        return x, y

class RTSDoctor:
    """
    Monitors and maintains the integrity of PixelRTS v2 (.rts.png) files.

    V13: Integrated with prognostics for predictive health monitoring.
    """
    def __init__(self, prognostics_db_path: Optional[str] = None):
        """
        Initialize the RTS Doctor.

        Args:
            prognostics_db_path: Optional path to SQLite database for prognostics.
                                 If provided, enables predictive health monitoring.
        """
        self._prognostics_store: Optional[PrognosticsStore] = None
        self._prognostics_engine: Optional[PrognosticsEngine] = None

        if prognostics_db_path:
            self._prognostics_store = PrognosticsStore(prognostics_db_path)
            self._prognostics_engine = PrognosticsEngine(self._prognostics_store)
            logger.info(f"RTS Doctor initialized with prognostics at {prognostics_db_path}")
        else:
            logger.info("RTS Doctor initialized (prognostics disabled).")

    async def check_integrity(self, rts_path: str, meta_path: str) -> Dict[str, Any]:
        """
        Performs a series of integrity checks on an RTS file.

        Args:
            rts_path: Path to the .rts.png file.
            meta_path: Path to the .rts.meta.json file.

        Returns:
            A dictionary of integrity check results and findings.
        """
        logger.info(f"Checking integrity for RTS: {rts_path}")
        results = {
            "rts_path": rts_path,
            "meta_path": meta_path,
            "is_healthy": True,
            "issues": [],
            "recommendations": []
        }

        # 1. SHA256 Hash Verification
        hash_check_result = await self._verify_sha256(rts_path, meta_path)
        if not hash_check_result["passed"]:
            results["is_healthy"] = False
            results["issues"].append(hash_check_result["issue"])
            results["recommendations"].append(hash_check_result["recommendation"])

        # 2. Hilbert Curve Locality Analysis (Placeholder)
        locality_score_result = await self._analyze_hilbert_locality(rts_path)
        if locality_score_result["score"] < 0.7: # Example threshold
            results["is_healthy"] = False
            results["issues"].append(f"Low Hilbert locality score: {locality_score_result['score']:.2f}")
            results["recommendations"].append("Consider RTS defragmentation.")

        # 3. Entropy Analysis (Placeholder)
        entropy_result = await self._analyze_entropy(rts_path)
        if entropy_result["anomaly_detected"]:
            results["is_healthy"] = False
            results["issues"].append(f"Entropy anomaly detected: {entropy_result['details']}")
            results["recommendations"].append("Investigate potential data corruption or inefficient packing.")

        # 4. Log to prognostics store if enabled (V13)
        if self._prognostics_store is not None:
            self._log_to_prognostics(rts_path, locality_score_result, entropy_result)

        logger.info(f"Integrity check for {rts_path} complete. Healthy: {results['is_healthy']}")
        return results

    async def _verify_sha256(self, rts_path: str, meta_path: str) -> Dict[str, Any]:
        """Verifies the SHA256 hash of an RTS file against its metadata."""
        logger.debug(f"Verifying SHA256 for {rts_path} using {meta_path}")
        try:
            # Read expected hash from metadata
            with open(meta_path, 'r') as f:
                meta_data = json.load(f)
            expected_hash = meta_data.get("sha256")
            if not expected_hash:
                return {"passed": False, "issue": "Missing 'sha256' in metadata.", "recommendation": "Re-generate metadata."}

            # Calculate actual hash of the RTS file
            sha256_hash = hashlib.sha256()
            with open(rts_path, "rb") as f:
                for byte_block in iter(lambda: f.read(4096), b""):
                    sha256_hash.update(byte_block)
            actual_hash = sha256_hash.hexdigest()

            # Compare hashes
            if actual_hash == expected_hash:
                return {"passed": True, "issue": None, "recommendation": None}
            else:
                return {
                    "passed": False,
                    "issue": f"SHA256 mismatch. Expected {expected_hash}, got {actual_hash}.",
                    "recommendation": "Re-generate RTS from source binary."
                }
        except FileNotFoundError as e:
            return {"passed": False, "issue": f"File not found: {e.filename}", "recommendation": "Ensure both RTS and metadata files exist."}
        except json.JSONDecodeError:
            return {"passed": False, "issue": f"Invalid JSON in metadata file: {meta_path}", "recommendation": "Re-generate metadata."}
        except Exception as e:
            logger.error(f"An unexpected error occurred during SHA256 verification: {e}")
            return {"passed": False, "issue": f"An unexpected error occurred: {e}", "recommendation": "Manual inspection required."}

    async def _analyze_hilbert_locality(self, rts_path: str, num_samples: int = 1000) -> Dict[str, Any]:
        """
        Analyzes the Hilbert curve locality of an RTS file.

        A high score indicates that adjacent bytes in the 1D source
        are also adjacent pixels in the 2D RTS representation, which
        is the desired property of the Hilbert curve mapping.

        Args:
            rts_path: Path to the .rts.png file.
            num_samples: Number of samples to take for the analysis.

        Returns:
            A dictionary containing the locality score.
        """
        logger.debug(f"Analyzing Hilbert locality for {rts_path}")
        try:
            with Image.open(rts_path) as img:
                width, height = img.size
                if width != height:
                    return {"score": 0.0, "error": "Image is not square."}
                
                # Check if width is a power of 2
                if (width & (width - 1)) != 0 or width == 0:
                    return {"score": 0.0, "error": "Image width is not a power of 2."}
                
                grid_size = width
                order = int(math.log2(grid_size))
                total_pixels = grid_size * grid_size

            adjacent_samples = 0
            if total_pixels <= num_samples:
                # If the image is small, check all pixels
                indices = range(total_pixels - 1)
            else:
                # Otherwise, take random samples
                indices = np.random.randint(0, total_pixels - 2, size=num_samples)

            for i in indices:
                x1, y1 = HilbertCurve.index_to_xy(i, order)
                x2, y2 = HilbertCurve.index_to_xy(i + 1, order)
                
                # Calculate squared Euclidean distance
                distance_sq = (x1 - x2)**2 + (y1 - y2)**2
                
                # Check if distance is 1 (i.e., pixels are adjacent)
                if distance_sq == 1:
                    adjacent_samples += 1
            
            locality_score = adjacent_samples / len(indices) if len(indices) > 0 else 1.0
            return {"score": locality_score}

        except FileNotFoundError:
            return {"score": 0.0, "error": "RTS file not found."}
        except Exception as e:
            logger.error(f"An unexpected error occurred during Hilbert locality analysis: {e}")
            return {"score": 0.0, "error": str(e)}

    async def _analyze_entropy(self, rts_path: str, block_size: int = 16384) -> Dict[str, Any]:
        """
        Analyzes the block-based entropy of an RTS file.

        Args:
            rts_path: Path to the .rts.png file.
            block_size: The size of blocks to analyze for entropy.

        Returns:
            A dictionary with entropy analysis results.
        """
        logger.debug(f"Analyzing entropy for {rts_path}")
        try:
            # 1. Extract raw bytes from the RTS image
            with Image.open(rts_path) as img:
                width, height = img.size
                if width != height or (width & (width - 1)) != 0 or width == 0:
                    return {"anomaly_detected": True, "details": "Invalid image dimensions for entropy analysis."}
                
                grid_size = width
                order = int(math.log2(grid_size))
                img_data = np.array(img)

            # Generate Hilbert LUT (simplified from converter)
            total_pixels = grid_size * grid_size
            lut = np.zeros((total_pixels, 2), dtype=np.uint32)
            for d in range(total_pixels):
                x, y = HilbertCurve.index_to_xy(d, order)
                lut[d] = [x, y]

            ordered_pixels = img_data[lut[:, 1], lut[:, 0]]
            all_bytes = ordered_pixels.tobytes()

            # 2. Calculate block entropy
            total_bytes = len(all_bytes)
            num_blocks = (total_bytes + block_size - 1) // block_size
            
            entropy_per_block = []
            for i in range(num_blocks):
                start = i * block_size
                end = min(start + block_size, total_bytes)
                chunk = all_bytes[start:end]
                
                if len(chunk) == 0:
                    continue
                
                freq = np.bincount(np.frombuffer(chunk, dtype=np.uint8), minlength=256).astype(np.float32)
                freq /= max(1, len(chunk))
                
                mask = freq > 0
                entropy = -np.sum(freq[mask] * np.log2(freq[mask]))
                entropy_per_block.append(entropy)

            # 3. Analyze for anomalies
            mean_entropy = np.mean(entropy_per_block) if entropy_per_block else 0
            std_dev = np.std(entropy_per_block) if entropy_per_block else 0
            
            # Anomaly: A block with zero entropy (unless it's the last, possibly padding block)
            # or a block with entropy significantly different from the mean.
            anomalies = []
            for i, entropy in enumerate(entropy_per_block):
                if entropy == 0.0:
                    # If it's a single block file, zero entropy is an anomaly.
                    # If it's a multi-block file, only flag if it's not the last block.
                    if num_blocks == 1 or i < num_blocks - 1:
                        anomalies.append(f"Block {i} has zero entropy.")
                if std_dev > 0 and abs(entropy - mean_entropy) > 3 * std_dev: # 3 standard deviations
                    anomalies.append(f"Block {i} has anomalous entropy ({entropy:.2f}, mean: {mean_entropy:.2f})")

            if anomalies:
                return {"anomaly_detected": True, "details": "; ".join(anomalies)}
            else:
                return {"anomaly_detected": False, "details": f"Mean entropy: {mean_entropy:.2f}"}

        except FileNotFoundError:
            return {"anomaly_detected": True, "details": "RTS file not found."}
        except Exception as e:
            logger.error(f"An unexpected error occurred during entropy analysis: {e}")
            return {"anomaly_detected": True, "details": str(e)}

    async def heal_rts(self, rts_path: str, healing_action: str, original_binary_path: Optional[str] = None) -> bool:
        """
        Attempts to heal an unhealthy RTS file based on the recommended action.

        Args:
            rts_path: Path to the .rts.png file.
            healing_action: The action to take (e.g., "re_generate", "defragment", "quarantine").
            original_binary_path: Optional path to the original binary for re-generation.

        Returns:
            True if healing was successful, False otherwise.
        """
        logger.info(f"Attempting to heal RTS: {rts_path} with action: {healing_action}")
        if healing_action == "re_generate":
            return await self._re_generate_rts(rts_path, original_binary_path)
        elif healing_action == "defragment":
            return await self._defragment_rts(rts_path, original_binary_path)
        elif healing_action == "quarantine":
            return await self._quarantine_rts(rts_path)
        else:
            logger.warning(f"Unknown healing action: {healing_action}")
            return False

    async def _re_generate_rts(self, rts_path: str, original_binary_path: Optional[str]) -> bool:
        """Re-generates an RTS file from its source binary using the converter script."""
        if not original_binary_path or not os.path.exists(original_binary_path):
            logger.error(f"Cannot re-generate {rts_path}: original binary path '{original_binary_path}' not provided or does not exist.")
            return False
            
        logger.debug(f"Re-generating {rts_path} from {original_binary_path}")
        try:
            # Assuming the converter script is in the project root and executable
            converter_script = os.path.join(os.getcwd(), "pixelrts_v2_converter.py")
            python_executable = os.path.join(os.getcwd(), ".venv/bin/python3")

            result = subprocess.run(
                [python_executable, converter_script, original_binary_path, rts_path],
                capture_output=True,
                text=True,
                check=True
            )
            logger.info(f"Successfully re-generated {rts_path}. Converter output:\n{result.stdout}")
            return True
        except FileNotFoundError:
            logger.error(f"Failed to re-generate {rts_path}: converter script or python executable not found.")
            return False
        except subprocess.CalledProcessError as e:
            logger.error(f"Failed to re-generate {rts_path}. Converter script failed with exit code {e.returncode}:\n{e.stderr}")
            return False
        except Exception as e:
            logger.error(f"An unexpected error occurred during re-generation: {e}")
            return False

    async def _defragment_rts(self, rts_path: str, original_binary_path: Optional[str] = None) -> bool:
        """Defragments an RTS file by re-generating it, which re-optimizes the Hilbert curve mapping."""
        logger.debug(f"Defragmenting {rts_path} by re-generating...")
        return await self._re_generate_rts(rts_path, original_binary_path)

    async def _quarantine_rts(self, rts_path: str, quarantine_dir: str = "quarantine") -> bool:
        """Moves an unrecoverable RTS file to a quarantine directory."""
        logger.warning(f"Quarantining unhealthy RTS: {rts_path}")
        try:
            quarantine_path = os.path.join(os.path.dirname(rts_path), quarantine_dir)
            os.makedirs(quarantine_path, exist_ok=True)

            file_name = os.path.basename(rts_path)
            new_path = os.path.join(quarantine_path, file_name)

            os.rename(rts_path, new_path)

            logger.info(f"Moved {rts_path} to {new_path}")
            return True
        except Exception as e:
            logger.error(f"Failed to quarantine {rts_path}: {e}")
            return False

    # ========================================================================
    # V13 Prognostics Integration
    # ========================================================================

    def _log_to_prognostics(
        self,
        rts_path: str,
        locality_result: Dict[str, Any],
        entropy_result: Dict[str, Any]
    ):
        """Log integrity check results to the prognostics store."""
        if self._prognostics_store is None:
            return

        try:
            # Extract metrics
            file_size = os.path.getsize(rts_path) if os.path.exists(rts_path) else 0
            file_age_days = self._get_file_age_days(rts_path)
            hilbert_locality = locality_result.get("score", 0.0)
            mean_entropy = self._extract_mean_entropy(entropy_result)

            # Modification count is estimated from file stats for now
            # In production, this would come from version control or file metadata
            modification_count = 0  # Placeholder - would track actual modifications

            self._prognostics_store.log_integrity_check(
                rts_path=rts_path,
                file_size=file_size,
                modification_count=modification_count,
                file_age_days=file_age_days,
                hilbert_locality=hilbert_locality,
                mean_entropy=mean_entropy
            )

            logger.debug(f"Logged prognostics data for {rts_path}")

        except Exception as e:
            logger.error(f"Failed to log prognostics data: {e}")

    def _get_file_age_days(self, file_path: str) -> float:
        """Get the age of a file in days."""
        try:
            import time
            stat = os.stat(file_path)
            creation_time = stat.st_ctime
            age_seconds = time.time() - creation_time
            return age_seconds / (24 * 3600)  # Convert to days
        except Exception:
            return 0.0

    def _extract_mean_entropy(self, entropy_result: Dict[str, Any]) -> float:
        """Extract mean entropy value from entropy analysis result."""
        details = entropy_result.get("details", "")

        # Parse from details string like "Mean entropy: 7.23"
        if "Mean entropy:" in details:
            try:
                parts = details.split("Mean entropy:")
                if len(parts) > 1:
                    value_str = parts[1].strip().split()[0]
                    return float(value_str)
            except (ValueError, IndexError):
                pass

        # Default entropy value if parsing fails
        return 0.0

    def predict_health(self, rts_path: str, horizon_hours: int = 24) -> Optional[HealthPrediction]:
        """
        Predict the future health of an RTS file.

        Args:
            rts_path: Path to the RTS file to predict.
            horizon_hours: How far into the future to predict (default 24 hours).

        Returns:
            HealthPrediction if prognostics is enabled and data available,
            None otherwise.
        """
        if self._prognostics_engine is None:
            return None

        try:
            # Get current metrics
            history = self._prognostics_store.get_history(rts_path, limit=1)
            if not history:
                logger.debug(f"No history data for {rts_path}, cannot predict")
                return None

            latest = history[0]

            prediction = self._prognostics_engine.predict(
                rts_path=rts_path,
                file_size=latest.get("file_size", 0),
                modification_count=latest.get("modification_count", 0),
                file_age_days=latest.get("file_age_days", 0.0),
                current_locality=latest.get("hilbert_locality", 0.0),
                current_entropy=latest.get("mean_entropy", 0.0),
                horizon_hours=horizon_hours
            )

            logger.debug(f"Predicted health for {rts_path}: {prediction.predicted_health_score:.2f}")
            return prediction

        except Exception as e:
            logger.error(f"Failed to predict health for {rts_path}: {e}")
            return None
