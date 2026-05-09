; DESCRIPTION: Sets a single black pixel at (273, 12).
; PLAN: r0=273(x), r1=12(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 273
LDI r1, 12
LDI r2, 0x000000
PSET r0, r1, r2
HALT
