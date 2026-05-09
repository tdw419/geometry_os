; DESCRIPTION: Places a orange dot at position (411, 95).
; PLAN: r0=411(x), r1=95(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 411
LDI r1, 95
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
