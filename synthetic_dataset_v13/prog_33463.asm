; DESCRIPTION: Sets a single green pixel at (185, 112).
; PLAN: r0=185(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 185
LDI r1, 112
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
