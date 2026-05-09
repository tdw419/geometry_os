; DESCRIPTION: Sets a single orange pixel at (303, 22).
; PLAN: r0=303(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 303
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
