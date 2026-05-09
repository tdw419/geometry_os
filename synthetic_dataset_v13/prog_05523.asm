; DESCRIPTION: Sets a single cyan pixel at (7, 147).
; PLAN: r0=7(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 7
LDI r1, 147
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
