; DESCRIPTION: Sets a single red pixel at (129, 22).
; PLAN: r0=129(x), r1=22(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 22
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
