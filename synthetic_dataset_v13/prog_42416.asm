; DESCRIPTION: Sets a single blue pixel at (80, 165).
; PLAN: r0=80(x), r1=165(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 80
LDI r1, 165
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
