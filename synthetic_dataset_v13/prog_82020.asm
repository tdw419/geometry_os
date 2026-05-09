; DESCRIPTION: Sets a single yellow pixel at (397, 75).
; PLAN: r0=397(x), r1=75(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 75
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
