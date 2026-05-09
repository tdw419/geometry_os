; DESCRIPTION: Composite: Draws a purple rectangle at (353, 154) with width 98 and height 101 then Creates a white circular shape at (200, 219) with radius 22.
; PLAN: r0=353(x), r1=154(y), r2=98(width), r3=101(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=200(x), r6=219(y), r7=22(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 154
LDI r2, 98
LDI r3, 101
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 219
LDI r7, 22
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
