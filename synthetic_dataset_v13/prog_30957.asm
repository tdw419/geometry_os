; DESCRIPTION: Sets a single red pixel at (323, 230).
; PLAN: r0=323(x), r1=230(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 230
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
