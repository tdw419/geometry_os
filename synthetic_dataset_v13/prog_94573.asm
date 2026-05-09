; DESCRIPTION: Places a red dot at position (469, 66).
; PLAN: r0=469(x), r1=66(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 469
LDI r1, 66
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
