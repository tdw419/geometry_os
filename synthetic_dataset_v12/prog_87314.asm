; DESCRIPTION: Sets a single green pixel at (500, 8).
; PLAN: r0=500(x), r1=8(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 500
LDI r1, 8
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
