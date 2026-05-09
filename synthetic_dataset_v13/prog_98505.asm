; DESCRIPTION: Sets a single magenta pixel at (180, 140).
; PLAN: r0=180(x), r1=140(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 140
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
