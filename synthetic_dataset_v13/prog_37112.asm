; DESCRIPTION: Places a orange dot at position (275, 28).
; PLAN: r0=275(x), r1=28(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 275
LDI r1, 28
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
