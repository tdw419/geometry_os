; DESCRIPTION: Sets a single orange pixel at (288, 62).
; PLAN: r0=288(x), r1=62(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 288
LDI r1, 62
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
