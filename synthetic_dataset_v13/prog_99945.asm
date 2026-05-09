; DESCRIPTION: Sets a single blue pixel at (455, 120).
; PLAN: r0=455(x), r1=120(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 455
LDI r1, 120
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
