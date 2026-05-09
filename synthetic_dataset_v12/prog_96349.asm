; DESCRIPTION: Sets a single magenta pixel at (241, 188).
; PLAN: r0=241(x), r1=188(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 188
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
