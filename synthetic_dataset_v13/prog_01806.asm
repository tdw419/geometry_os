; DESCRIPTION: Draws a yellow circle centered at (125, 198) with radius 52.
; PLAN: r0=125(x), r1=198(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 198
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
