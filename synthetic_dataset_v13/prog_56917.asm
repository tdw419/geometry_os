; DESCRIPTION: Places a white dot at position (453, 129).
; PLAN: r0=453(x), r1=129(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 453
LDI r1, 129
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
