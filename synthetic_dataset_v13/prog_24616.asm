; DESCRIPTION: Sets a single green pixel at (493, 2).
; PLAN: r0=493(x), r1=2(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 493
LDI r1, 2
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
