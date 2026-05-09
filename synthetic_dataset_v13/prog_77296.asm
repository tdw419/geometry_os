; DESCRIPTION: Sets a single green pixel at (335, 95).
; PLAN: r0=335(x), r1=95(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 335
LDI r1, 95
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
