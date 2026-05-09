; DESCRIPTION: Composite: Places a purple line segment connecting (432, 30) to (464, 25) then Creates a white circular shape at (376, 148) with radius 25 then Draws a yellow rectangle at (257, 122) with width 37 and height 108.
; PLAN: r0=432(x1), r1=30(y1), r2=464(x2), r3=25(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=148(y), r7=25(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=257(x), r11=122(y), r12=37(width), r13=108(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 30
LDI r2, 464
LDI r3, 25
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 148
LDI r7, 25
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 257
LDI r11, 122
LDI r12, 37
LDI r13, 108
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
