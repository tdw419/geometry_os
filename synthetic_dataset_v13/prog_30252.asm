; DESCRIPTION: Sets a single green pixel at (204, 61).
; PLAN: r0=204(x), r1=61(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 204
LDI r1, 61
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
