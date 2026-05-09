; DESCRIPTION: Sets a single green pixel at (75, 109).
; PLAN: r0=75(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 75
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
