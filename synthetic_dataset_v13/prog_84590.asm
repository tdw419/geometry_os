; DESCRIPTION: Composite: Draws a purple circle centered at (183, 192) with radius 28 then Places a white line segment connecting (407, 34) to (377, 68) then Places a blue 84x70 rectangle at position (7, 161).
; PLAN: r0=183(x), r1=192(y), r2=28(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=407(x1), r6=34(y1), r7=377(x2), r8=68(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=7(x), r11=161(y), r12=84(width), r13=70(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 192
LDI r2, 28
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 407
LDI r6, 34
LDI r7, 377
LDI r8, 68
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 7
LDI r11, 161
LDI r12, 84
LDI r13, 70
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
