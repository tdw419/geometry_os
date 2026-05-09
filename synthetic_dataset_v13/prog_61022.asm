; DESCRIPTION: Sets a single yellow pixel at (50, 184).
; PLAN: r0=50(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 184
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
