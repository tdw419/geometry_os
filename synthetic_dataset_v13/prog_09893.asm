; DESCRIPTION: Places a orange dot at position (323, 178).
; PLAN: r0=323(x), r1=178(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 323
LDI r1, 178
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
