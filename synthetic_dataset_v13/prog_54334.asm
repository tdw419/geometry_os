; DESCRIPTION: Places a white circle of radius 45 at center (207, 53).
; PLAN: r0=207(x), r1=53(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 53
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
