; DESCRIPTION: Sets a single cyan pixel at (98, 135).
; PLAN: r0=98(x), r1=135(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 135
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
