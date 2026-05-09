; DESCRIPTION: Places a orange dot at position (98, 104).
; PLAN: r0=98(x), r1=104(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 98
LDI r1, 104
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
