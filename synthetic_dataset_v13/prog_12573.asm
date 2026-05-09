; DESCRIPTION: Composite: Draws a white circle centered at (318, 67) with radius 60 then Places a orange 97x95 rectangle at position (124, 105) then Places a red line segment connecting (112, 164) to (117, 218).
; PLAN: r0=318(x), r1=67(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=124(x), r6=105(y), r7=97(width), r8=95(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=112(x1), r11=164(y1), r12=117(x2), r13=218(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 67
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 124
LDI r6, 105
LDI r7, 97
LDI r8, 95
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 164
LDI r12, 117
LDI r13, 218
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
