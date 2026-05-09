; DESCRIPTION: Sets a single yellow pixel at (209, 59).
; PLAN: r0=209(x), r1=59(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 59
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
