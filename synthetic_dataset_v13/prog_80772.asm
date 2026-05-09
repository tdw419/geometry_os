; DESCRIPTION: Composite: Creates a red circular shape at (140, 144) with radius 71 then Draws a blue rectangle at (123, 107) with width 96 and height 69 then Places a black line segment connecting (413, 221) to (296, 149).
; PLAN: r0=140(x), r1=144(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=123(x), r6=107(y), r7=96(width), r8=69(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x1), r11=221(y1), r12=296(x2), r13=149(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 144
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 123
LDI r6, 107
LDI r7, 96
LDI r8, 69
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 221
LDI r12, 296
LDI r13, 149
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
