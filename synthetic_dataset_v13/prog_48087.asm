; DESCRIPTION: Sets a single cyan pixel at (146, 97).
; PLAN: r0=146(x), r1=97(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 97
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
