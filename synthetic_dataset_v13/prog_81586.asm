; DESCRIPTION: Sets a single black pixel at (28, 31).
; PLAN: r0=28(x), r1=31(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 28
LDI r1, 31
LDI r2, 0x000000
PSET r0, r1, r2
HALT
