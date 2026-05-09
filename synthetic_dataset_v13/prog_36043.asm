; DESCRIPTION: Places a white circle of radius 15 at center (198, 183).
; PLAN: r0=198(x), r1=183(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 183
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
