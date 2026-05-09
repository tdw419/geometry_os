; DESCRIPTION: Composite: Draws a white line from (85, 116) to (464, 33) then Renders a red disk with center (395, 110) and radius 47 then Draws a magenta rectangle at (473, 119) with width 23 and height 59.
; PLAN: r0=85(x1), r1=116(y1), r2=464(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=110(y), r7=47(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=473(x), r11=119(y), r12=23(width), r13=59(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 116
LDI r2, 464
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 110
LDI r7, 47
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 473
LDI r11, 119
LDI r12, 23
LDI r13, 59
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
