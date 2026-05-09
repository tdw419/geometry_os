; DESCRIPTION: Draws a green circle centered at (101, 144) with radius 80.
; PLAN: r0=101(x), r1=144(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 144
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
