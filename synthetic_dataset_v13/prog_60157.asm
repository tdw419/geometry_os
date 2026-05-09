; DESCRIPTION: Draws a white circle centered at (435, 141) with radius 44.
; PLAN: r0=435(x), r1=141(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 141
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
