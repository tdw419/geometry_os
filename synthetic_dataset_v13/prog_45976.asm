; DESCRIPTION: Sets a single orange pixel at (203, 240).
; PLAN: r0=203(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 203
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
