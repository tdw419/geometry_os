; DESCRIPTION: Sets a single green pixel at (47, 166).
; PLAN: r0=47(x), r1=166(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 166
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
