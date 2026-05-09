; DESCRIPTION: Sets a single blue pixel at (374, 80).
; PLAN: r0=374(x), r1=80(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 374
LDI r1, 80
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
