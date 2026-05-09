; DESCRIPTION: Sets a single green pixel at (307, 17).
; PLAN: r0=307(x), r1=17(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 307
LDI r1, 17
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
