; DESCRIPTION: Sets a single magenta pixel at (172, 21).
; PLAN: r0=172(x), r1=21(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 21
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
