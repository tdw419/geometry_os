; DESCRIPTION: Sets a single green pixel at (186, 86).
; PLAN: r0=186(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
