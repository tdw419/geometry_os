; DESCRIPTION: Sets a single cyan pixel at (246, 194).
; PLAN: r0=246(x), r1=194(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 194
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
