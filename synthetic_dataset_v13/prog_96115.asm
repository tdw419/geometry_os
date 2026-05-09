; DESCRIPTION: Places a orange dot at position (453, 64).
; PLAN: r0=453(x), r1=64(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 64
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
