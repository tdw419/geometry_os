; DESCRIPTION: Composite: Renders a orange line between points (244, 246) and (169, 134) then Places a cyan 100x49 rectangle at position (257, 54) then Creates a magenta circular shape at (347, 39) with radius 24.
; PLAN: r0=244(x1), r1=246(y1), r2=169(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=257(x), r6=54(y), r7=100(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=347(x), r11=39(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 244
LDI r1, 246
LDI r2, 169
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 54
LDI r7, 100
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 39
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
