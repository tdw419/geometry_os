; DESCRIPTION: Places a orange dot at position (398, 204).
; PLAN: r0=398(x), r1=204(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 398
LDI r1, 204
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
