; DESCRIPTION: Sets a single green pixel at (328, 74).
; PLAN: r0=328(x), r1=74(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 328
LDI r1, 74
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
