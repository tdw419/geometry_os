; DESCRIPTION: Sets a single cyan pixel at (344, 191).
; PLAN: r0=344(x), r1=191(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 344
LDI r1, 191
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
