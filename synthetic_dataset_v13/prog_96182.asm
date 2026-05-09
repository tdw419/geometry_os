; DESCRIPTION: Sets a single blue pixel at (13, 93).
; PLAN: r0=13(x), r1=93(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 13
LDI r1, 93
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
