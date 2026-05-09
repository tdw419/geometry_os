; DESCRIPTION: Sets a single green pixel at (425, 236).
; PLAN: r0=425(x), r1=236(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 425
LDI r1, 236
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
