; DESCRIPTION: Sets a single green pixel at (449, 34).
; PLAN: r0=449(x), r1=34(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 449
LDI r1, 34
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
