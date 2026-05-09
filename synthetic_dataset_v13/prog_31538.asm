; DESCRIPTION: Sets a single yellow pixel at (16, 253).
; PLAN: r0=16(x), r1=253(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 253
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
