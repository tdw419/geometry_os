; DESCRIPTION: Sets a single yellow pixel at (93, 95).
; PLAN: r0=93(x), r1=95(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 93
LDI r1, 95
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
