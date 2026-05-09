; DESCRIPTION: Places a orange dot at position (70, 167).
; PLAN: r0=70(x), r1=167(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 70
LDI r1, 167
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
