; DESCRIPTION: Sets a single red pixel at (432, 214).
; PLAN: r0=432(x), r1=214(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 432
LDI r1, 214
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
