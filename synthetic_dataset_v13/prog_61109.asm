; DESCRIPTION: Sets a single blue pixel at (329, 160).
; PLAN: r0=329(x), r1=160(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 160
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
