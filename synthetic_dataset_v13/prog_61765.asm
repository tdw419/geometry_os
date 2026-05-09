; DESCRIPTION: Composite: Draws a purple circle centered at (415, 56) with radius 34 then Creates a black rectangular region at (134, 127) spanning 28 by 97 pixels then Places a blue line segment connecting (439, 10) to (494, 113).
; PLAN: r0=415(x), r1=56(y), r2=34(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x), r6=127(y), r7=28(width), r8=97(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=439(x1), r11=10(y1), r12=494(x2), r13=113(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 56
LDI r2, 34
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 127
LDI r7, 28
LDI r8, 97
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 10
LDI r12, 494
LDI r13, 113
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
