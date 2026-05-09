; DESCRIPTION: Sets a single cyan pixel at (332, 144).
; PLAN: r0=332(x), r1=144(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 332
LDI r1, 144
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
