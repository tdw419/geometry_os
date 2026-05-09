; DESCRIPTION: Places a white dot at position (381, 199).
; PLAN: r0=381(x), r1=199(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 381
LDI r1, 199
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
