; DESCRIPTION: Sets a single green pixel at (305, 217).
; PLAN: r0=305(x), r1=217(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 217
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
