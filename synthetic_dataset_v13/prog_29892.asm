; DESCRIPTION: Composite: Draws a blue circle centered at (177, 123) with radius 50 then Draws a orange rectangle at (435, 100) with width 77 and height 36 then Places a red line segment connecting (452, 132) to (506, 189).
; PLAN: r0=177(x), r1=123(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=100(y), r7=77(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x1), r11=132(y1), r12=506(x2), r13=189(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 123
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 100
LDI r7, 77
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 132
LDI r12, 506
LDI r13, 189
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
