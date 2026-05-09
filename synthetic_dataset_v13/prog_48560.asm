; DESCRIPTION: Sets a single cyan pixel at (258, 19).
; PLAN: r0=258(x), r1=19(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 258
LDI r1, 19
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
