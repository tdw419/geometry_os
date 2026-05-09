; DESCRIPTION: Places a orange dot at position (255, 204).
; PLAN: r0=255(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 255
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
