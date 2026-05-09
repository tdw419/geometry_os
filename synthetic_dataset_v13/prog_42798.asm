; DESCRIPTION: Sets a single orange pixel at (426, 126).
; PLAN: r0=426(x), r1=126(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 426
LDI r1, 126
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
