; DESCRIPTION: Sets a single yellow pixel at (151, 221).
; PLAN: r0=151(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 151
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
