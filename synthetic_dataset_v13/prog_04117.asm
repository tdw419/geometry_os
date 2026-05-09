; DESCRIPTION: Sets a single yellow pixel at (284, 220).
; PLAN: r0=284(x), r1=220(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 220
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
