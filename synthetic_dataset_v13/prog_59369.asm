; DESCRIPTION: Sets a single black pixel at (116, 234).
; PLAN: r0=116(x), r1=234(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 116
LDI r1, 234
LDI r2, 0x000000
PSET r0, r1, r2
HALT
