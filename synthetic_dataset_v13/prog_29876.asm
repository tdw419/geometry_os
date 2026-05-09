; DESCRIPTION: Places a orange dot at position (496, 198).
; PLAN: r0=496(x), r1=198(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 496
LDI r1, 198
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
