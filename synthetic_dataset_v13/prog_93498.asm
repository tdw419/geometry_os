; DESCRIPTION: Sets a single magenta pixel at (126, 26).
; PLAN: r0=126(x), r1=26(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 26
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
