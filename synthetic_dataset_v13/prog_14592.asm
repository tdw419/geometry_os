; DESCRIPTION: Sets a single cyan pixel at (373, 5).
; PLAN: r0=373(x), r1=5(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 373
LDI r1, 5
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
