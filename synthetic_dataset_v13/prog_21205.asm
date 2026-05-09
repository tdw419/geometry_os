; DESCRIPTION: Sets a single green pixel at (208, 82).
; PLAN: r0=208(x), r1=82(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 208
LDI r1, 82
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
