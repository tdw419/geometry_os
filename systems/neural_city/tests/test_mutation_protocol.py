"""Tests for WeightMutation protocol."""

import pytest
from systems.neural_city.mutation_protocol import (
    WeightMutation,
    DistrictUpgrade,
    MutationAuthority,
    MutationJournal
)


class TestWeightMutation:
    def test_create_weight_mutation(self):
        """Test creating a weight mutation event."""
        mutation = WeightMutation(
            index_1d=12345,
            weight_delta=0.05,
            layer="attention.head.0"
        )

        assert mutation.index_1d == 12345
        assert mutation.weight_delta == 0.05
        assert mutation.layer == "attention.head.0"
        assert mutation.authority == MutationAuthority.ENGINEER

    def test_weight_mutation_to_json(self):
        """Test serialization to JSON."""
        mutation = WeightMutation(
            index_1d=100,
            weight_delta=-0.02,
            layer="mlp.fc1"
        )

        json_data = mutation.to_json()

        assert json_data["type"] == "weight_mutation"
        assert json_data["index_1d"] == 100
        assert json_data["weight_delta"] == -0.02

    def test_authority_validation(self):
        """Test that ENGINEER can initiate but GUARDIAN can only veto."""
        mutation = WeightMutation(
            index_1d=1,
            weight_delta=0.1,
            authority=MutationAuthority.ENGINEER
        )

        assert mutation.is_authorized() is True

        # GUARDIAN cannot initiate
        mutation.authority = MutationAuthority.GUARDIAN
        assert mutation.is_authorized() is False


class TestDistrictUpgrade:
    def test_create_district_upgrade(self):
        """Test creating a district-level batch mutation."""
        upgrade = DistrictUpgrade(
            district_id="5_12",
            from_material="rust",
            to_material="steel",
            affected_indices=[1000, 1001, 1002]
        )

        assert upgrade.district_id == "5_12"
        assert upgrade.from_material == "rust"
        assert upgrade.to_material == "steel"
        assert len(upgrade.affected_indices) == 3

    def test_district_upgrade_to_json(self):
        """Test district upgrade serialization."""
        upgrade = DistrictUpgrade(
            district_id="3_7",
            from_material="steel",
            to_material="gold"
        )

        json_data = upgrade.to_json()

        assert json_data["type"] == "district_upgrade"
        assert json_data["district_id"] == "3_7"
        assert json_data["to_material"] == "gold"


class TestMutationJournal:
    def test_journal_records_mutation(self):
        """Test that journal records mutations for rollback."""
        journal = MutationJournal()
        mutation = WeightMutation(index_1d=500, weight_delta=0.1)

        snapshot_id = journal.record(mutation, previous_value=0.5)

        assert snapshot_id is not None
        assert len(journal.entries) == 1

    def test_journal_rollback(self):
        """Test rolling back a mutation."""
        journal = MutationJournal()
        mutation = WeightMutation(index_1d=100, weight_delta=0.2)

        snapshot_id = journal.record(mutation, previous_value=0.3)
        rollback = journal.rollback(snapshot_id)

        assert rollback.index_1d == 100
        assert rollback.restored_value == 0.3

    def test_journal_max_entries(self):
        """Test journal respects max entries limit."""
        journal = MutationJournal(max_entries=5)

        for i in range(10):
            journal.record(WeightMutation(index_1d=i, weight_delta=0.01), previous_value=0.0)

        assert len(journal.entries) == 5
