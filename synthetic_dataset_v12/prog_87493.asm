; DESCRIPTION: Sets a single green pixel at (423, 200).
; PLAN: r0=423(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 423
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
