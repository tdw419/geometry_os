; DESCRIPTION: Places a orange dot at position (478, 70).
; PLAN: r0=478(x), r1=70(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 478
LDI r1, 70
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
