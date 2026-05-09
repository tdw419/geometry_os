; DESCRIPTION: Sets a single green pixel at (3, 68).
; PLAN: r0=3(x), r1=68(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 3
LDI r1, 68
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
