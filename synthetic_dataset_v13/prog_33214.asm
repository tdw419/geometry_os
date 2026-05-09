; DESCRIPTION: Places a orange dot at position (246, 188).
; PLAN: r0=246(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 246
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
