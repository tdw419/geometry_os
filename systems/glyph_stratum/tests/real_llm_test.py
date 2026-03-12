#!/usr/bin/env python3
"""
Test with real LLM APIs (OpenAI or Anthropic).
Measures whether external LLMs can build coherent GlyphStratum programs.
"""
import json
import sys
import os

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "agent-harness", "cli_anything"))

from llm_test_harness import LLMTestHarness, TEST_TASKS

def test_with_openai(task: str, api_key: str):
    """Test with OpenAI API."""
    try:
        import openai
        client = openai.OpenAI(api_key=api_key)

        harness = LLMTestHarness()
        prompt = harness.get_prompt_for_task(task)

        print(f"Testing with OpenAI: {task}")
        response = client.chat.completions.create(
            model="gpt-4o-mini",
            messages=[{"role": "user", "content": prompt}],
            temperature=0.7
        )

        llm_response = response.choices[0].message.content
        result = harness.run_test(task, llm_response)

        print(f"Result: {result}")
        return result
    except Exception as e:
        print(f"OpenAI test failed: {e}")
        return None


def test_with_anthropic(task: str, api_key: str):
    """Test with Anthropic API."""
    try:
        import anthropic
        client = anthropic.Anthropic(api_key=api_key)

        harness = LLMTestHarness()
        prompt = harness.get_prompt_for_task(task)

        print(f"Testing with Anthropic: {task}")
        response = client.messages.create(
            model="claude-3-5-sonnet-20241022",
            max_tokens=4096,
            messages=[{"role": "user", "content": prompt}]
        )

        llm_response = response.content[0].text
        result = harness.run_test(task, llm_response)

        print(f"Result: {result}")
        return result
    except Exception as e:
        print(f"Anthropic test failed: {e}")
        return None


def main():
    print("=" * 60)
    print("Real LLM Test")
    print("=" * 60)

    # Check for API keys
    openai_key = os.environ.get("OPENAI_API_KEY")
    anthropic_key = os.environ.get("ANTHROPIC_API_KEY")

    if not openai_key and not anthropic_key:
        print("No API keys found. Set OPENAI_API_KEY or ANTHROPIC_API_KEY")
        print("\nSkipping real LLM test.")
        return

    # Test with first easy task
    task = TEST_TASKS[0]  # "Add two numbers..."

    results = {}

    if openai_key:
        print("\n--- Testing with OpenAI ---")
        results["openai"] = test_with_openai(task, openai_key)

    if anthropic_key:
        print("\n--- Testing with Anthropic ---")
        results["anthropic"] = test_with_anthropic(task, anthropic_key)

    # Summary
    print("\n" + "=" * 60)
    print("Summary")
    print("=" * 60)

    for provider, result in results.items():
        if result:
            print(f"\n{provider.upper()}:")
            print(f"  Success: {result.success}")
            print(f"  Glyphs: {result.glyphs_created}")
            print(f"  Coherence: {result.coherence_score:.2%}")
            print(f"  Completeness: {result.completeness_score:.2%}")
        else:
            print(f"\n{provider.upper()}: Failed")

    print("\n" + "=" * 60)


if __name__ == "__main__":
    main()
