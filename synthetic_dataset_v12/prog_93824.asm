; DESCRIPTION: Composite: Draws a yellow rectangle at (201, 78) with width 22 and height 32 then Draws a blue circle centered at (464, 139) with radius 35.
; PLAN: r0=201(x), r1=78(y), r2=22(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=464(x), r6=139(y), r7=35(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 201
LDI r1, 78
LDI r2, 22
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 139
LDI r7, 35
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
