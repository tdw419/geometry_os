; DESCRIPTION: Sets a single green pixel at (61, 187).
; PLAN: r0=61(x), r1=187(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 187
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
