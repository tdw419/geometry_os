; DESCRIPTION: Sets a single magenta pixel at (306, 157).
; PLAN: r0=306(x), r1=157(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 306
LDI r1, 157
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
