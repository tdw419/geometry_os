; DESCRIPTION: Places a orange dot at position (452, 103).
; PLAN: r0=452(x), r1=103(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 452
LDI r1, 103
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
