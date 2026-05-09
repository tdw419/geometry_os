; DESCRIPTION: Places a orange dot at position (34, 239).
; PLAN: r0=34(x), r1=239(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 34
LDI r1, 239
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
