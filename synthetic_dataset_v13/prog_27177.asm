; DESCRIPTION: Places a orange dot at position (274, 219).
; PLAN: r0=274(x), r1=219(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 274
LDI r1, 219
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
