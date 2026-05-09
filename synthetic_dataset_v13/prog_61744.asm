; DESCRIPTION: Places a cyan dot at position (425, 87).
; PLAN: r0=425(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 425
LDI r1, 87
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
