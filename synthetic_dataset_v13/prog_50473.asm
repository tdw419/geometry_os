; DESCRIPTION: Sets a single orange pixel at (71, 146).
; PLAN: r0=71(x), r1=146(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 146
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
