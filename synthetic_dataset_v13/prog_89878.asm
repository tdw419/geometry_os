; DESCRIPTION: Places a orange dot at position (56, 224).
; PLAN: r0=56(x), r1=224(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 56
LDI r1, 224
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
