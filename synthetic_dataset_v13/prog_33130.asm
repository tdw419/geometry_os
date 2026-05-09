; DESCRIPTION: Places a orange dot at position (6, 167).
; PLAN: r0=6(x), r1=167(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 167
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
