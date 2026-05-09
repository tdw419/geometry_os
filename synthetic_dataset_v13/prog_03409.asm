; DESCRIPTION: Composite: Draws a black rectangle at (482, 147) with width 30 and height 101 then Creates a blue circular shape at (409, 106) with radius 13.
; PLAN: r0=482(x), r1=147(y), r2=30(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=106(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 482
LDI r1, 147
LDI r2, 30
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 106
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
