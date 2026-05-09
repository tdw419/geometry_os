; DESCRIPTION: Draws a yellow circle centered at (49, 56) with radius 29.
; PLAN: r0=49(x), r1=56(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 56
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
