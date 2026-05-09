; DESCRIPTION: Sets a single yellow pixel at (345, 109).
; PLAN: r0=345(x), r1=109(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 345
LDI r1, 109
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
