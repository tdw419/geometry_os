; DESCRIPTION: Composite: Places a red line segment connecting (384, 72) to (96, 221) then Draws a orange rectangle at (351, 37) with width 96 and height 39 then Draws a purple circle centered at (85, 94) with radius 40.
; PLAN: r0=384(x1), r1=72(y1), r2=96(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=351(x), r6=37(y), r7=96(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x), r11=94(y), r12=40(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 384
LDI r1, 72
LDI r2, 96
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 351
LDI r6, 37
LDI r7, 96
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 94
LDI r12, 40
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
