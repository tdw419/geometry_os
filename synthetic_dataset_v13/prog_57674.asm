; DESCRIPTION: Places a orange dot at position (239, 131).
; PLAN: r0=239(x), r1=131(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 239
LDI r1, 131
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
