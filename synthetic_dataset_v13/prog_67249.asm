; DESCRIPTION: Sets a single orange pixel at (23, 173).
; PLAN: r0=23(x), r1=173(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 23
LDI r1, 173
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
