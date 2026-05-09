; DESCRIPTION: Sets a single red pixel at (33, 98).
; PLAN: r0=33(x), r1=98(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 33
LDI r1, 98
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
