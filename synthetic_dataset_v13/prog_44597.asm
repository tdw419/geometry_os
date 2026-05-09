; DESCRIPTION: Sets a single green pixel at (391, 48).
; PLAN: r0=391(x), r1=48(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 48
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
