; DESCRIPTION: Sets a single magenta pixel at (349, 144).
; PLAN: r0=349(x), r1=144(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 144
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
