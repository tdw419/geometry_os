; DESCRIPTION: Sets a single black pixel at (18, 214).
; PLAN: r0=18(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
HALT
