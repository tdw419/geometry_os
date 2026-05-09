; DESCRIPTION: Sets a single blue pixel at (367, 2).
; PLAN: r0=367(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 2
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
