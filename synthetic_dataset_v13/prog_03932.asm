; DESCRIPTION: Sets a single black pixel at (306, 98).
; PLAN: r0=306(x), r1=98(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 306
LDI r1, 98
LDI r2, 0x000000
PSET r0, r1, r2
HALT
