; DESCRIPTION: Places a orange dot at position (416, 243).
; PLAN: r0=416(x), r1=243(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 416
LDI r1, 243
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
