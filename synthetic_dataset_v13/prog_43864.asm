; DESCRIPTION: Draws a white circle centered at (179, 142) with radius 22.
; PLAN: r0=179(x), r1=142(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 142
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
