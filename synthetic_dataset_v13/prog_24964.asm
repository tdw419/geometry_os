; DESCRIPTION: Sets a single yellow pixel at (270, 60).
; PLAN: r0=270(x), r1=60(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 270
LDI r1, 60
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
