; DESCRIPTION: Places a white dot at position (47, 104).
; PLAN: r0=47(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 47
LDI r1, 104
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
