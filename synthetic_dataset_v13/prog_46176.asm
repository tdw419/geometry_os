; DESCRIPTION: Places a orange dot at position (463, 15).
; PLAN: r0=463(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
