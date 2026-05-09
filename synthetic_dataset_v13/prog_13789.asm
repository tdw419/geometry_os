; DESCRIPTION: Sets a single blue pixel at (265, 79).
; PLAN: r0=265(x), r1=79(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 265
LDI r1, 79
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
