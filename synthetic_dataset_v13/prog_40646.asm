; DESCRIPTION: Draws a green circle centered at (209, 101) with radius 20.
; PLAN: r0=209(x), r1=101(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 209
LDI r1, 101
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
