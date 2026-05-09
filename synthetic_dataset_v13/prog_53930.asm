; DESCRIPTION: Places a orange dot at position (192, 13).
; PLAN: r0=192(x), r1=13(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 192
LDI r1, 13
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
