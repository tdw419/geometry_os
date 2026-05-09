; DESCRIPTION: Sets a single cyan pixel at (490, 107).
; PLAN: r0=490(x), r1=107(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 490
LDI r1, 107
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
