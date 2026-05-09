; DESCRIPTION: Places a white dot at position (276, 119).
; PLAN: r0=276(x), r1=119(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 276
LDI r1, 119
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
