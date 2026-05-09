; DESCRIPTION: Draws a white circle centered at (133, 84) with radius 76.
; PLAN: r0=133(x), r1=84(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 133
LDI r1, 84
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
