; DESCRIPTION: Places a orange dot at position (497, 91).
; PLAN: r0=497(x), r1=91(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 497
LDI r1, 91
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
