; DESCRIPTION: Sets a single orange pixel at (178, 89).
; PLAN: r0=178(x), r1=89(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 178
LDI r1, 89
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
