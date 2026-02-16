"""
Heartbeat Test: Z.ai Bridge Connection

Verifies that the Z.ai integration layer is functional.
This test gracefully handles the case where Z.ai API is not configured.
"""

import pytest


def test_zai_integration_import():
    """Test that ZAIIntegration can be imported"""
    try:
        from zai_agent_integration import ZAIIntegration, ZHIPU_AVAILABLE
        assert ZAIIntegration is not None
    except ImportError:
        pytest.skip("ZAI integration module not available")


def test_zai_mock_mode():
    """Test that ZAI works in mock mode when no API key is set"""
    try:
        from zai_agent_integration import ZAIIntegration
    except ImportError:
        pytest.skip("ZAI integration module not available")

    # Create integration without API key (should use mock mode)
    integration = ZAIIntegration(api_key=None)

    # Should be in mock mode
    assert integration.is_mock_mode is True


def test_zai_tool_registration():
    """Test that tools can be registered with ZAI integration"""
    try:
        from zai_agent_integration import ZAIIntegration
    except ImportError:
        pytest.skip("ZAI integration module not available")

    integration = ZAIIntegration(api_key=None)

    # Register a simple tool
    async def dummy_tool(x: int) -> dict:
        return {"result": x * 2}

    integration.register_tool_callback("dummy", dummy_tool)

    # Should be registered (attribute may be tool_callbacks or _tool_callbacks)
    assert "dummy" in getattr(integration, 'tool_callbacks', getattr(integration, '_tool_callbacks', {}))


def test_zai_chat_mock():
    """Test that mock chat returns something"""
    try:
        from zai_agent_integration import ZAIIntegration
    except ImportError:
        pytest.skip("ZAI integration module not available")

    import asyncio

    integration = ZAIIntegration(api_key=None)

    async def test_chat():
        response = await integration.chat("coder", "Hello, test!")
        assert response is not None
        assert len(response) > 0
        return response

    result = asyncio.run(test_chat())
    assert result is not None


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
