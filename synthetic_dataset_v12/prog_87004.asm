; DESCRIPTION: Composite: Draws a red circle centered at (371, 167) with radius 67 then Creates a purple rectangular region at (16, 130) spanning 58 by 83 pixels then Places a blue line segment connecting (47, 0) to (340, 253).
; PLAN: r0=371(x), r1=167(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=16(x), r6=130(y), r7=58(width), r8=83(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x1), r11=0(y1), r12=340(x2), r13=253(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 371
LDI r1, 167
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 16
LDI r6, 130
LDI r7, 58
LDI r8, 83
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 0
LDI r12, 340
LDI r13, 253
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
