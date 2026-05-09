; DESCRIPTION: Sets a single magenta pixel at (51, 226).
; PLAN: r0=51(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 51
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
