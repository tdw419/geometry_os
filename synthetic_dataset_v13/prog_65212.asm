; DESCRIPTION: Sets a single black pixel at (383, 64).
; PLAN: r0=383(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 383
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
HALT
