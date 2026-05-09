; DESCRIPTION: Sets a single yellow pixel at (511, 42).
; PLAN: r0=511(x), r1=42(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 511
LDI r1, 42
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
