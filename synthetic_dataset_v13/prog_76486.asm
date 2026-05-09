; DESCRIPTION: Composite: Draws a magenta rectangle at (269, 152) with width 85 and height 103 then Creates a magenta circular shape at (421, 158) with radius 64 then Places a yellow line segment connecting (91, 220) to (322, 241).
; PLAN: r0=269(x), r1=152(y), r2=85(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=158(y), r7=64(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=91(x1), r11=220(y1), r12=322(x2), r13=241(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 152
LDI r2, 85
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 158
LDI r7, 64
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 91
LDI r11, 220
LDI r12, 322
LDI r13, 241
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
