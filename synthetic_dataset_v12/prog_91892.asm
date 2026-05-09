; DESCRIPTION: Places a white dot at position (501, 5).
; PLAN: r0=501(x), r1=5(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 501
LDI r1, 5
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
