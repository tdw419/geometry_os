; DESCRIPTION: Sets a single black pixel at (126, 33).
; PLAN: r0=126(x), r1=33(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 33
LDI r2, 0x000000
PSET r0, r1, r2
HALT
