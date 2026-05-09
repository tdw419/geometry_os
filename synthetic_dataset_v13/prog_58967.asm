; DESCRIPTION: Draws a green circle centered at (138, 94) with radius 55.
; PLAN: r0=138(x), r1=94(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 94
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
