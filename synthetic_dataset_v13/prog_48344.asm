; DESCRIPTION: Places a orange dot at position (2, 8).
; PLAN: r0=2(x), r1=8(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 2
LDI r1, 8
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
