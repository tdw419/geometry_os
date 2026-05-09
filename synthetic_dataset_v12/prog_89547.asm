; DESCRIPTION: Places a white dot at position (476, 47).
; PLAN: r0=476(x), r1=47(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 476
LDI r1, 47
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
