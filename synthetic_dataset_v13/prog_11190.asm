; DESCRIPTION: Places a white dot at position (142, 189).
; PLAN: r0=142(x), r1=189(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 189
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
