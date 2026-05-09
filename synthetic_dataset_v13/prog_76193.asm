; DESCRIPTION: Composite: Draws a cyan rectangle at (390, 94) with width 91 and height 65 then Renders a magenta line between points (185, 76) and (265, 178) then Draws a green circle centered at (212, 110) with radius 75.
; PLAN: r0=390(x), r1=94(y), r2=91(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=76(y1), r7=265(x2), r8=178(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=212(x), r11=110(y), r12=75(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 390
LDI r1, 94
LDI r2, 91
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 76
LDI r7, 265
LDI r8, 178
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 212
LDI r11, 110
LDI r12, 75
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
