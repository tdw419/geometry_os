; DESCRIPTION: Sets a single green pixel at (74, 163).
; PLAN: r0=74(x), r1=163(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 163
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
