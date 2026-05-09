; DESCRIPTION: Sets a single cyan pixel at (424, 70).
; PLAN: r0=424(x), r1=70(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 424
LDI r1, 70
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
