; DESCRIPTION: Sets a single black pixel at (16, 218).
; PLAN: r0=16(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
HALT
