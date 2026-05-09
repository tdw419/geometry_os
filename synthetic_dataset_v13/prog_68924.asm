; DESCRIPTION: Composite: Creates a white rectangular region at (252, 130) spanning 83 by 116 pixels then Places a purple line segment connecting (380, 29) to (278, 97) then Creates a white circular shape at (111, 66) with radius 56.
; PLAN: r0=252(x), r1=130(y), r2=83(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=380(x1), r6=29(y1), r7=278(x2), r8=97(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=111(x), r11=66(y), r12=56(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 252
LDI r1, 130
LDI r2, 83
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 29
LDI r7, 278
LDI r8, 97
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 111
LDI r11, 66
LDI r12, 56
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
