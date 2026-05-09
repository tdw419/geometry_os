; DESCRIPTION: Sets a single green pixel at (463, 65).
; PLAN: r0=463(x), r1=65(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 65
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
