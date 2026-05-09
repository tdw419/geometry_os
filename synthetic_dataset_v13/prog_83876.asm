; DESCRIPTION: Sets a single orange pixel at (123, 9).
; PLAN: r0=123(x), r1=9(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 123
LDI r1, 9
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
