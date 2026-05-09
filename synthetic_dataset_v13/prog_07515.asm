; DESCRIPTION: Composite: Places a orange line segment connecting (414, 84) to (30, 188) then Places a white 11x101 rectangle at position (213, 146) then Renders a orange disk with center (56, 175) and radius 55.
; PLAN: r0=414(x1), r1=84(y1), r2=30(x2), r3=188(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=146(y), r7=11(width), r8=101(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=56(x), r11=175(y), r12=55(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 414
LDI r1, 84
LDI r2, 30
LDI r3, 188
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 146
LDI r7, 11
LDI r8, 101
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 175
LDI r12, 55
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
