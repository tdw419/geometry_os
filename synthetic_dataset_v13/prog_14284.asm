; DESCRIPTION: Draws a green circle centered at (152, 227) with radius 14.
; PLAN: r0=152(x), r1=227(y), r2=14(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 227
LDI r2, 14
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
