; DESCRIPTION: Draws a yellow circle centered at (121, 160) with radius 78.
; PLAN: r0=121(x), r1=160(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 160
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
