; DESCRIPTION: Places a orange dot at position (88, 220).
; PLAN: r0=88(x), r1=220(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 88
LDI r1, 220
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
