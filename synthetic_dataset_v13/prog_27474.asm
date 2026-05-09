; DESCRIPTION: Sets a single green pixel at (117, 55).
; PLAN: r0=117(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 117
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
