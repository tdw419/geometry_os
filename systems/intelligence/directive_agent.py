#!/usr/bin/env python3
"""
DirectiveAgent - Bidirectional Human-AI Collaboration

Polls WordPress for directives, parses scope, executes allowed actions,
and posts responses as comments.

Phase 3 Scope: INFORMATIONAL + RESEARCH only
"""

import json
import time
import logging
import re
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from typing import Optional
from pathlib import Path
import os

import requests


class DirectiveScope(Enum):
    """Scope classification for directives."""
    INFORMATIONAL = "informational"
    RESEARCH = "research"
    UNKNOWN = "unknown"


class DirectiveStatus(Enum):
    """Execution status for directives."""
    COMPLETED = "completed"
    FAILED = "failed"
    OUT_OF_SCOPE = "out_of_scope"
    NEEDS_CLARIFICATION = "needs_clarification"


# Scope detection keywords
INFORMATIONAL_KEYWORDS = [
    "explain", "what is", "describe", "tell me about", "show",
    "list", "how does", "what does", "overview", "summary"
]

RESEARCH_KEYWORDS = [
    "investigate", "analyze", "research", "study", "examine",
    "explore", "look into", "find out", "determine"
]

# Out-of-scope patterns (Phase 3 safety)
OUT_OF_SCOPE_PATTERNS = [
    r"\bdelete\b",
    r"\bremove\b",
    r"\brestart\b",
    r"\bstop\b",
    r"\bstart\b",
    r"\bmodify\b.*\bcode\b",
    r"\bchange\b.*\bfile\b",
    r"\bwrite\b.*\bcode\b",
    r"\bcreate\b.*\bfile\b",
    r"\bupdate\b.*\bcode\b",
    r"\bexecute\b.*\bcommand\b",
    r"\brun\b.*\bscript\b",
]


@dataclass
class Directive:
    """Represents a directive post from WordPress."""
    id: int
    title: str
    content: str
    date: str
    author: str
    scope: DirectiveScope = DirectiveScope.UNKNOWN
    action: str = ""
    target: str = ""

    def __post_init__(self):
        """Parse scope after initialization."""
        if self.scope == DirectiveScope.UNKNOWN:
            self.scope = self._detect_scope()
        if not self.action:
            self.action = self._extract_action()
        if not self.target:
            self.target = self._extract_target()

    def _detect_scope(self) -> DirectiveScope:
        """Detect directive scope from content."""
        text = f"{self.title} {self.content}".lower()

        # Check for out-of-scope first
        for pattern in OUT_OF_SCOPE_PATTERNS:
            if re.search(pattern, text, re.IGNORECASE):
                return DirectiveScope.UNKNOWN  # Will be handled as OUT_OF_SCOPE

        # Check for informational keywords
        for keyword in INFORMATIONAL_KEYWORDS:
            if keyword in text:
                return DirectiveScope.INFORMATIONAL

        # Check for research keywords
        for keyword in RESEARCH_KEYWORDS:
            if keyword in text:
                return DirectiveScope.RESEARCH

        return DirectiveScope.UNKNOWN

    def _extract_action(self) -> str:
        """Extract the action verb from content."""
        text = f"{self.title} {self.content}".lower()

        all_keywords = INFORMATIONAL_KEYWORDS + RESEARCH_KEYWORDS
        for keyword in all_keywords:
            if keyword in text:
                return keyword

        return "unknown"

    def _extract_target(self) -> str:
        """Extract target component from content."""
        # Look for common component references
        text = f"{self.title} {self.content}"

        # Match quoted strings as potential targets
        quoted = re.findall(r'["\']([^"\']+)["\']', text)
        if quoted:
            return quoted[0]

        # Match "about X" or "the X" patterns
        about_match = re.search(r'(?:about|the)\s+(\w+(?:\s+\w+)?)', text, re.IGNORECASE)
        if about_match:
            return about_match.group(1)

        return ""


