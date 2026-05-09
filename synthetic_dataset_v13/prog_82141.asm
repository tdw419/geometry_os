; DESCRIPTION: Composite: Places a yellow 40x24 rectangle at position (47, 181) then Places a orange line segment connecting (35, 223) to (338, 227) then Draws a black circle centered at (378, 120) with radius 13.
; PLAN: r0=47(x), r1=181(y), r2=40(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x1), r6=223(y1), r7=338(x2), r8=227(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=378(x), r11=120(y), r12=13(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 47
LDI r1, 181
LDI r2, 40
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 223
LDI r7, 338
LDI r8, 227
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 120
LDI r12, 13
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
