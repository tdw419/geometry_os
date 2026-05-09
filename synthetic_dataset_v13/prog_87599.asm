; DESCRIPTION: Sets a single cyan pixel at (122, 241).
; PLAN: r0=122(x), r1=241(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 122
LDI r1, 241
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
