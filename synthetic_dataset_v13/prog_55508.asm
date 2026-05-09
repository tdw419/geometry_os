; DESCRIPTION: Sets a single orange pixel at (109, 82).
; PLAN: r0=109(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 109
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
