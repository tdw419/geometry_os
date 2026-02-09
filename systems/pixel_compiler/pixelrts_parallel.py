"""
Parallel processing for PixelRTS encoding/decoding.
Uses multiprocessing for batch operations and large file processing.
"""

import sys
import multiprocessing as mp
from multiprocessing.pool import Pool
from pathlib import Path
from typing import List, Dict, Optional, Callable, Union
import traceback
from dataclasses import dataclass, asdict

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent))

try:
    from PIL import Image
except ImportError:
    raise ImportError("Pillow required: pip install Pillow")

from pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder


@dataclass
class EncodeResult:
    """Result from encoding a single file."""
    input_path: str
    output_path: Optional[str]
    success: bool
    error: Optional[str] = None
    metadata: Optional[dict] = None
    encode_time: Optional[float] = None
    file_size: Optional[int] = None


def _encode_single_file(args: tuple) -> EncodeResult:
    """
    Worker function to encode a single file.

    Args:
        args: Tuple of (input_path, output_dir, metadata, mode, use_mmap, threshold)

    Returns:
        EncodeResult
    """
    import time
    from pathlib import Path

    input_path, output_dir, metadata, mode, use_mmap, threshold = args
    input_path = Path(input_path)

    result = EncodeResult(
        input_path=str(input_path),
        output_path=None,
        success=False
    )

    try:
        # Check if file exists
        if not input_path.exists():
            result.error = f"File not found: {input_path}"
            return result

        file_size = input_path.stat().st_size
        result.file_size = file_size

        # Generate output path
        output_name = input_path.stem + '.rts.png'
        output_path = Path(output_dir) / output_name
        result.output_path = str(output_path)

        # Read file and encode
        with open(input_path, 'rb') as f:
            data = f.read()

        encoder = PixelRTSEncoder(mode=mode)
        start = time.time()
        encoder.save(
            data=data,
            output_path=str(output_path),
            metadata=metadata,
            sidecar=True
        )
        result.encode_time = time.time() - start

        result.success = True
        result.metadata = encoder.get_metadata()

    except Exception as e:
        result.error = f"{type(e).__name__}: {str(e)}"
        result.error_details = traceback.format_exc()

    return result


def _decode_single_file(args: tuple) -> dict:
    """
    Worker function to encode a single file.

    Args:
        args: Tuple of (input_path, output_dir, metadata, mode, use_mmap, threshold)

    Returns:
        EncodeResult
    """
    import time
    from pathlib import Path

    input_path, output_dir, metadata, mode, use_mmap, threshold = args
    input_path = Path(input_path)

    result = EncodeResult(
        input_path=str(input_path),
        output_path=None,
        success=False
    )

    try:
        # Check if file exists
        if not input_path.exists():
            result.error = f"File not found: {input_path}"
            return result

        file_size = input_path.stat().st_size
        result.file_size = file_size

        # Generate output path
        output_name = input_path.stem + '.rts.png'
        output_path = Path(output_dir) / output_name
        result.output_path = str(output_path)

        # Read file and encode
        with open(input_path, 'rb') as f:
            data = f.read()

        encoder = PixelRTSEncoder(mode=mode)
        start = time.time()
        encoder.save(
            data=data,
            output_path=str(output_path),
            metadata=metadata,
            sidecar=True
        )
        result.encode_time = time.time() - start

        result.success = True
        result.metadata = encoder.get_metadata()

    except Exception as e:
        result.error = f"{type(e).__name__}: {str(e)}"
        result.error_details = traceback.format_exc()

    return result


