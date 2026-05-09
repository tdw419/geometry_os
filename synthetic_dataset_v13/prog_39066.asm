; DESCRIPTION: Sets a single green pixel at (255, 56).
; PLAN: r0=255(x), r1=56(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 56
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
