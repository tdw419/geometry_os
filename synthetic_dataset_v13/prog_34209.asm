; DESCRIPTION: Sets a single red pixel at (176, 87).
; PLAN: r0=176(x), r1=87(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 87
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
