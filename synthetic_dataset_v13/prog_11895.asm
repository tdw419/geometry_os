; DESCRIPTION: Composite: Renders a red disk with center (178, 214) and radius 41 then Draws a red rectangle at (203, 110) with width 73 and height 25 then Places a white line segment connecting (179, 206) to (412, 100).
; PLAN: r0=178(x), r1=214(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=203(x), r6=110(y), r7=73(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=179(x1), r11=206(y1), r12=412(x2), r13=100(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 178
LDI r1, 214
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 203
LDI r6, 110
LDI r7, 73
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 179
LDI r11, 206
LDI r12, 412
LDI r13, 100
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
