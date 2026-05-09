; DESCRIPTION: Places a orange dot at position (124, 90).
; PLAN: r0=124(x), r1=90(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 124
LDI r1, 90
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
