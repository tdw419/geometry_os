; DESCRIPTION: Sets a single cyan pixel at (15, 172).
; PLAN: r0=15(x), r1=172(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 172
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
