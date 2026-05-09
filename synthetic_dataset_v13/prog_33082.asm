; DESCRIPTION: Composite: Draws a black line from (41, 64) to (372, 74) then Places a purple circle of radius 74 at center (316, 167) then Draws a red rectangle at (334, 184) with width 40 and height 10.
; PLAN: r0=41(x1), r1=64(y1), r2=372(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=167(y), r7=74(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=334(x), r11=184(y), r12=40(width), r13=10(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 64
LDI r2, 372
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 167
LDI r7, 74
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 334
LDI r11, 184
LDI r12, 40
LDI r13, 10
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
