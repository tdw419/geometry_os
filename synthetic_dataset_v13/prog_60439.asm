; DESCRIPTION: Draws a green circle centered at (313, 196) with radius 29.
; PLAN: r0=313(x), r1=196(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 196
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
