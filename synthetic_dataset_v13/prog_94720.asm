; DESCRIPTION: Sets a single cyan pixel at (463, 114).
; PLAN: r0=463(x), r1=114(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 114
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
