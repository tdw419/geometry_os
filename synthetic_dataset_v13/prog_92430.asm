; DESCRIPTION: Sets a single yellow pixel at (398, 15).
; PLAN: r0=398(x), r1=15(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 15
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
