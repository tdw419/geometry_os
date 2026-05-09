; DESCRIPTION: Places a orange dot at position (112, 112).
; PLAN: r0=112(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 112
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
