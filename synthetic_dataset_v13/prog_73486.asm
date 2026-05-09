; DESCRIPTION: Sets a single blue pixel at (355, 16).
; PLAN: r0=355(x), r1=16(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 355
LDI r1, 16
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
