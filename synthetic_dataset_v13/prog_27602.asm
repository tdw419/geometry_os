; DESCRIPTION: Places a orange dot at position (441, 61).
; PLAN: r0=441(x), r1=61(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 441
LDI r1, 61
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
