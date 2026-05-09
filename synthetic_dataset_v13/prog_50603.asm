; DESCRIPTION: Draws a yellow circle centered at (165, 105) with radius 57.
; PLAN: r0=165(x), r1=105(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 165
LDI r1, 105
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
