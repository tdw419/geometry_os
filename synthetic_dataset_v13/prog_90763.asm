; DESCRIPTION: Sets a single magenta pixel at (128, 15).
; PLAN: r0=128(x), r1=15(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 128
LDI r1, 15
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
