; DESCRIPTION: Places a orange dot at position (50, 72).
; PLAN: r0=50(x), r1=72(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 50
LDI r1, 72
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
