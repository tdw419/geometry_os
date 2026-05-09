; DESCRIPTION: Places a orange dot at position (419, 115).
; PLAN: r0=419(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 419
LDI r1, 115
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
