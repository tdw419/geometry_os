; DESCRIPTION: Sets a single blue pixel at (436, 127).
; PLAN: r0=436(x), r1=127(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 436
LDI r1, 127
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
