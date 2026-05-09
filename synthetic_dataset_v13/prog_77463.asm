; DESCRIPTION: Places a orange dot at position (407, 82).
; PLAN: r0=407(x), r1=82(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 82
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
