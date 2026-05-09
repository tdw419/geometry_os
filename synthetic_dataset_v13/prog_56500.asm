; DESCRIPTION: Sets a single black pixel at (395, 160).
; PLAN: r0=395(x), r1=160(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 395
LDI r1, 160
LDI r2, 0x000000
PSET r0, r1, r2
HALT
