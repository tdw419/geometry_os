; DESCRIPTION: Sets a single magenta pixel at (423, 51).
; PLAN: r0=423(x), r1=51(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 423
LDI r1, 51
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
