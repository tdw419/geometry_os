; DESCRIPTION: Places a white dot at position (442, 112).
; PLAN: r0=442(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 442
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
