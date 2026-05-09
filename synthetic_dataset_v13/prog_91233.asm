; DESCRIPTION: Places a white dot at position (227, 17).
; PLAN: r0=227(x), r1=17(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 227
LDI r1, 17
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
