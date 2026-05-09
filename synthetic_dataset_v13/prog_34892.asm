; DESCRIPTION: Sets a single blue pixel at (493, 17).
; PLAN: r0=493(x), r1=17(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 17
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
