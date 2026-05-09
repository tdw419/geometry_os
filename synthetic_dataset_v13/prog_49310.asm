; DESCRIPTION: Places a white dot at position (12, 129).
; PLAN: r0=12(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 12
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
