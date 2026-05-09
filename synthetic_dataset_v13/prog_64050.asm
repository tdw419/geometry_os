; DESCRIPTION: Sets a single cyan pixel at (41, 179).
; PLAN: r0=41(x), r1=179(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 41
LDI r1, 179
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
