; DESCRIPTION: Sets a single yellow pixel at (88, 174).
; PLAN: r0=88(x), r1=174(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 174
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
