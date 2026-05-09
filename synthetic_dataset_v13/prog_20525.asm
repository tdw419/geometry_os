; DESCRIPTION: Sets a single red pixel at (418, 246).
; PLAN: r0=418(x), r1=246(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 418
LDI r1, 246
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
