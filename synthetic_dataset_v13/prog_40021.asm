; DESCRIPTION: Places a white dot at position (321, 129).
; PLAN: r0=321(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 321
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
