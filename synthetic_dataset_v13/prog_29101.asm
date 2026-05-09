; DESCRIPTION: Sets a single green pixel at (336, 179).
; PLAN: r0=336(x), r1=179(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 336
LDI r1, 179
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
