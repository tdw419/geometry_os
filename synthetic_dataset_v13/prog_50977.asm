; DESCRIPTION: Sets a single red pixel at (129, 71).
; PLAN: r0=129(x), r1=71(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 71
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
