; DESCRIPTION: Places a orange dot at position (463, 95).
; PLAN: r0=463(x), r1=95(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 463
LDI r1, 95
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
