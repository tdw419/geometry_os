"""Sample test file for autofix daemon demonstration."""


def test_passing():
    """This test passes."""
    assert 1 + 1 == 2


def test_failing():
    """This test has a bug - will be detected by autofix daemon."""
    items = []
    if not items:
        return None  # Skip empty inputs
    assert len(items) > 0  # Fails because items is empty
