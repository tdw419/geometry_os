; DESCRIPTION: Draws a blue circle centered at (161, 57) with radius 33.
; PLAN: r0=161(x), r1=57(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 57
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
