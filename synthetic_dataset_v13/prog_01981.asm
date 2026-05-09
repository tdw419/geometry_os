; DESCRIPTION: Composite: Places a magenta circle of radius 15 at center (166, 211) then Renders a yellow line between points (142, 20) and (330, 100) then Renders a orange box of size 11x101 starting at (46, 136).
; PLAN: r0=166(x), r1=211(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x1), r6=20(y1), r7=330(x2), r8=100(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=46(x), r11=136(y), r12=11(width), r13=101(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 211
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 20
LDI r7, 330
LDI r8, 100
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 136
LDI r12, 11
LDI r13, 101
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
