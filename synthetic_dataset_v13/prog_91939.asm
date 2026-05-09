; DESCRIPTION: Sets a single orange pixel at (509, 84).
; PLAN: r0=509(x), r1=84(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 509
LDI r1, 84
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
