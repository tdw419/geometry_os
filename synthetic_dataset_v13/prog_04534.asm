; DESCRIPTION: Places a white dot at position (331, 47).
; PLAN: r0=331(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 331
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
