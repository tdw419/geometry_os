; DESCRIPTION: Sets a single green pixel at (67, 205).
; PLAN: r0=67(x), r1=205(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 67
LDI r1, 205
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
