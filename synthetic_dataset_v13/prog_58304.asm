; DESCRIPTION: Composite: Draws a black rectangle at (85, 61) with width 60 and height 55 then Places a orange line segment connecting (5, 16) to (273, 49) then Renders a magenta disk with center (414, 193) and radius 60.
; PLAN: r0=85(x), r1=61(y), r2=60(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=5(x1), r6=16(y1), r7=273(x2), r8=49(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=414(x), r11=193(y), r12=60(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 61
LDI r2, 60
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 16
LDI r7, 273
LDI r8, 49
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 193
LDI r12, 60
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
