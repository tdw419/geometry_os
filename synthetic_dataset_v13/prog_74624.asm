; DESCRIPTION: Composite: Places a green 81x42 rectangle at position (199, 11) then Draws a orange circle centered at (170, 136) with radius 41 then Places a magenta line segment connecting (291, 169) to (175, 21).
; PLAN: r0=199(x), r1=11(y), r2=81(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=136(y), r7=41(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=291(x1), r11=169(y1), r12=175(x2), r13=21(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 199
LDI r1, 11
LDI r2, 81
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 136
LDI r7, 41
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 291
LDI r11, 169
LDI r12, 175
LDI r13, 21
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
