; DESCRIPTION: Sets a single red pixel at (18, 248).
; PLAN: r0=18(x), r1=248(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 248
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
