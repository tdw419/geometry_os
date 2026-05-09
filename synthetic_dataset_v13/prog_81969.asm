; DESCRIPTION: Composite: Places a blue circle of radius 61 at center (355, 130) then Draws a black rectangle at (47, 229) with width 98 and height 20 then Renders a magenta line between points (317, 91) and (110, 105).
; PLAN: r0=355(x), r1=130(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=229(y), r7=98(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x1), r11=91(y1), r12=110(x2), r13=105(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 130
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 229
LDI r7, 98
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 91
LDI r12, 110
LDI r13, 105
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
