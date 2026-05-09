; DESCRIPTION: Sets a single yellow pixel at (202, 83).
; PLAN: r0=202(x), r1=83(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 202
LDI r1, 83
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
