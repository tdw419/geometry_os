; DESCRIPTION: Sets a single orange pixel at (507, 118).
; PLAN: r0=507(x), r1=118(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 507
LDI r1, 118
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
