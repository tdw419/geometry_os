; DESCRIPTION: Sets a single orange pixel at (305, 118).
; PLAN: r0=305(x), r1=118(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 305
LDI r1, 118
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
