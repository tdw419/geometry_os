; DESCRIPTION: Sets a single black pixel at (176, 23).
; PLAN: r0=176(x), r1=23(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 23
LDI r2, 0x000000
PSET r0, r1, r2
HALT
