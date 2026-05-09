; DESCRIPTION: Sets a single magenta pixel at (478, 134).
; PLAN: r0=478(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
