; DESCRIPTION: Sets a single cyan pixel at (430, 233).
; PLAN: r0=430(x), r1=233(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 233
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
