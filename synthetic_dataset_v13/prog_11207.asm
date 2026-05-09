; DESCRIPTION: Sets a single green pixel at (225, 238).
; PLAN: r0=225(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 225
LDI r1, 238
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
