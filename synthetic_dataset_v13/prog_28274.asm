; DESCRIPTION: Sets a single cyan pixel at (27, 183).
; PLAN: r0=27(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 27
LDI r1, 183
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
