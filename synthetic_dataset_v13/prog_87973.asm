; DESCRIPTION: Places a orange dot at position (459, 145).
; PLAN: r0=459(x), r1=145(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 459
LDI r1, 145
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
