; DESCRIPTION: Places a orange dot at position (473, 111).
; PLAN: r0=473(x), r1=111(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 473
LDI r1, 111
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
