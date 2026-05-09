; DESCRIPTION: Sets a single black pixel at (138, 252).
; PLAN: r0=138(x), r1=252(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 138
LDI r1, 252
LDI r2, 0x000000
PSET r0, r1, r2
HALT
