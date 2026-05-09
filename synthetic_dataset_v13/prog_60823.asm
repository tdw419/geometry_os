; DESCRIPTION: Sets a single black pixel at (314, 84).
; PLAN: r0=314(x), r1=84(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 84
LDI r2, 0x000000
PSET r0, r1, r2
HALT
