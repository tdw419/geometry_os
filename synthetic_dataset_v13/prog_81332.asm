; DESCRIPTION: Sets a single blue pixel at (191, 180).
; PLAN: r0=191(x), r1=180(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 191
LDI r1, 180
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
