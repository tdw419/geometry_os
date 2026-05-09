; DESCRIPTION: Composite: Renders a orange disk with center (101, 136) and radius 25 then Places a white line segment connecting (93, 228) to (433, 35) then Draws a orange rectangle at (490, 40) with width 21 and height 88.
; PLAN: r0=101(x), r1=136(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=93(x1), r6=228(y1), r7=433(x2), r8=35(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=490(x), r11=40(y), r12=21(width), r13=88(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 136
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 93
LDI r6, 228
LDI r7, 433
LDI r8, 35
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 490
LDI r11, 40
LDI r12, 21
LDI r13, 88
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
