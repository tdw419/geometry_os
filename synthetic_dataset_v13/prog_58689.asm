; DESCRIPTION: Places a orange dot at position (390, 225).
; PLAN: r0=390(x), r1=225(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 390
LDI r1, 225
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
