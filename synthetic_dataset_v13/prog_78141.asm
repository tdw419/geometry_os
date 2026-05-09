; DESCRIPTION: Sets a single black pixel at (329, 71).
; PLAN: r0=329(x), r1=71(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 71
LDI r2, 0x000000
PSET r0, r1, r2
HALT
