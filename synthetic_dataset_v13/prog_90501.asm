; DESCRIPTION: Sets a single black pixel at (407, 242).
; PLAN: r0=407(x), r1=242(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 242
LDI r2, 0x000000
PSET r0, r1, r2
HALT
