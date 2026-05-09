; DESCRIPTION: Places a orange dot at position (356, 122).
; PLAN: r0=356(x), r1=122(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 356
LDI r1, 122
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
