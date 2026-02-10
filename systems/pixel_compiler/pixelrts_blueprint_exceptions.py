"""
PixelRTS Blueprint Exceptions

Custom exceptions for blueprint layer error handling.
"""


class BlueprintError(Exception):
    """Base exception for blueprint-related errors."""
    pass


class CorruptedFileError(BlueprintError):
    """Raised when a file is corrupted or invalid."""
    pass


class MissingSidecarError(BlueprintError):
    """Raised when a required sidecar file is missing."""
    pass


class InvalidBinaryFormatError(BlueprintError):
    """Raised when binary format is not recognized."""
    pass


class InvalidCoordinateError(BlueprintError):
    """Raised when coordinates are invalid."""
    pass


class EmptyDataError(BlueprintError):
    """Raised when data is empty or zero-length."""
    pass


class InvalidMetadataError(BlueprintError):
    """Raised when metadata is malformed."""
    pass


class ImageLoadError(BlueprintError):
    """Raised when image fails to load."""
    pass


class BlueprintSerializationError(BlueprintError):
    """Raised when blueprint serialization fails."""
    pass
