; DESCRIPTION: Sets a single red pixel at (407, 2).
; PLAN: r0=407(x), r1=2(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 2
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
