; DESCRIPTION: Places a white dot at position (373, 25).
; PLAN: r0=373(x), r1=25(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 373
LDI r1, 25
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
