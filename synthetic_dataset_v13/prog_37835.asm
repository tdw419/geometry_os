; DESCRIPTION: Sets a single orange pixel at (162, 238).
; PLAN: r0=162(x), r1=238(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 162
LDI r1, 238
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
