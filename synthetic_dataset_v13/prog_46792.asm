; DESCRIPTION: Sets a single green pixel at (383, 99).
; PLAN: r0=383(x), r1=99(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 383
LDI r1, 99
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
