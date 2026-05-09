; DESCRIPTION: Sets a single blue pixel at (29, 252).
; PLAN: r0=29(x), r1=252(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 29
LDI r1, 252
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
