; DESCRIPTION: Places a orange dot at position (5, 159).
; PLAN: r0=5(x), r1=159(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 5
LDI r1, 159
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
