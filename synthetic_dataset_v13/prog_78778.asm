; DESCRIPTION: Sets a single blue pixel at (131, 233).
; PLAN: r0=131(x), r1=233(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 233
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
