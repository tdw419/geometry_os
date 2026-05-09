; DESCRIPTION: Composite: Creates a purple circular shape at (412, 78) with radius 14 then Creates a purple rectangular region at (240, 2) spanning 62 by 79 pixels then Renders a cyan line between points (314, 226) and (506, 28).
; PLAN: r0=412(x), r1=78(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=2(y), r7=62(width), r8=79(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=314(x1), r11=226(y1), r12=506(x2), r13=28(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 78
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 2
LDI r7, 62
LDI r8, 79
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 226
LDI r12, 506
LDI r13, 28
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
