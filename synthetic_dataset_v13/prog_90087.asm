; DESCRIPTION: Draws a green circle centered at (154, 110) with radius 80.
; PLAN: r0=154(x), r1=110(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 154
LDI r1, 110
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
