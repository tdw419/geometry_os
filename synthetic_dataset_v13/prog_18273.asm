; DESCRIPTION: Sets a single cyan pixel at (163, 189).
; PLAN: r0=163(x), r1=189(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 163
LDI r1, 189
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
