; DESCRIPTION: Places a blue dot at position (438, 9).
; PLAN: r0=438(x), r1=9(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 9
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
