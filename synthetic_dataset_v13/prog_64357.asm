; DESCRIPTION: Sets a single green pixel at (219, 47).
; PLAN: r0=219(x), r1=47(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 219
LDI r1, 47
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
