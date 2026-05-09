; DESCRIPTION: Sets a single green pixel at (284, 194).
; PLAN: r0=284(x), r1=194(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 284
LDI r1, 194
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
