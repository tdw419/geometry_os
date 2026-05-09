; DESCRIPTION: Sets a single blue pixel at (350, 96).
; PLAN: r0=350(x), r1=96(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 350
LDI r1, 96
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
