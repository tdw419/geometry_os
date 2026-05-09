; DESCRIPTION: Sets a single magenta pixel at (507, 0).
; PLAN: r0=507(x), r1=0(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 0
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
