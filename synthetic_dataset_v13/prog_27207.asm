; DESCRIPTION: Sets a single yellow pixel at (418, 236).
; PLAN: r0=418(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
