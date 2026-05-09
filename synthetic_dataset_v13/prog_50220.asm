; DESCRIPTION: Sets a single red pixel at (147, 44).
; PLAN: r0=147(x), r1=44(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 44
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
