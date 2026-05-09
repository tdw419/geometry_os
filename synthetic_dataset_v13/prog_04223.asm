; DESCRIPTION: Sets a single green pixel at (397, 99).
; PLAN: r0=397(x), r1=99(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 397
LDI r1, 99
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
