; DESCRIPTION: Composite: Places a orange line segment connecting (499, 42) to (27, 28) then Renders a purple disk with center (172, 59) and radius 36 then Creates a black rectangular region at (102, 115) spanning 21 by 78 pixels.
; PLAN: r0=499(x1), r1=42(y1), r2=27(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=59(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=102(x), r11=115(y), r12=21(width), r13=78(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 42
LDI r2, 27
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 59
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 102
LDI r11, 115
LDI r12, 21
LDI r13, 78
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
