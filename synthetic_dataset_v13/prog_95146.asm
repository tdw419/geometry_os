; DESCRIPTION: Composite: Creates a yellow circular shape at (254, 115) with radius 72 then Renders a yellow line between points (393, 59) and (426, 109) then Creates a white rectangular region at (366, 40) spanning 35 by 65 pixels.
; PLAN: r0=254(x), r1=115(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x1), r6=59(y1), r7=426(x2), r8=109(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=40(y), r12=35(width), r13=65(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 254
LDI r1, 115
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 59
LDI r7, 426
LDI r8, 109
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 40
LDI r12, 35
LDI r13, 65
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
