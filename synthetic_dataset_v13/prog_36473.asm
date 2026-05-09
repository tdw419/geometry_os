; DESCRIPTION: Places a orange dot at position (216, 207).
; PLAN: r0=216(x), r1=207(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 216
LDI r1, 207
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
