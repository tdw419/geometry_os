; DESCRIPTION: Sets a single orange pixel at (186, 65).
; PLAN: r0=186(x), r1=65(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 186
LDI r1, 65
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
