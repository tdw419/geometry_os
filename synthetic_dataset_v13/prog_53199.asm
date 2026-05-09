; DESCRIPTION: Sets a single green pixel at (382, 186).
; PLAN: r0=382(x), r1=186(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 382
LDI r1, 186
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
