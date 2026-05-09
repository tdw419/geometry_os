; DESCRIPTION: Sets a single blue pixel at (279, 162).
; PLAN: r0=279(x), r1=162(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 279
LDI r1, 162
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
