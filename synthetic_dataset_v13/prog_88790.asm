; DESCRIPTION: Sets a single orange pixel at (464, 205).
; PLAN: r0=464(x), r1=205(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 464
LDI r1, 205
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
