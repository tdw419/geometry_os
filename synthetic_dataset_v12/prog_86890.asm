; DESCRIPTION: Places a blue dot at position (316, 62).
; PLAN: r0=316(x), r1=62(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 316
LDI r1, 62
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
