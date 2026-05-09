; DESCRIPTION: Sets a single magenta pixel at (475, 196).
; PLAN: r0=475(x), r1=196(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 475
LDI r1, 196
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
