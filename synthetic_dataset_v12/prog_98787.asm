; DESCRIPTION: Sets a single magenta pixel at (95, 183).
; PLAN: r0=95(x), r1=183(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 95
LDI r1, 183
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
