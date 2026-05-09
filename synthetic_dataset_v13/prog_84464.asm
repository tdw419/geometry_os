; DESCRIPTION: Draws a yellow circle centered at (105, 121) with radius 63.
; PLAN: r0=105(x), r1=121(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 121
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
