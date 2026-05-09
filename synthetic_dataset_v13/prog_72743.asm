; DESCRIPTION: Composite: Creates a yellow rectangular region at (320, 14) spanning 28 by 78 pixels then Draws a orange circle centered at (320, 146) with radius 64 then Places a red line segment connecting (357, 75) to (273, 191).
; PLAN: r0=320(x), r1=14(y), r2=28(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=146(y), r7=64(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x1), r11=75(y1), r12=273(x2), r13=191(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 14
LDI r2, 28
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 146
LDI r7, 64
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 75
LDI r12, 273
LDI r13, 191
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
