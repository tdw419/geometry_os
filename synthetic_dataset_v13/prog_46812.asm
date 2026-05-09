; DESCRIPTION: Composite: Draws a white rectangle at (253, 83) with width 96 and height 49 then Places a yellow line segment connecting (174, 203) to (296, 90).
; PLAN: r0=253(x), r1=83(y), r2=96(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=174(x1), r6=203(y1), r7=296(x2), r8=90(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 83
LDI r2, 96
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 174
LDI r6, 203
LDI r7, 296
LDI r8, 90
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
