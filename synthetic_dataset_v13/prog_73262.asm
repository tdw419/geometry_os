; DESCRIPTION: Places a orange dot at position (259, 166).
; PLAN: r0=259(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 259
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
