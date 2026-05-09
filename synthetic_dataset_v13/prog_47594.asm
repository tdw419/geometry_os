; DESCRIPTION: Sets a single orange pixel at (380, 161).
; PLAN: r0=380(x), r1=161(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 380
LDI r1, 161
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
