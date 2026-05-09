; DESCRIPTION: Sets a single red pixel at (139, 78).
; PLAN: r0=139(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
