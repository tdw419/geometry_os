; DESCRIPTION: Places a cyan dot at position (467, 179).
; PLAN: r0=467(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 467
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
