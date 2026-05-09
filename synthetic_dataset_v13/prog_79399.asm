; DESCRIPTION: Composite: Renders a white line between points (264, 56) and (89, 29) then Places a orange circle of radius 62 at center (372, 175) then Draws a magenta rectangle at (92, 33) with width 96 and height 100.
; PLAN: r0=264(x1), r1=56(y1), r2=89(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=175(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x), r11=33(y), r12=96(width), r13=100(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 56
LDI r2, 89
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 175
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 33
LDI r12, 96
LDI r13, 100
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
