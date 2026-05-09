; DESCRIPTION: Draws a white circle centered at (129, 66) with radius 65.
; PLAN: r0=129(x), r1=66(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 129
LDI r1, 66
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
