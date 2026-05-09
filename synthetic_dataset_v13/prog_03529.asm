; DESCRIPTION: Places a white circle of radius 53 at center (276, 155).
; PLAN: r0=276(x), r1=155(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 155
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
