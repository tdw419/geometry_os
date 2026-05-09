; DESCRIPTION: Places a orange dot at position (448, 38).
; PLAN: r0=448(x), r1=38(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 448
LDI r1, 38
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
