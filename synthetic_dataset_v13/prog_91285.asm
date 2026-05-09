; DESCRIPTION: Places a orange dot at position (101, 122).
; PLAN: r0=101(x), r1=122(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 101
LDI r1, 122
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
