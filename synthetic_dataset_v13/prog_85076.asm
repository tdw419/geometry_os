; DESCRIPTION: Sets a single red pixel at (264, 211).
; PLAN: r0=264(x), r1=211(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 264
LDI r1, 211
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
