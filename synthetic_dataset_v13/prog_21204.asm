; DESCRIPTION: Composite: Creates a black circular shape at (423, 164) with radius 73 then Renders a black line between points (30, 7) and (451, 250) then Draws a magenta rectangle at (189, 95) with width 12 and height 54.
; PLAN: r0=423(x), r1=164(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=7(y1), r7=451(x2), r8=250(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=95(y), r12=12(width), r13=54(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 164
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 7
LDI r7, 451
LDI r8, 250
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 95
LDI r12, 12
LDI r13, 54
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
