; DESCRIPTION: Sets a single orange pixel at (352, 97).
; PLAN: r0=352(x), r1=97(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 352
LDI r1, 97
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
