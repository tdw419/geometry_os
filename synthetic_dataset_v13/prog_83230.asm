; DESCRIPTION: Sets a single orange pixel at (471, 6).
; PLAN: r0=471(x), r1=6(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 471
LDI r1, 6
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
