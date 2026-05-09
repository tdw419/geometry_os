; DESCRIPTION: Places a orange dot at position (94, 240).
; PLAN: r0=94(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 94
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
