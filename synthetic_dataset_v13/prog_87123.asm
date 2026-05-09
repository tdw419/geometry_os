; DESCRIPTION: Sets a single red pixel at (25, 147).
; PLAN: r0=25(x), r1=147(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 25
LDI r1, 147
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
