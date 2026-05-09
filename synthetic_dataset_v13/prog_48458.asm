; DESCRIPTION: Composite: Draws a green rectangle at (21, 60) with width 56 and height 112 then Draws a purple circle centered at (258, 104) with radius 13.
; PLAN: r0=21(x), r1=60(y), r2=56(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=258(x), r6=104(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 21
LDI r1, 60
LDI r2, 56
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 104
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
