; DESCRIPTION: Sets a single cyan pixel at (11, 115).
; PLAN: r0=11(x), r1=115(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 115
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
