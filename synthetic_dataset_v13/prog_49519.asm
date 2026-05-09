; DESCRIPTION: Sets a single cyan pixel at (167, 77).
; PLAN: r0=167(x), r1=77(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 77
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
