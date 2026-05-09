; DESCRIPTION: Draws a white circle centered at (162, 55) with radius 53.
; PLAN: r0=162(x), r1=55(y), r2=53(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 55
LDI r2, 53
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
