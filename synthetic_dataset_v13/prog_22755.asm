; DESCRIPTION: Sets a single blue pixel at (477, 112).
; PLAN: r0=477(x), r1=112(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 477
LDI r1, 112
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
