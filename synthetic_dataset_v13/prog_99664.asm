; DESCRIPTION: Sets a single blue pixel at (60, 84).
; PLAN: r0=60(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 60
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
