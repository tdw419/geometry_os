; DESCRIPTION: Sets a single yellow pixel at (399, 168).
; PLAN: r0=399(x), r1=168(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 399
LDI r1, 168
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
