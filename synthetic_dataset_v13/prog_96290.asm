; DESCRIPTION: Draws a white circle centered at (288, 159) with radius 56.
; PLAN: r0=288(x), r1=159(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 159
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
