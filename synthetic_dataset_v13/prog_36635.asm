; DESCRIPTION: Sets a single cyan pixel at (427, 252).
; PLAN: r0=427(x), r1=252(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 427
LDI r1, 252
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
