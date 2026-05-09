; DESCRIPTION: Sets a single blue pixel at (442, 34).
; PLAN: r0=442(x), r1=34(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 442
LDI r1, 34
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
