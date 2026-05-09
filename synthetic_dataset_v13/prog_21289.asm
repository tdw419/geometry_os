; DESCRIPTION: Draws a yellow circle centered at (161, 81) with radius 54.
; PLAN: r0=161(x), r1=81(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 81
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
