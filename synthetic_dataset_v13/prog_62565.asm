; DESCRIPTION: Draws a white circle centered at (300, 142) with radius 53.
; PLAN: r0=300(x), r1=142(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 142
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
