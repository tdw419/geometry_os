; DESCRIPTION: Sets a single orange pixel at (26, 66).
; PLAN: r0=26(x), r1=66(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 26
LDI r1, 66
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
