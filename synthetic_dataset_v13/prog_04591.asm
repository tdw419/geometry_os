; DESCRIPTION: Sets a single red pixel at (166, 185).
; PLAN: r0=166(x), r1=185(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 185
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
