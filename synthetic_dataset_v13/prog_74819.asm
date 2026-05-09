; DESCRIPTION: Composite: Draws a red rectangle at (302, 81) with width 62 and height 82 then Renders a green disk with center (205, 80) and radius 43 then Places a red line segment connecting (504, 77) to (15, 140).
; PLAN: r0=302(x), r1=81(y), r2=62(width), r3=82(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x), r6=80(y), r7=43(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=504(x1), r11=77(y1), r12=15(x2), r13=140(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 81
LDI r2, 62
LDI r3, 82
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 80
LDI r7, 43
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 504
LDI r11, 77
LDI r12, 15
LDI r13, 140
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
