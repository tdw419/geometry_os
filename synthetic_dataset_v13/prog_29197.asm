; DESCRIPTION: Composite: Places a orange circle of radius 28 at center (467, 202) then Draws a yellow rectangle at (227, 123) with width 97 and height 116 then Places a white line segment connecting (100, 22) to (452, 247).
; PLAN: r0=467(x), r1=202(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=123(y), r7=97(width), r8=116(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=100(x1), r11=22(y1), r12=452(x2), r13=247(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 202
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 123
LDI r7, 97
LDI r8, 116
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 22
LDI r12, 452
LDI r13, 247
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
