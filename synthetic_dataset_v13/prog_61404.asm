; DESCRIPTION: Composite: Places a magenta circle of radius 19 at center (287, 66) then Places a blue 69x36 rectangle at position (375, 199) then Places a white line segment connecting (203, 151) to (191, 178).
; PLAN: r0=287(x), r1=66(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=199(y), r7=69(width), r8=36(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=203(x1), r11=151(y1), r12=191(x2), r13=178(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 66
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 199
LDI r7, 69
LDI r8, 36
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 151
LDI r12, 191
LDI r13, 178
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
