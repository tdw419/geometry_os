; DESCRIPTION: Sets a single magenta pixel at (363, 118).
; PLAN: r0=363(x), r1=118(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 363
LDI r1, 118
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
