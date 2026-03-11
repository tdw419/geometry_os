"""
Base classes for verification steps.

Provides VerificationStep abstract base class for composable verification.
Each verification step is independent and can be run in sequence or isolation.
"""

from abc import ABC, abstractmethod
from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from .context import VerificationContext
    from .result import StepResult


class VerificationStep(ABC):
    """
    Abstract base class for verification steps.

    Each step performs a single verification check and returns a StepResult.
    Steps can have dependencies on other steps via depends_on.

    Pattern:
        class MyVerifier(VerificationStep):
            @property
            def name(self) -> str:
                return "my_check"

            @property
            def description(self) -> str:
                return "Checks something specific"

            def verify(self, context: VerificationContext) -> StepResult:
                # Perform check
                return StepResult(
                    step_name=self.name,
                    status=VerificationStatus.PASS,
                    message="Check passed"
                )
    """

    @property
    @abstractmethod
    def name(self) -> str:
        """
        Short name for this verification step.

        Used in results and for dependency references.
        Should be unique across all verifiers.
        """
        pass

    @property
    @abstractmethod
    def description(self) -> str:
        """
        Human-readable description of what this step verifies.

        Used in documentation and verbose output.
        """
        pass

    @abstractmethod
    def verify(self, context: "VerificationContext") -> "StepResult":
        """
        Perform the verification check.

        Args:
            context: Verification context providing access to file data

        Returns:
            StepResult with pass/fail status and details
        """
        pass

    @property
    def depends_on(self) -> list[str]:
        """
        List of step names that must complete before this step.

        Used for sequencing steps. Empty list means no dependencies.

        Returns:
            List of step names (strings)
        """
        return []

    def __repr__(self) -> str:
        return f"<{self.__class__.__name__}: {self.name}>"
