; DESCRIPTION: Sets a single green pixel at (286, 189).
; PLAN: r0=286(x), r1=189(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 286
LDI r1, 189
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
