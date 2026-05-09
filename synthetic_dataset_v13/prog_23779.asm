; DESCRIPTION: Sets a single blue pixel at (114, 116).
; PLAN: r0=114(x), r1=116(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 114
LDI r1, 116
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
