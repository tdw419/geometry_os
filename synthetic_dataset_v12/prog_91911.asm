; DESCRIPTION: Composite: Creates a red rectangular region at (244, 20) spanning 91 by 112 pixels then Draws a red circle centered at (244, 77) with radius 23 then Renders a yellow line between points (97, 72) and (21, 112).
; PLAN: r0=244(x), r1=20(y), r2=91(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x), r6=77(y), r7=23(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x1), r11=72(y1), r12=21(x2), r13=112(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 20
LDI r2, 91
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 77
LDI r7, 23
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 72
LDI r12, 21
LDI r13, 112
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
