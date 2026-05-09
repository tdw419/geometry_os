; DESCRIPTION: Sets a single black pixel at (481, 110).
; PLAN: r0=481(x), r1=110(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 110
LDI r2, 0x000000
PSET r0, r1, r2
HALT
