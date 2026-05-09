; DESCRIPTION: Sets a single blue pixel at (362, 79).
; PLAN: r0=362(x), r1=79(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 362
LDI r1, 79
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
