; DESCRIPTION: Places a orange dot at position (111, 123).
; PLAN: r0=111(x), r1=123(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 111
LDI r1, 123
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
