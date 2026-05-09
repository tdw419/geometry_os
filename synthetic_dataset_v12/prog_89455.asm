; DESCRIPTION: Sets a single black pixel at (38, 89).
; PLAN: r0=38(x), r1=89(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 38
LDI r1, 89
LDI r2, 0x000000
PSET r0, r1, r2
HALT
