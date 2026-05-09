; DESCRIPTION: Sets a single red pixel at (349, 99).
; PLAN: r0=349(x), r1=99(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 349
LDI r1, 99
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
