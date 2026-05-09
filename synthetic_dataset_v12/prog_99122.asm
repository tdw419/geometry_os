; DESCRIPTION: Places a orange dot at position (166, 162).
; PLAN: r0=166(x), r1=162(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 166
LDI r1, 162
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
