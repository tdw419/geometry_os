; DESCRIPTION: Composite: Places a orange circle of radius 42 at center (322, 122) then Renders a orange box of size 43x114 starting at (147, 137) then Places a blue line segment connecting (0, 24) to (14, 173).
; PLAN: r0=322(x), r1=122(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=137(y), r7=43(width), r8=114(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=0(x1), r11=24(y1), r12=14(x2), r13=173(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 322
LDI r1, 122
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 137
LDI r7, 43
LDI r8, 114
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 0
LDI r11, 24
LDI r12, 14
LDI r13, 173
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
