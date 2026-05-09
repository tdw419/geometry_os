; DESCRIPTION: Composite: Places a blue line segment connecting (189, 84) to (348, 77) then Draws a white rectangle at (214, 57) with width 92 and height 31 then Creates a black circular shape at (172, 179) with radius 76.
; PLAN: r0=189(x1), r1=84(y1), r2=348(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=214(x), r6=57(y), r7=92(width), r8=31(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x), r11=179(y), r12=76(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 189
LDI r1, 84
LDI r2, 348
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 57
LDI r7, 92
LDI r8, 31
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 179
LDI r12, 76
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
