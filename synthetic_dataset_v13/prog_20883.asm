; DESCRIPTION: Composite: Draws a orange rectangle at (429, 178) with width 74 and height 37 then Creates a red circular shape at (179, 44) with radius 41 then Places a red line segment connecting (38, 8) to (299, 176).
; PLAN: r0=429(x), r1=178(y), r2=74(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=179(x), r6=44(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x1), r11=8(y1), r12=299(x2), r13=176(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 429
LDI r1, 178
LDI r2, 74
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 44
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 8
LDI r12, 299
LDI r13, 176
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
