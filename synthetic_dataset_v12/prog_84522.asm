; DESCRIPTION: Draws a white circle centered at (54, 80) with radius 14.
; PLAN: r0=54(x), r1=80(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 80
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
