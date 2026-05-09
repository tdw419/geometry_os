; DESCRIPTION: Sets a single cyan pixel at (440, 251).
; PLAN: r0=440(x), r1=251(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 440
LDI r1, 251
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
