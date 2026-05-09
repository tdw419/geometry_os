; DESCRIPTION: Sets a single yellow pixel at (394, 0).
; PLAN: r0=394(x), r1=0(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 394
LDI r1, 0
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
