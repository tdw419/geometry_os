; DESCRIPTION: Sets a single orange pixel at (272, 172).
; PLAN: r0=272(x), r1=172(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 272
LDI r1, 172
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
