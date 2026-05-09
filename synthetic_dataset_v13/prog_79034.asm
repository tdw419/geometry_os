; DESCRIPTION: Sets a single black pixel at (498, 166).
; PLAN: r0=498(x), r1=166(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 166
LDI r2, 0x000000
PSET r0, r1, r2
HALT
