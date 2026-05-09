; DESCRIPTION: Composite: Creates a white rectangular region at (242, 103) spanning 106 by 74 pixels then Draws a white circle centered at (94, 52) with radius 13 then Renders a orange line between points (194, 112) and (416, 176).
; PLAN: r0=242(x), r1=103(y), r2=106(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=94(x), r6=52(y), r7=13(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x1), r11=112(y1), r12=416(x2), r13=176(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 103
LDI r2, 106
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 52
LDI r7, 13
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 112
LDI r12, 416
LDI r13, 176
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
