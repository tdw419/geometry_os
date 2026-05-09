; DESCRIPTION: Draws a white circle centered at (473, 121) with radius 35.
; PLAN: r0=473(x), r1=121(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 121
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
