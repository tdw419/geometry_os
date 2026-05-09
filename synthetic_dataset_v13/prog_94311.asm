; DESCRIPTION: Composite: Places a purple line segment connecting (253, 134) to (416, 143) then Creates a purple circular shape at (233, 112) with radius 20 then Places a magenta 69x70 rectangle at position (274, 181).
; PLAN: r0=253(x1), r1=134(y1), r2=416(x2), r3=143(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=233(x), r6=112(y), r7=20(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x), r11=181(y), r12=69(width), r13=70(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 134
LDI r2, 416
LDI r3, 143
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 112
LDI r7, 20
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 181
LDI r12, 69
LDI r13, 70
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
