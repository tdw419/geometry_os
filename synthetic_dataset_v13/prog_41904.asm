; DESCRIPTION: Composite: Renders a blue disk with center (314, 163) and radius 16 then Places a blue line segment connecting (64, 237) to (313, 208) then Creates a black rectangular region at (80, 40) spanning 87 by 68 pixels.
; PLAN: r0=314(x), r1=163(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=64(x1), r6=237(y1), r7=313(x2), r8=208(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=40(y), r12=87(width), r13=68(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 314
LDI r1, 163
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 64
LDI r6, 237
LDI r7, 313
LDI r8, 208
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 40
LDI r12, 87
LDI r13, 68
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
