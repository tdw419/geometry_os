; DESCRIPTION: Sets a single magenta pixel at (91, 170).
; PLAN: r0=91(x), r1=170(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 91
LDI r1, 170
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
