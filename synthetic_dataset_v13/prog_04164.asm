; DESCRIPTION: Sets a single blue pixel at (150, 33).
; PLAN: r0=150(x), r1=33(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 33
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
