; DESCRIPTION: Sets a single cyan pixel at (74, 98).
; PLAN: r0=74(x), r1=98(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 74
LDI r1, 98
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
