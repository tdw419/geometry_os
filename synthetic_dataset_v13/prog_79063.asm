; DESCRIPTION: Sets a single blue pixel at (453, 135).
; PLAN: r0=453(x), r1=135(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 135
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
