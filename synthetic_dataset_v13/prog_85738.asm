; DESCRIPTION: Sets a single blue pixel at (468, 109).
; PLAN: r0=468(x), r1=109(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 468
LDI r1, 109
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
