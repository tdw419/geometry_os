; DESCRIPTION: Places a orange dot at position (498, 130).
; PLAN: r0=498(x), r1=130(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 498
LDI r1, 130
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
