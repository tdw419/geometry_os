"""Simple test fixture with intentional failures."""


def test_addition_fails():
    """This test intentionally fails."""
    assert 1 + 1 == 3  # This will fail


def test_string_length_fails():
    """This test intentionally fails."""
    assert len("hello") == 10  # This will fail


def test_this_one_passes():
    """This test passes to show mixed results."""
    assert True is True
