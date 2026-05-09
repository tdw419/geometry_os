; DESCRIPTION: Sets a single black pixel at (298, 194).
; PLAN: r0=298(x), r1=194(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 298
LDI r1, 194
LDI r2, 0x000000
PSET r0, r1, r2
HALT
