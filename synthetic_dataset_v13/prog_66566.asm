; DESCRIPTION: Composite: Places a green line segment connecting (86, 67) to (343, 251) then Draws a red rectangle at (20, 119) with width 95 and height 116 then Creates a blue circular shape at (469, 203) with radius 27.
; PLAN: r0=86(x1), r1=67(y1), r2=343(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=119(y), r7=95(width), r8=116(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=469(x), r11=203(y), r12=27(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 86
LDI r1, 67
LDI r2, 343
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 119
LDI r7, 95
LDI r8, 116
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 469
LDI r11, 203
LDI r12, 27
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
