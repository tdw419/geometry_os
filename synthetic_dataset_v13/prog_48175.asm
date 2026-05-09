; DESCRIPTION: Sets a single black pixel at (466, 234).
; PLAN: r0=466(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 466
LDI r1, 234
LDI r2, 0x000000
PSET r0, r1, r2
HALT
