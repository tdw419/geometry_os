; DESCRIPTION: Places a orange dot at position (14, 129).
; PLAN: r0=14(x), r1=129(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 129
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
