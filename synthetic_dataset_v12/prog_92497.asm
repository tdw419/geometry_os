; DESCRIPTION: Sets a single cyan pixel at (504, 110).
; PLAN: r0=504(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 504
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
