; DESCRIPTION: Sets a single orange pixel at (302, 11).
; PLAN: r0=302(x), r1=11(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 302
LDI r1, 11
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
