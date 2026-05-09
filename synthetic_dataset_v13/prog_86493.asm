; DESCRIPTION: Sets a single cyan pixel at (268, 114).
; PLAN: r0=268(x), r1=114(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 114
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
