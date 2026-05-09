; DESCRIPTION: Draws a white circle centered at (328, 140) with radius 66.
; PLAN: r0=328(x), r1=140(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 140
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
