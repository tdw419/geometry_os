; DESCRIPTION: Composite: Renders a blue disk with center (272, 108) and radius 54 then Creates a green rectangular region at (40, 210) spanning 26 by 45 pixels then Places a magenta line segment connecting (353, 133) to (122, 247).
; PLAN: r0=272(x), r1=108(y), r2=54(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=210(y), r7=26(width), r8=45(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=353(x1), r11=133(y1), r12=122(x2), r13=247(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 108
LDI r2, 54
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 210
LDI r7, 26
LDI r8, 45
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 133
LDI r12, 122
LDI r13, 247
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
