; DESCRIPTION: Places a orange dot at position (280, 84).
; PLAN: r0=280(x), r1=84(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 280
LDI r1, 84
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
