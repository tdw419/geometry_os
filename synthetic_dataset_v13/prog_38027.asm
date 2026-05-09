; DESCRIPTION: Places a white dot at position (430, 136).
; PLAN: r0=430(x), r1=136(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 430
LDI r1, 136
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
