; DESCRIPTION: Sets a single magenta pixel at (355, 195).
; PLAN: r0=355(x), r1=195(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 355
LDI r1, 195
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
