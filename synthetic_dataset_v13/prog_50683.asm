; DESCRIPTION: Sets a single blue pixel at (172, 255).
; PLAN: r0=172(x), r1=255(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 255
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
