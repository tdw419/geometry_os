; DESCRIPTION: Sets a single green pixel at (255, 72).
; PLAN: r0=255(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
