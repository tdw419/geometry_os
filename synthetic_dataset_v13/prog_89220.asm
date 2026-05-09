; DESCRIPTION: Draws a yellow circle centered at (416, 75) with radius 72.
; PLAN: r0=416(x), r1=75(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 75
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
