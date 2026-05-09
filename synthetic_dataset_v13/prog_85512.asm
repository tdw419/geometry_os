; DESCRIPTION: Sets a single green pixel at (213, 122).
; PLAN: r0=213(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 213
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