class DirectiveAgent:
    """
    Agent that polls WordPress for directives and executes them.

    Phase 3 Scope: INFORMATIONAL + RESEARCH only
    """

    WP_URL: str = "http://localhost:8080"
    POLL_INTERVAL: int = 30
    API_TIMEOUT: int = 10

    def __init__(
        self,
        wp_url: Optional[str] = None,
        poll_interval: Optional[int] = None,
        substrate_map_path: Optional[str] = None,
        heartbeat_path: Optional[str] = None
    ):
        self.wp_url = wp_url or self.WP_URL
        self.wp_api = f"{self.wp_url}/ai-publisher.php"
        self.poll_interval = poll_interval or self.POLL_INTERVAL

        # Substrate map cache
        self.substrate_map_path = substrate_map_path or ".geometry/substrate_map.json"
        self._substrate_cache: dict = {}

        # Heartbeat tracking
        self.heartbeat_path = heartbeat_path or ".geometry/directive_agent_heartbeat.json"
        self._directives_processed: int = 0
        self._start_time: Optional[datetime] = None

        # Logging setup
        self.logger = logging.getLogger("DirectiveAgent")
        self.logger.setLevel(logging.INFO)

        # Load substrate map
        self._load_substrate_map()

    def _load_substrate_map(self) -> None:
        """Load substrate map cache from file."""
        path = Path(self.substrate_map_path)
        if path.exists():
            try:
                with open(path, 'r') as f:
                    self._substrate_cache = json.load(f)
                self.logger.info(f"Loaded substrate map: {len(self._substrate_cache)} components")
            except (json.JSONDecodeError, IOError) as e:
                self.logger.warning(f"Failed to load substrate map: {e}")
                self._substrate_cache = {}
        else:
            self.logger.info("Substrate map not found, will return NEEDS_CLARIFICATION for lookups")

    def write_heartbeat(self) -> None:
        """
        Write heartbeat file for external monitoring.

        Writes JSON with: timestamp, pid, running, uptime_seconds,
        directives_processed, wp_url, poll_interval, substrate_components.
        """
        uptime = 0.0
        if self._start_time:
            uptime = (datetime.utcnow() - self._start_time).total_seconds()

        heartbeat_data = {
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "pid": os.getpid(),
            "running": self._start_time is not None,
            "uptime_seconds": uptime,
            "directives_processed": self._directives_processed,
            "wp_url": self.wp_url,
            "poll_interval": self.poll_interval,
            "substrate_components": len(self._substrate_cache),
        }

        try:
            path = Path(self.heartbeat_path)
            path.parent.mkdir(parents=True, exist_ok=True)
            with open(path, 'w') as f:
                json.dump(heartbeat_data, f, indent=2)
        except (IOError, OSError) as e:
            self.logger.error(f"Failed to write heartbeat: {e}")

    def _api_call(self, tool: str, **kwargs) -> Optional[dict]:
        """Make API call to WordPress."""
        payload = {"tool": tool, "arguments": kwargs}

        try:
            response = requests.post(
                self.wp_api,
                json=payload,
                timeout=self.API_TIMEOUT
            )
            response.raise_for_status()
            return response.json()
        except requests.RequestException as e:
            self.logger.error(f"API call failed ({tool}): {e}")
            return None

    def poll_directives(self) -> list[Directive]:
        """
        Poll WordPress for unprocessed directives.

        Returns:
            List of Directive objects
        """
        result = self._api_call("getDirectives")

        if not result or not result.get("success"):
            self.logger.warning("Failed to poll directives")
            return []

        directives = []
        for item in result.get("directives", []):
            try:
                directive = Directive(
                    id=item.get("id", 0),
                    title=item.get("title", ""),
                    content=item.get("content", ""),
                    date=item.get("date", ""),
                    author=item.get("author", "")
                )
                directives.append(directive)
            except Exception as e:
                self.logger.error(f"Failed to parse directive: {e}")

        self.logger.info(f"Polled {len(directives)} directives")
        return directives

    def parse_directive(self, directive: Directive) -> Directive:
        """
        Parse and classify a directive.

        Args:
            directive: Raw directive to parse

        Returns:
            Parsed directive with scope, action, target populated
        """
        # Directive.__post_init__ already handles parsing
        # This method is for explicit parsing calls
        return directive

    def _check_out_of_scope(self, directive: Directive) -> bool:
        """Check if directive contains out-of-scope patterns."""
        text = f"{directive.title} {directive.content}".lower()

        for pattern in OUT_OF_SCOPE_PATTERNS:
            if re.search(pattern, text, re.IGNORECASE):
                return True

        return False

    def _lookup_component(self, target: str) -> Optional[dict]:
        """Look up component in substrate map."""
        if not target or not self._substrate_cache:
            return None

        # Exact match
        if target in self._substrate_cache:
            return self._substrate_cache[target]

        # Partial match
        target_lower = target.lower()
        for key, value in self._substrate_cache.items():
            if target_lower in key.lower() or target_lower in str(value).lower():
                return value

        return None

    def execute_directive(self, directive: Directive) -> tuple[DirectiveStatus, str]:
        """
        Execute a directive based on its scope.

        Args:
            directive: Directive to execute

        Returns:
            Tuple of (status, response_text)
        """
        # Check for out-of-scope first
        if self._check_out_of_scope(directive):
            return (
                DirectiveStatus.OUT_OF_SCOPE,
                "<p><strong>Out of Scope</strong></p>"
                "<p>This directive requires code modification or system changes, "
                "which are outside the current Phase 3 scope (informational + research only).</p>"
                "<p>Please rephrase your request to focus on understanding or analysis.</p>"
            )

        # Handle based on scope
        if directive.scope == DirectiveScope.INFORMATIONAL:
            return self._execute_informational(directive)
        elif directive.scope == DirectiveScope.RESEARCH:
            return self._execute_research(directive)
        else:
            return (
                DirectiveStatus.NEEDS_CLARIFICATION,
                "<p><strong>Needs Clarification</strong></p>"
                "<p>I couldn't determine the intent of your directive.</p>"
                "<p>Please try rephrasing with keywords like:</p>"
                "<ul>"
                "<li><strong>Informational:</strong> explain, describe, what is, how does</li>"
                "<li><strong>Research:</strong> investigate, analyze, explore</li>"
                "</ul>"
            )

    def _execute_informational(self, directive: Directive) -> tuple[DirectiveStatus, str]:
        """Execute informational directive."""
        target = directive.target
        component = self._lookup_component(target)

        if component:
            response = f"<p><strong>{component.get('name', target)}</strong></p>"
            if component.get('description'):
                response += f"<p>{component.get('description')}</p>"
            if component.get('path'):
                response += f"<p><em>Path: {component.get('path')}</em></p>"
            if component.get('metadata'):
                meta = component['metadata']
                response += "<ul>"
                if meta.get('language'):
                    response += f"<li>Language: {meta['language']}</li>"
                if meta.get('files'):
                    response += f"<li>Files: {meta['files']}</li>"
                if meta.get('entry_points'):
                    response += f"<li>Entry Points: {', '.join(meta['entry_points'])}</li>"
                response += "</ul>"
            return (DirectiveStatus.COMPLETED, response)
        else:
            return (
                DirectiveStatus.NEEDS_CLARIFICATION,
                f"<p><strong>Component Not Found</strong></p>"
                f"<p>I couldn't find a component matching '{target}'.</p>"
                "<p>Please specify the component name more precisely.</p>"
            )

    def _execute_research(self, directive: Directive) -> tuple[DirectiveStatus, str]:
        """Execute research directive."""
        target = directive.target
        component = self._lookup_component(target)

        if component:
            response = f"<p><strong>Research: {component.get('name', target)}</strong></p>"

            # Basic analysis
            response += "<h4>Component Analysis</h4>"
            response += "<ul>"

            if component.get('description'):
                response += f"<li><strong>Purpose:</strong> {component['description']}</li>"

            if component.get('metadata'):
                meta = component['metadata']

                if meta.get('language'):
                    response += f"<li><strong>Language:</strong> {meta['language']}</li>"

                if meta.get('files'):
                    file_count = meta['files']
                    complexity = "small" if file_count < 10 else "medium" if file_count < 30 else "large"
                    response += f"<li><strong>Size:</strong> {file_count} files ({complexity} codebase)</li>"

                if meta.get('entry_points'):
                    response += f"<li><strong>Entry Points:</strong> {', '.join(meta['entry_points'])}</li>"

            response += "</ul>"
            response += "<p><em>Research complete. For deeper analysis, please ask specific questions.</em></p>"

            return (DirectiveStatus.COMPLETED, response)
        else:
            return (
                DirectiveStatus.NEEDS_CLARIFICATION,
                f"<p><strong>Component Not Found</strong></p>"
                f"<p>I couldn't find a component matching '{target}' for research.</p>"
                "<p>Please specify the component name more precisely.</p>"
            )

    def post_response(
        self,
        directive: Directive,
        status: DirectiveStatus,
        response: str
    ) -> bool:
        """
        Post response as WordPress comment.

        Args:
            directive: Directive being responded to
            status: Execution status
            response: Response content (HTML)

        Returns:
            True if successful
        """
        # Format full response with status header
        status_emoji = {
            DirectiveStatus.COMPLETED: "✅",
            DirectiveStatus.FAILED: "❌",
            DirectiveStatus.OUT_OF_SCOPE: "🚫",
            DirectiveStatus.NEEDS_CLARIFICATION: "❓"
        }

        full_response = (
            f"<p><strong>{status_emoji.get(status, '')} {status.value.title()}</strong></p>"
            f"{response}"
        )

        result = self._api_call(
            "postDirectiveResponse",
            post_id=directive.id,
            response=full_response,
            status=status.value
        )

        if result and result.get("success"):
            self.logger.info(f"Posted response for directive {directive.id}")
            return True

        self.logger.error(f"Failed to post response for directive {directive.id}")
        return False

    def mark_processed(self, directive_id: int) -> bool:
        """
        Mark directive as processed in WordPress.

        Args:
            directive_id: WordPress post ID

        Returns:
            True if successful
        """
        result = self._api_call("markDirectiveProcessed", post_id=directive_id)

        if result and result.get("success"):
            self.logger.info(f"Marked directive {directive_id} as processed")
            return True

        self.logger.error(f"Failed to mark directive {directive_id} as processed")
        return False

    def process_one_cycle(self) -> int:
        """
        Process one polling cycle.

        Returns:
            Number of directives processed
        """
        # Initialize start time on first cycle
        if self._start_time is None:
            self._start_time = datetime.utcnow()

        self.logger.info("Starting processing cycle")

        # Poll for directives
        directives = self.poll_directives()

        if not directives:
            self.logger.info("No directives to process")
            self.write_heartbeat()
            return 0

        processed = 0

        for directive in directives:
            try:
                # Parse (already done in __post_init__)
                self.parse_directive(directive)

                # Execute
                status, response = self.execute_directive(directive)

                # Post response
                self.post_response(directive, status, response)

                # Mark processed
                self.mark_processed(directive.id)

                processed += 1
                self._directives_processed += 1

            except Exception as e:
                self.logger.error(f"Error processing directive {directive.id}: {e}")

        self.logger.info(f"Processed {processed} directives")
        self.write_heartbeat()
        return processed

    def run_forever(self) -> None:
        """
        Run agent in continuous polling loop.

        This method blocks forever until interrupted.
        """
        self.logger.info(f"Starting DirectiveAgent (polling every {self.poll_interval}s)")

        while True:
            try:
                self.process_one_cycle()
            except Exception as e:
                self.logger.error(f"Cycle error: {e}")

            time.sleep(self.poll_interval)


def main():
    """Entry point for running DirectiveAgent."""
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    )

    agent = DirectiveAgent()
    agent.run_forever()


if __name__ == "__main__":
    main()
