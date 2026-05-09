; DESCRIPTION: Sets a single magenta pixel at (268, 16).
; PLAN: r0=268(x), r1=16(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 16
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
