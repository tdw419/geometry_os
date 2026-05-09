; DESCRIPTION: Sets a single blue pixel at (501, 67).
; PLAN: r0=501(x), r1=67(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 67
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
