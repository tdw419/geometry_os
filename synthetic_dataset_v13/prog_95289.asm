; DESCRIPTION: Sets a single yellow pixel at (284, 77).
; PLAN: r0=284(x), r1=77(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 77
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
