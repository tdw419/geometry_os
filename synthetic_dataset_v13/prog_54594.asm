; DESCRIPTION: Draws a green circle centered at (161, 121) with radius 54.
; PLAN: r0=161(x), r1=121(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 121
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
