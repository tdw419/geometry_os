; DESCRIPTION: Composite: Draws a black rectangle at (206, 134) with width 99 and height 49 then Creates a purple circular shape at (137, 94) with radius 58.
; PLAN: r0=206(x), r1=134(y), r2=99(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=94(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 134
LDI r2, 99
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 94
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
