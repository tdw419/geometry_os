; DESCRIPTION: Sets a single black pixel at (59, 218).
; PLAN: r0=59(x), r1=218(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 59
LDI r1, 218
LDI r2, 0x000000
PSET r0, r1, r2
HALT
