; DESCRIPTION: Draws a yellow circle centered at (54, 96) with radius 47.
; PLAN: r0=54(x), r1=96(y), r2=47(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 96
LDI r2, 47
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
