; DESCRIPTION: Places a orange dot at position (367, 189).
; PLAN: r0=367(x), r1=189(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 367
LDI r1, 189
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
