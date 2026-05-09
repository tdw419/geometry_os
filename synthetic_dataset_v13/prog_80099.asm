; DESCRIPTION: Sets a single red pixel at (101, 229).
; PLAN: r0=101(x), r1=229(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 229
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
