; DESCRIPTION: Places a white dot at position (318, 199).
; PLAN: r0=318(x), r1=199(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 318
LDI r1, 199
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
