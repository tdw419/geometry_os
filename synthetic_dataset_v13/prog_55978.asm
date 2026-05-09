; DESCRIPTION: Composite: Draws a orange rectangle at (49, 35) with width 106 and height 93 then Creates a black circular shape at (296, 92) with radius 67 then Draws a green line from (432, 39) to (42, 109).
; PLAN: r0=49(x), r1=35(y), r2=106(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=296(x), r6=92(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=432(x1), r11=39(y1), r12=42(x2), r13=109(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 35
LDI r2, 106
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 92
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 432
LDI r11, 39
LDI r12, 42
LDI r13, 109
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
