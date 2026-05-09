; DESCRIPTION: Composite: Places a purple line segment connecting (364, 52) to (385, 179) then Renders a black disk with center (300, 63) and radius 33 then Creates a yellow rectangular region at (412, 79) spanning 49 by 76 pixels.
; PLAN: r0=364(x1), r1=52(y1), r2=385(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=63(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=412(x), r11=79(y), r12=49(width), r13=76(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 364
LDI r1, 52
LDI r2, 385
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 63
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 412
LDI r11, 79
LDI r12, 49
LDI r13, 76
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
