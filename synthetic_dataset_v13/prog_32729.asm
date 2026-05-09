; DESCRIPTION: Sets a single black pixel at (457, 14).
; PLAN: r0=457(x), r1=14(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 457
LDI r1, 14
LDI r2, 0x000000
PSET r0, r1, r2
HALT
