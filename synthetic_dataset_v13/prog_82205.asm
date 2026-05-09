; DESCRIPTION: Places a orange dot at position (137, 115).
; PLAN: r0=137(x), r1=115(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 137
LDI r1, 115
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
