; DESCRIPTION: Composite: Draws a black rectangle at (192, 109) with width 101 and height 79 then Renders a yellow disk with center (433, 156) and radius 30 then Draws a magenta line from (109, 189) to (500, 228).
; PLAN: r0=192(x), r1=109(y), r2=101(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=156(y), r7=30(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=109(x1), r11=189(y1), r12=500(x2), r13=228(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 109
LDI r2, 101
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 156
LDI r7, 30
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 109
LDI r11, 189
LDI r12, 500
LDI r13, 228
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
