; DESCRIPTION: Sets a single orange pixel at (154, 158).
; PLAN: r0=154(x), r1=158(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 158
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
