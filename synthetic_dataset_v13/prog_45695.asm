; DESCRIPTION: Composite: Places a yellow line segment connecting (26, 74) to (91, 176) then Renders a magenta box of size 56x84 starting at (65, 29) then Renders a blue disk with center (104, 134) and radius 52.
; PLAN: r0=26(x1), r1=74(y1), r2=91(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=29(y), r7=56(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x), r11=134(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 26
LDI r1, 74
LDI r2, 91
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 29
LDI r7, 56
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 134
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
