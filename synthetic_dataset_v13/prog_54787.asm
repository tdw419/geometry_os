; DESCRIPTION: Sets a single cyan pixel at (311, 4).
; PLAN: r0=311(x), r1=4(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 311
LDI r1, 4
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
