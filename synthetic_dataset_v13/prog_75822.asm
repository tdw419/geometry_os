; DESCRIPTION: Places a orange dot at position (510, 112).
; PLAN: r0=510(x), r1=112(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 510
LDI r1, 112
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
