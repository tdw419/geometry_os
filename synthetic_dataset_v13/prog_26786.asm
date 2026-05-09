; DESCRIPTION: Sets a single black pixel at (41, 22).
; PLAN: r0=41(x), r1=22(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 22
LDI r2, 0x000000
PSET r0, r1, r2
HALT