class ParallelPixelRTSEncoder:
    """
    Parallel encoder for batch processing of multiple files.

    Automatically uses memory mapping for large files based on threshold.
    """

    # Default threshold for using mmap (100MB)
    MMAP_THRESHOLD = 100 * 1024 * 1024

    def __init__(
        self,
        workers: Optional[int] = None,
        mode: str = "standard",
        use_mmap: bool = True,
        mmap_threshold: int = MMAP_THRESHOLD
    ):
        """
        Initialize parallel encoder.

        Args:
            workers: Number of worker processes (default: CPU count)
            mode: Encoding mode ("standard" or "code")
            use_mmap: Whether to use memory mapping for large files
            mmap_threshold: File size threshold for mmap (bytes)
        """
        self.workers = workers or mp.cpu_count()
        self.mode = mode
        self.use_mmap = use_mmap
        self.mmap_threshold = mmap_threshold

    def encode_batch(
        self,
        input_files: List[Union[Path, str]],
        output_dir: Union[Path, str],
        metadata: Optional[dict] = None,
        pattern: str = "*.rts.png",
        progress_callback: Optional[Callable] = None
    ) -> List[Dict]:
        """
        Encode multiple files in parallel.

        Args:
            input_files: List of input file paths
            output_dir: Output directory for encoded files
            metadata: Optional metadata to apply to all files
            pattern: Output file pattern
            progress_callback: Optional callback(current, total, filename)

        Returns:
            List of result dictionaries
        """
        output_dir = Path(output_dir)
        output_dir.mkdir(parents=True, exist_ok=True)

        # Prepare work items
        work_items = []
        for input_file in input_files:
            input_file = Path(input_file)

            # Generate file-specific metadata
            file_metadata = {
                **(metadata or {}),
                'name': input_file.stem,
                'type': self._detect_type(input_file)
            }

            work_items.append((
                str(input_file),
                str(output_dir),
                file_metadata,
                self.mode,
                self.use_mmap,
                self.mmap_threshold
            ))

        # Process in parallel
        results = []
        with Pool(processes=self.workers) as pool:
            # Use imap_unordered for progress tracking
            for i, result in enumerate(pool.imap_unordered(
                _encode_single_file,
                work_items
            )):
                results.append(result)

                if progress_callback:
                    progress_callback(i + 1, len(work_items), Path(result.input_path).name)

        # Sort by input path for consistent ordering
        results.sort(key=lambda r: r.input_path)

        return [self._result_to_dict(r) for r in results]

    def _detect_type(self, file_path: Path) -> str:
        """Detect file type from extension."""
        suffixes = {
            '.wasm': 'wasm',
            '.bin': 'binary',
            '.elf': 'elf',
            '.so': 'library',
            '.dylib': 'library',
            '.dll': 'library',
        }
        return suffixes.get(file_path.suffix.lower(), 'binary')

    def _result_to_dict(self, result: EncodeResult) -> dict:
        """Convert EncodeResult to dictionary."""
        return {
            'input_path': result.input_path,
            'output_path': result.output_path,
            'success': result.success,
            'error': result.error,
            'metadata': result.metadata,
            'encode_time': result.encode_time,
            'file_size': result.file_size
        }

    def encode_directory(
        self,
        input_dir: Union[Path, str],
        output_dir: Union[Path, str],
        pattern: str = "*",
        recursive: bool = False,
        **kwargs
    ) -> List[Dict]:
        """
        Encode all files in a directory.

        Args:
            input_dir: Input directory path
            output_dir: Output directory path
            pattern: File pattern to match (default: all files)
            recursive: Whether to search recursively
            **kwargs: Additional arguments for encode_batch

        Returns:
            List of result dictionaries
        """
        input_dir = Path(input_dir)

        if not input_dir.exists():
            raise ValueError(f"Input directory does not exist: {input_dir}")

        if recursive:
            files = list(input_dir.rglob(pattern))
        else:
            files = list(input_dir.glob(pattern))

        # Filter out directories
        files = [f for f in files if f.is_file()]

        return self.encode_batch(files, output_dir, **kwargs)


def _decode_single_file(args: tuple) -> dict:
    """
    Worker function to decode a single file.

    Args:
        args: Tuple of (input_path, output_dir, verify_hash)

    Returns:
        Result dictionary
    """
    input_path, output_dir, verify_hash = args
    input_path = Path(input_path)
    output_dir = Path(output_dir)

    result = {
        'input_path': str(input_path),
        'output_path': None,
        'success': False,
        'error': None
    }

    try:
        # Determine output path
        output_path = output_dir / (input_path.stem + '.bin')
        result['output_path'] = str(output_path)

        # Use regular decoder
        decoder = PixelRTSDecoder()
        data = decoder.load(str(input_path), verify_hash=verify_hash)
        output_path.write_bytes(data)

        result['success'] = True

    except Exception as e:
        result['error'] = f"{type(e).__name__}: {str(e)}"

    return result


def parallel_decode_batch(
    input_files: List[Union[Path, str]],
    output_dir: Union[Path, str],
    workers: Optional[int] = None,
    verify_hash: bool = False
) -> List[Dict]:
    """
    Decode multiple .rts.png files in parallel.

    Args:
        input_files: List of .rts.png file paths
        output_dir: Output directory for decoded files
        workers: Number of worker processes
        verify_hash: Whether to verify hashes

    Returns:
        List of result dictionaries
    """
    workers = workers or mp.cpu_count()
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    # Prepare work items
    work_items = [(str(f), str(output_dir), verify_hash) for f in input_files]

    with Pool(processes=workers) as pool:
        results = pool.map(_decode_single_file, work_items)

    # Sort by input path for consistent ordering
    results.sort(key=lambda r: r['input_path'])

    return results
