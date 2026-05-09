; DESCRIPTION: Places a black circle of radius 61 at center (276, 85).
; PLAN: r0=276(x), r1=85(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 85
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
