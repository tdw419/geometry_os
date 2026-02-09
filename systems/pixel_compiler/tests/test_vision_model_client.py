"""
Test suite for Vision Model Client with multi-provider support.

These tests follow TDD principles - write the test first, then implement.
"""

import unittest
import sys
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock
import base64

# Add parent directory to path to import modules
sys.path.insert(0, str(Path(__file__).parent.parent))

from vision_model_client import (
    ModelProvider,
    VisionModelClient
)


class TestModelProviderEnum(unittest.TestCase):
    """Test cases for ModelProvider enum."""

    def test_lm_studio_provider_exists(self):
        """Test that LM_STUDIO provider exists."""
        self.assertTrue(hasattr(ModelProvider, 'LM_STUDIO'))

    def test_openai_provider_exists(self):
        """Test that OPENAI provider exists."""
        self.assertTrue(hasattr(ModelProvider, 'OPENAI'))

    def test_anthropic_provider_exists(self):
        """Test that ANTHROPIC provider exists."""
        self.assertTrue(hasattr(ModelProvider, 'ANTHROPIC'))


class TestClientInitialization(unittest.TestCase):
    """Test cases for VisionModelClient initialization."""

    def test_client_initializes_with_provider(self):
        """Test that client initializes with a provider."""
        client = VisionModelClient(provider=ModelProvider.LM_STUDIO)
        self.assertEqual(client.provider, ModelProvider.LM_STUDIO)

    def test_client_has_default_endpoints_dict(self):
        """Test that DEFAULT_ENDPOINTS dict exists."""
        self.assertTrue(hasattr(VisionModelClient, 'DEFAULT_ENDPOINTS'))
        self.assertIsInstance(VisionModelClient.DEFAULT_ENDPOINTS, dict)

    def test_default_endpoint_for_lm_studio(self):
        """Test default endpoint for LM Studio."""
        endpoints = VisionModelClient.DEFAULT_ENDPOINTS
        self.assertIn(ModelProvider.LM_STUDIO, endpoints)
        self.assertEqual(
            endpoints[ModelProvider.LM_STUDIO],
            "http://localhost:1234/v1"
        )

    def test_default_endpoint_for_openai(self):
        """Test default endpoint for OpenAI."""
        endpoints = VisionModelClient.DEFAULT_ENDPOINTS
        self.assertIn(ModelProvider.OPENAI, endpoints)
        self.assertEqual(
            endpoints[ModelProvider.OPENAI],
            "https://api.openai.com/v1"
        )

    def test_default_endpoint_for_anthropic(self):
        """Test default endpoint for Anthropic."""
        endpoints = VisionModelClient.DEFAULT_ENDPOINTS
        self.assertIn(ModelProvider.ANTHROPIC, endpoints)
        self.assertEqual(
            endpoints[ModelProvider.ANTHROPIC],
            "https://api.anthropic.com/v1"
        )

    def test_client_custom_endpoint(self):
        """Test that client accepts custom endpoint."""
        client = VisionModelClient(
            provider=ModelProvider.LM_STUDIO,
            endpoint="http://custom:8080/v1"
        )
        self.assertEqual(client.endpoint, "http://custom:8080/v1")


class TestBuildAnalysisPrompt(unittest.TestCase):
    """Test cases for build_analysis_prompt method."""

    def test_method_exists(self):
        """Test that build_analysis_prompt method exists."""
        client = VisionModelClient(provider=ModelProvider.LM_STUDIO)
        self.assertTrue(hasattr(client, 'build_analysis_prompt'))

    def test_builds_prompt_for_rts_artifact(self):
        """Test prompt building for RTS artifact type."""
        client = VisionModelClient(provider=ModelProvider.LM_STUDIO)
        metadata = {"name": "test", "width": 64, "height": 64}

        prompt = client.build_analysis_prompt("rts", metadata)

        self.assertIsInstance(prompt, str)
        self.assertIn("RTS", prompt.upper())
        self.assertIn("64", prompt)

    def test_builds_prompt_for_screenshot_artifact(self):
        """Test prompt building for screenshot artifact type."""
        client = VisionModelClient(provider=ModelProvider.LM_STUDIO)
        metadata = {"app": "terminal", "timestamp": "2026-02-09"}

        prompt = client.build_analysis_prompt("screenshot", metadata)

        self.assertIsInstance(prompt, str)
        self.assertIn("screenshot", prompt.lower())

    def test_builds_prompt_with_minimal_metadata(self):
        """Test prompt building with minimal metadata."""
        client = VisionModelClient(provider=ModelProvider.LM_STUDIO)

        prompt = client.build_analysis_prompt("generic", {})

        self.assertIsInstance(prompt, str)
        self.assertGreater(len(prompt), 0)


