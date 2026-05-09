; DESCRIPTION: Draws a white circle centered at (197, 148) with radius 29.
; PLAN: r0=197(x), r1=148(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 148
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
