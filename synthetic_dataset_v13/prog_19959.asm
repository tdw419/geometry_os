; DESCRIPTION: Sets a single red pixel at (102, 122).
; PLAN: r0=102(x), r1=122(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 102
LDI r1, 122
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
