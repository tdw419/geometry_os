; DESCRIPTION: Places a orange dot at position (377, 165).
; PLAN: r0=377(x), r1=165(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 377
LDI r1, 165
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
