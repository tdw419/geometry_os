; DESCRIPTION: Sets a single blue pixel at (135, 59).
; PLAN: r0=135(x), r1=59(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 59
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
