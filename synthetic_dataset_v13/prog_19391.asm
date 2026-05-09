; DESCRIPTION: Sets a single cyan pixel at (189, 94).
; PLAN: r0=189(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 189
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
