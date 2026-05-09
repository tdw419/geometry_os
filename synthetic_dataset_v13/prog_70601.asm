; DESCRIPTION: Sets a single green pixel at (344, 150).
; PLAN: r0=344(x), r1=150(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 150
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
