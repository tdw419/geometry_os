; DESCRIPTION: Sets a single orange pixel at (268, 243).
; PLAN: r0=268(x), r1=243(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 268
LDI r1, 243
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
