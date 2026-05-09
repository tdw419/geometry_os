; DESCRIPTION: Places a white dot at position (438, 79).
; PLAN: r0=438(x), r1=79(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 438
LDI r1, 79
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
