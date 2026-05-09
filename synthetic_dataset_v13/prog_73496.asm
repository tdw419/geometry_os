; DESCRIPTION: Sets a single black pixel at (130, 206).
; PLAN: r0=130(x), r1=206(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 130
LDI r1, 206
LDI r2, 0x000000
PSET r0, r1, r2
HALT
