; DESCRIPTION: Sets a single orange pixel at (340, 36).
; PLAN: r0=340(x), r1=36(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 340
LDI r1, 36
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
