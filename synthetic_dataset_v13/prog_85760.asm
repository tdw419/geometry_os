; DESCRIPTION: Sets a single magenta pixel at (426, 195).
; PLAN: r0=426(x), r1=195(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 426
LDI r1, 195
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
