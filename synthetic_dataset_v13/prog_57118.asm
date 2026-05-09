; DESCRIPTION: Sets a single red pixel at (469, 34).
; PLAN: r0=469(x), r1=34(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 469
LDI r1, 34
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
