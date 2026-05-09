; DESCRIPTION: Sets a single black pixel at (266, 166).
; PLAN: r0=266(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
HALT
