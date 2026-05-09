; DESCRIPTION: Sets a single blue pixel at (24, 229).
; PLAN: r0=24(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 24
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
