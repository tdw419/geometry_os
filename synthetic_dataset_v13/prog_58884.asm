; DESCRIPTION: Composite: Renders a magenta line between points (52, 223) and (318, 34) then Places a green 109x112 rectangle at position (304, 22) then Creates a black circular shape at (175, 208) with radius 43.
; PLAN: r0=52(x1), r1=223(y1), r2=318(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=304(x), r6=22(y), r7=109(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=175(x), r11=208(y), r12=43(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 223
LDI r2, 318
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 22
LDI r7, 109
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 208
LDI r12, 43
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
