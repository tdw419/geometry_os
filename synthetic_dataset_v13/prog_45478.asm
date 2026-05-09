; DESCRIPTION: Composite: Draws a blue rectangle at (26, 70) with width 71 and height 85 then Places a yellow line segment connecting (98, 27) to (290, 145) then Creates a magenta circular shape at (290, 170) with radius 25.
; PLAN: r0=26(x), r1=70(y), r2=71(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=27(y1), r7=290(x2), r8=145(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=290(x), r11=170(y), r12=25(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 70
LDI r2, 71
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 27
LDI r7, 290
LDI r8, 145
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 170
LDI r12, 25
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
