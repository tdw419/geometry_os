; DESCRIPTION: Places a orange dot at position (314, 236).
; PLAN: r0=314(x), r1=236(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 314
LDI r1, 236
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
