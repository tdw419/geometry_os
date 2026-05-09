; DESCRIPTION: Sets a single red pixel at (441, 130).
; PLAN: r0=441(x), r1=130(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 441
LDI r1, 130
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
