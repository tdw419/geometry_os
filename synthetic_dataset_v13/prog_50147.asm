; DESCRIPTION: Sets a single cyan pixel at (498, 213).
; PLAN: r0=498(x), r1=213(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 213
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
