; DESCRIPTION: Places a orange dot at position (329, 199).
; PLAN: r0=329(x), r1=199(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 329
LDI r1, 199
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
