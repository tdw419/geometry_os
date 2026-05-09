; DESCRIPTION: Sets a single purple pixel at (489, 233).
; PLAN: r0=489(x), r1=233(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 489
LDI r1, 233
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
