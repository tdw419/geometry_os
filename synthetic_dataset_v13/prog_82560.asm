; DESCRIPTION: Sets a single cyan pixel at (366, 122).
; PLAN: r0=366(x), r1=122(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 366
LDI r1, 122
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
