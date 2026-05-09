; DESCRIPTION: Composite: Renders a red line between points (303, 224) and (347, 181) then Creates a white circular shape at (112, 137) with radius 80 then Renders a orange box of size 39x115 starting at (355, 74).
; PLAN: r0=303(x1), r1=224(y1), r2=347(x2), r3=181(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=112(x), r6=137(y), r7=80(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x), r11=74(y), r12=39(width), r13=115(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 224
LDI r2, 347
LDI r3, 181
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 137
LDI r7, 80
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 74
LDI r12, 39
LDI r13, 115
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
