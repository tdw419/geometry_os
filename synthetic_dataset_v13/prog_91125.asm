; DESCRIPTION: Sets a single cyan pixel at (39, 2).
; PLAN: r0=39(x), r1=2(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 39
LDI r1, 2
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
