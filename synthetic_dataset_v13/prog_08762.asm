; DESCRIPTION: Sets a single yellow pixel at (313, 203).
; PLAN: r0=313(x), r1=203(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 313
LDI r1, 203
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
