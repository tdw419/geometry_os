; DESCRIPTION: Composite: Draws a red circle centered at (227, 203) with radius 39 then Draws a black rectangle at (317, 135) with width 11 and height 115 then Places a black line segment connecting (313, 140) to (199, 103).
; PLAN: r0=227(x), r1=203(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=317(x), r6=135(y), r7=11(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=313(x1), r11=140(y1), r12=199(x2), r13=103(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 203
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 317
LDI r6, 135
LDI r7, 11
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 140
LDI r12, 199
LDI r13, 103
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
