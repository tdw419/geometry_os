; DESCRIPTION: Sets a single orange pixel at (244, 160).
; PLAN: r0=244(x), r1=160(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 160
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
