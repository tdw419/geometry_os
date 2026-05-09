; DESCRIPTION: Composite: Renders a magenta box of size 108x90 starting at (58, 62) then Creates a black circular shape at (74, 103) with radius 20 then Places a yellow line segment connecting (172, 207) to (304, 72).
; PLAN: r0=58(x), r1=62(y), r2=108(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x), r6=103(y), r7=20(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x1), r11=207(y1), r12=304(x2), r13=72(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 62
LDI r2, 108
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 103
LDI r7, 20
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 207
LDI r12, 304
LDI r13, 72
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
