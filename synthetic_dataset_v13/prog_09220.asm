; DESCRIPTION: Places a orange dot at position (308, 95).
; PLAN: r0=308(x), r1=95(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 308
LDI r1, 95
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
