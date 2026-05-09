; DESCRIPTION: Composite: Renders a white line between points (235, 24) and (145, 58) then Draws a green rectangle at (375, 50) with width 44 and height 88 then Creates a yellow circular shape at (209, 78) with radius 36.
; PLAN: r0=235(x1), r1=24(y1), r2=145(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=50(y), r7=44(width), r8=88(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x), r11=78(y), r12=36(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 235
LDI r1, 24
LDI r2, 145
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 50
LDI r7, 44
LDI r8, 88
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 78
LDI r12, 36
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
