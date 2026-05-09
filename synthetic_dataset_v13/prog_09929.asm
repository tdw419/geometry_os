; DESCRIPTION: Sets a single cyan pixel at (461, 188).
; PLAN: r0=461(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 461
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
