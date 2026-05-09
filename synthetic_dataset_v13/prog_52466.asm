; DESCRIPTION: Sets a single green pixel at (258, 163).
; PLAN: r0=258(x), r1=163(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 258
LDI r1, 163
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
