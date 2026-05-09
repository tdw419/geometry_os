; DESCRIPTION: Sets a single red pixel at (391, 212).
; PLAN: r0=391(x), r1=212(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 391
LDI r1, 212
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
