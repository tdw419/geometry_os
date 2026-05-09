; DESCRIPTION: Sets a single orange pixel at (179, 244).
; PLAN: r0=179(x), r1=244(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 179
LDI r1, 244
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
