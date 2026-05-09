; DESCRIPTION: Sets a single green pixel at (150, 135).
; PLAN: r0=150(x), r1=135(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 150
LDI r1, 135
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
