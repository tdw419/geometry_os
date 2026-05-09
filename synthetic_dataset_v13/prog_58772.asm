; DESCRIPTION: Sets a single orange pixel at (182, 47).
; PLAN: r0=182(x), r1=47(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 182
LDI r1, 47
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
