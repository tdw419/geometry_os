; DESCRIPTION: Sets a single yellow pixel at (328, 172).
; PLAN: r0=328(x), r1=172(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 328
LDI r1, 172
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
