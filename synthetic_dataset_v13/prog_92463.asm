; DESCRIPTION: Sets a single green pixel at (107, 246).
; PLAN: r0=107(x), r1=246(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 107
LDI r1, 246
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
