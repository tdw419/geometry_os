; DESCRIPTION: Sets a single orange pixel at (492, 156).
; PLAN: r0=492(x), r1=156(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 492
LDI r1, 156
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
