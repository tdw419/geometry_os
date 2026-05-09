; DESCRIPTION: Sets a single green pixel at (193, 112).
; PLAN: r0=193(x), r1=112(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 193
LDI r1, 112
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
