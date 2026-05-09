; DESCRIPTION: Composite: Places a magenta 99x93 rectangle at position (270, 163) then Renders a orange line between points (101, 156) and (22, 254) then Renders a black disk with center (374, 154) and radius 28.
; PLAN: r0=270(x), r1=163(y), r2=99(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x1), r6=156(y1), r7=22(x2), r8=254(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=154(y), r12=28(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 270
LDI r1, 163
LDI r2, 99
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 156
LDI r7, 22
LDI r8, 254
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 154
LDI r12, 28
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
