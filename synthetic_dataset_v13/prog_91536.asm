; DESCRIPTION: Places a orange dot at position (489, 181).
; PLAN: r0=489(x), r1=181(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 489
LDI r1, 181
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
