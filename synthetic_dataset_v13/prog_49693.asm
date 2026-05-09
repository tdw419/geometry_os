; DESCRIPTION: Places a orange dot at position (19, 106).
; PLAN: r0=19(x), r1=106(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 106
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
