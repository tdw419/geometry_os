; DESCRIPTION: Places a orange dot at position (120, 83).
; PLAN: r0=120(x), r1=83(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 83
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
