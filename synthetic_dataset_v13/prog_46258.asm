; DESCRIPTION: Composite: Creates a red circular shape at (276, 24) with radius 22 then Draws a cyan rectangle at (194, 19) with width 66 and height 49 then Places a red line segment connecting (158, 106) to (84, 189).
; PLAN: r0=276(x), r1=24(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x), r6=19(y), r7=66(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=158(x1), r11=106(y1), r12=84(x2), r13=189(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 24
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 19
LDI r7, 66
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 106
LDI r12, 84
LDI r13, 189
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
