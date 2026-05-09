; DESCRIPTION: Places a orange dot at position (420, 55).
; PLAN: r0=420(x), r1=55(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 420
LDI r1, 55
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
