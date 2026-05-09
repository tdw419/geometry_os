; DESCRIPTION: Places a orange dot at position (226, 200).
; PLAN: r0=226(x), r1=200(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 226
LDI r1, 200
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
