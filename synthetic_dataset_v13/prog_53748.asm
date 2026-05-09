; DESCRIPTION: Places a white circle of radius 13 at center (276, 95).
; PLAN: r0=276(x), r1=95(y), r2=13(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 95
LDI r2, 13
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