class TestFormatMessagesWithImage(unittest.TestCase):
    """Test cases for format_messages_with_image method."""

    def setUp(self):
        """Set up test fixtures."""
        self.client = VisionModelClient(provider=ModelProvider.LM_STUDIO)
        # Create a small base64 image for testing
        self.test_image_b64 = base64.b64encode(b"fake_image_data").decode()

    def test_method_exists(self):
        """Test that format_messages_with_image method exists."""
        self.assertTrue(hasattr(self.client, 'format_messages_with_image'))

    def test_formats_openai_compatible_messages(self):
        """Test message formatting for OpenAI-compatible APIs."""
        prompt = "Analyze this image"
        messages = self.client.format_messages_with_image(
            prompt,
            self.test_image_b64,
            api_format="openai"
        )

        self.assertIsInstance(messages, list)
        self.assertGreater(len(messages), 0)
        # OpenAI format: {"role": "user", "content": [...]}
        self.assertIn("role", messages[0])
        self.assertIn("content", messages[0])

    def test_formats_anthropic_messages(self):
        """Test message formatting for Anthropic API."""
        prompt = "Analyze this image"
        messages = self.client.format_messages_with_image(
            prompt,
            self.test_image_b64,
            api_format="anthropic"
        )

        self.assertIsInstance(messages, list)
        self.assertGreater(len(messages), 0)
        # Anthropic format
        self.assertIn("role", messages[0])
        self.assertIn("content", messages[0])


class TestAnalyzeMethod(unittest.TestCase):
    """Test cases for analyze method."""

    def setUp(self):
        """Set up test fixtures."""
        self.client = VisionModelClient(provider=ModelProvider.LM_STUDIO)
        self.test_image_b64 = base64.b64encode(b"fake_image_data").decode()

    def test_method_exists(self):
        """Test that analyze method exists."""
        self.assertTrue(hasattr(self.client, 'analyze'))

    @patch('requests.post')
    def test_analyze_calls_openai_compatible_api(self, mock_post):
        """Test that analyze calls OpenAI-compatible API for LM Studio."""
        # Mock successful response
        mock_response = Mock()
        mock_response.status_code = 200
        mock_response.json.return_value = {
            "choices": [{"message": {"content": "Analysis result"}}]
        }
        mock_post.return_value = mock_response

        result = self.client.analyze("Analyze this", self.test_image_b64)

        self.assertEqual(result, "Analysis result")
        mock_post.assert_called_once()

    @patch('requests.post')
    def test_analyze_with_anthropic_provider(self, mock_post):
        """Test that analyze calls Anthropic API for Anthropic provider."""
        client = VisionModelClient(provider=ModelProvider.ANTHROPIC)

        mock_response = Mock()
        mock_response.status_code = 200
        mock_response.json.return_value = {
            "content": [{"text": "Anthropic analysis"}]
        }
        mock_post.return_value = mock_response

        result = client.analyze("Analyze this", self.test_image_b64)

        self.assertEqual(result, "Anthropic analysis")


class TestAPICallMethods(unittest.TestCase):
    """Test cases for _call_openai_compatible_api and _call_anthropic_api methods."""

    def test_openai_api_method_exists(self):
        """Test that _call_openai_compatible_api method exists."""
        client = VisionModelClient(provider=ModelProvider.LM_STUDIO)
        self.assertTrue(hasattr(client, '_call_openai_compatible_api'))

    def test_anthropic_api_method_exists(self):
        """Test that _call_anthropic_api method exists."""
        client = VisionModelClient(provider=ModelProvider.ANTHROPIC)
        self.assertTrue(hasattr(client, '_call_anthropic_api'))

    @patch('requests.post')
    def test_openai_api_handles_errors(self, mock_post):
        """Test that OpenAI API call handles errors gracefully."""
        client = VisionModelClient(provider=ModelProvider.LM_STUDIO)

        mock_response = Mock()
        mock_response.status_code = 500
        mock_response.text = "Internal Server Error"
        mock_post.return_value = mock_response

        result = client._call_openai_compatible_api(
            messages=[{"role": "user", "content": "test"}],
            image_b64="abc123"
        )

        # Should handle error and return None
        self.assertIsNone(result)


if __name__ == '__main__':
    unittest.main(verbosity=2)
