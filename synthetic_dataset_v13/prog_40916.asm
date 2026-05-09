; DESCRIPTION: Composite: Creates a magenta rectangular region at (415, 135) spanning 59 by 119 pixels then Creates a black circular shape at (365, 120) with radius 42 then Renders a black line between points (326, 80) and (316, 62).
; PLAN: r0=415(x), r1=135(y), r2=59(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=120(y), r7=42(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=326(x1), r11=80(y1), r12=316(x2), r13=62(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 135
LDI r2, 59
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 120
LDI r7, 42
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 326
LDI r11, 80
LDI r12, 316
LDI r13, 62
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
