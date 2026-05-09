; DESCRIPTION: Sets a single orange pixel at (413, 136).
; PLAN: r0=413(x), r1=136(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 413
LDI r1, 136
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
