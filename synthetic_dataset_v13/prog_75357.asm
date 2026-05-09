; DESCRIPTION: Places a orange dot at position (407, 144).
; PLAN: r0=407(x), r1=144(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 407
LDI r1, 144
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
