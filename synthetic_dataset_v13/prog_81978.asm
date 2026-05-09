; DESCRIPTION: Composite: Creates a white rectangular region at (345, 12) spanning 115 by 84 pixels then Renders a magenta line between points (126, 111) and (375, 99) then Draws a magenta circle centered at (155, 175) with radius 62.
; PLAN: r0=345(x), r1=12(y), r2=115(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x1), r6=111(y1), r7=375(x2), r8=99(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=175(y), r12=62(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 345
LDI r1, 12
LDI r2, 115
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 111
LDI r7, 375
LDI r8, 99
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 175
LDI r12, 62
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
