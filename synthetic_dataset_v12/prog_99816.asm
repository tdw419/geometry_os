; DESCRIPTION: Sets a single yellow pixel at (135, 55).
; PLAN: r0=135(x), r1=55(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 135
LDI r1, 55
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
