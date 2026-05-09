; DESCRIPTION: Places a orange dot at position (414, 142).
; PLAN: r0=414(x), r1=142(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 414
LDI r1, 142
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
