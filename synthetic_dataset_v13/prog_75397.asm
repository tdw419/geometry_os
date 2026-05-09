; DESCRIPTION: Draws a yellow circle centered at (366, 69) with radius 57.
; PLAN: r0=366(x), r1=69(y), r2=57(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 69
LDI r2, 57
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
