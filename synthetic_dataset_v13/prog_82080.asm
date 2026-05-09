; DESCRIPTION: Composite: Creates a white rectangular region at (215, 97) spanning 58 by 53 pixels then Draws a yellow line from (274, 203) to (399, 206) then Creates a blue circular shape at (171, 167) with radius 46.
; PLAN: r0=215(x), r1=97(y), r2=58(width), r3=53(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=274(x1), r6=203(y1), r7=399(x2), r8=206(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=171(x), r11=167(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 97
LDI r2, 58
LDI r3, 53
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 203
LDI r7, 399
LDI r8, 206
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 167
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
