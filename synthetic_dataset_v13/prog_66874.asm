; DESCRIPTION: Sets a single yellow pixel at (481, 131).
; PLAN: r0=481(x), r1=131(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 481
LDI r1, 131
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
