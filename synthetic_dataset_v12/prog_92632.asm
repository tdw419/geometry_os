; DESCRIPTION: Sets a single blue pixel at (45, 30).
; PLAN: r0=45(x), r1=30(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 45
LDI r1, 30
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
