; DESCRIPTION: Sets a single yellow pixel at (482, 184).
; PLAN: r0=482(x), r1=184(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 482
LDI r1, 184
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
