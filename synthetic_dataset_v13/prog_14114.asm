; DESCRIPTION: Sets a single green pixel at (166, 143).
; PLAN: r0=166(x), r1=143(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 143
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
