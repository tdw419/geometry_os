; DESCRIPTION: Sets a single cyan pixel at (334, 14).
; PLAN: r0=334(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 334
LDI r1, 14
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
