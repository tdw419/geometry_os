; DESCRIPTION: Places a cyan dot at position (378, 61).
; PLAN: r0=378(x), r1=61(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 378
LDI r1, 61
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
