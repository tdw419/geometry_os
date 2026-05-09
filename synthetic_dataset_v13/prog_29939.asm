; DESCRIPTION: Places a orange dot at position (158, 114).
; PLAN: r0=158(x), r1=114(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 158
LDI r1, 114
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
