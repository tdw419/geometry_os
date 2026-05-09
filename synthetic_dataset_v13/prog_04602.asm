; DESCRIPTION: Sets a single green pixel at (71, 62).
; PLAN: r0=71(x), r1=62(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 62
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
