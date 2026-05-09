; DESCRIPTION: Sets a single cyan pixel at (335, 19).
; PLAN: r0=335(x), r1=19(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 335
LDI r1, 19
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
