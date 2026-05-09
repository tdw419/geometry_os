; DESCRIPTION: Composite: Places a purple 46x65 rectangle at position (253, 185) then Creates a yellow circular shape at (279, 135) with radius 32 then Places a purple line segment connecting (252, 14) to (457, 22).
; PLAN: r0=253(x), r1=185(y), r2=46(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=279(x), r6=135(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=252(x1), r11=14(y1), r12=457(x2), r13=22(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 185
LDI r2, 46
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 135
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 252
LDI r11, 14
LDI r12, 457
LDI r13, 22
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
