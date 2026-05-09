; DESCRIPTION: Sets a single magenta pixel at (369, 60).
; PLAN: r0=369(x), r1=60(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 369
LDI r1, 60
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
