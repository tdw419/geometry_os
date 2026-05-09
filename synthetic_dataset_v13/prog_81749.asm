; DESCRIPTION: Composite: Places a yellow line segment connecting (116, 174) to (125, 125) then Places a white 114x45 rectangle at position (375, 63) then Creates a magenta circular shape at (176, 137) with radius 76.
; PLAN: r0=116(x1), r1=174(y1), r2=125(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=63(y), r7=114(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=137(y), r12=76(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 116
LDI r1, 174
LDI r2, 125
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 63
LDI r7, 114
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 137
LDI r12, 76
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
