; DESCRIPTION: Composite: Renders a blue box of size 54x109 starting at (348, 34) then Places a green circle of radius 12 at center (284, 29) then Draws a orange line from (301, 70) to (184, 201).
; PLAN: r0=348(x), r1=34(y), r2=54(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=29(y), r7=12(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=301(x1), r11=70(y1), r12=184(x2), r13=201(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 34
LDI r2, 54
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 29
LDI r7, 12
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 301
LDI r11, 70
LDI r12, 184
LDI r13, 201
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
