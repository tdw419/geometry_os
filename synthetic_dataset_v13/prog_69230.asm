; DESCRIPTION: Sets a single red pixel at (58, 21).
; PLAN: r0=58(x), r1=21(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 58
LDI r1, 21
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
