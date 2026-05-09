; DESCRIPTION: Sets a single green pixel at (31, 68).
; PLAN: r0=31(x), r1=68(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 68
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
