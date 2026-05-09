; DESCRIPTION: Composite: Places a white line segment connecting (71, 253) to (203, 207) then Places a blue 49x36 rectangle at position (400, 116) then Draws a purple circle centered at (498, 142) with radius 14.
; PLAN: r0=71(x1), r1=253(y1), r2=203(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=116(y), r7=49(width), r8=36(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=498(x), r11=142(y), r12=14(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 71
LDI r1, 253
LDI r2, 203
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 116
LDI r7, 49
LDI r8, 36
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 498
LDI r11, 142
LDI r12, 14
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
