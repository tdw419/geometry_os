; DESCRIPTION: Places a orange dot at position (476, 15).
; PLAN: r0=476(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
