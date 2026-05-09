; DESCRIPTION: Places a white circle of radius 15 at center (346, 53).
; PLAN: r0=346(x), r1=53(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 53
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
