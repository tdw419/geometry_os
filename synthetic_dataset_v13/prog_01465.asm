; DESCRIPTION: Sets a single orange pixel at (266, 223).
; PLAN: r0=266(x), r1=223(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 266
LDI r1, 223
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
