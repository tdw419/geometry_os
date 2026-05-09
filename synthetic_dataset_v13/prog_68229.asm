; DESCRIPTION: Sets a single magenta pixel at (90, 233).
; PLAN: r0=90(x), r1=233(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 233
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
