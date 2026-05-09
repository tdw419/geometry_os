; DESCRIPTION: Sets a single cyan pixel at (25, 87).
; PLAN: r0=25(x), r1=87(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 87
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
