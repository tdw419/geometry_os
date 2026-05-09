; DESCRIPTION: Places a orange dot at position (236, 56).
; PLAN: r0=236(x), r1=56(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 56
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
