; DESCRIPTION: Sets a single orange pixel at (338, 234).
; PLAN: r0=338(x), r1=234(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 338
LDI r1, 234
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
