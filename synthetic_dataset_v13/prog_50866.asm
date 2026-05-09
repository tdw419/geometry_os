; DESCRIPTION: Sets a single yellow pixel at (446, 18).
; PLAN: r0=446(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 446
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
