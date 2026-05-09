; DESCRIPTION: Composite: Places a red line segment connecting (508, 158) to (352, 218) then Draws a magenta rectangle at (71, 49) with width 110 and height 58 then Creates a magenta circular shape at (225, 76) with radius 71.
; PLAN: r0=508(x1), r1=158(y1), r2=352(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=49(y), r7=110(width), r8=58(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x), r11=76(y), r12=71(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 508
LDI r1, 158
LDI r2, 352
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 49
LDI r7, 110
LDI r8, 58
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 76
LDI r12, 71
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
