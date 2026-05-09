; DESCRIPTION: Composite: Places a purple circle of radius 22 at center (278, 63) then Renders a orange line between points (123, 175) and (402, 103) then Places a orange 30x89 rectangle at position (67, 105).
; PLAN: r0=278(x), r1=63(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x1), r6=175(y1), r7=402(x2), r8=103(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=105(y), r12=30(width), r13=89(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 63
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 175
LDI r7, 402
LDI r8, 103
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 105
LDI r12, 30
LDI r13, 89
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
