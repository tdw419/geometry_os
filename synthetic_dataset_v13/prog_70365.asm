; DESCRIPTION: Sets a single magenta pixel at (384, 2).
; PLAN: r0=384(x), r1=2(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 384
LDI r1, 2
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
