; DESCRIPTION: Places a orange dot at position (183, 148).
; PLAN: r0=183(x), r1=148(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 183
LDI r1, 148
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
