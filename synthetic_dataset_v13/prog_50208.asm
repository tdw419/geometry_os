; DESCRIPTION: Sets a single yellow pixel at (446, 3).
; PLAN: r0=446(x), r1=3(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 3
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
