; DESCRIPTION: Sets a single cyan pixel at (8, 249).
; PLAN: r0=8(x), r1=249(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 8
LDI r1, 249
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
