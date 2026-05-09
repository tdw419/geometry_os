; DESCRIPTION: Sets a single orange pixel at (330, 136).
; PLAN: r0=330(x), r1=136(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 330
LDI r1, 136
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
