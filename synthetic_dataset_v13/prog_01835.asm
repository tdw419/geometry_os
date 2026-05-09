; DESCRIPTION: Composite: Places a orange line segment connecting (412, 248) to (492, 103) then Creates a purple circular shape at (252, 107) with radius 26 then Draws a purple rectangle at (399, 67) with width 27 and height 103.
; PLAN: r0=412(x1), r1=248(y1), r2=492(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=252(x), r6=107(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=399(x), r11=67(y), r12=27(width), r13=103(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 248
LDI r2, 492
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 107
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 399
LDI r11, 67
LDI r12, 27
LDI r13, 103
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
