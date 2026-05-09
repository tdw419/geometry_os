; DESCRIPTION: Sets a single blue pixel at (359, 202).
; PLAN: r0=359(x), r1=202(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 359
LDI r1, 202
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
